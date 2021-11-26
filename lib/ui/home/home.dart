import 'dart:developer';
//import 'dart:js';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note/controller/note_controller.dart';
import 'package:note/model/note.dart';
import 'package:note/ui/my_drawer/my_drawer.dart';
import 'package:note/ui/note_view/note_view.dart';
import 'package:search_page/search_page.dart';

// class Note {
//   final String title, body;
//   final String date;

//   Note(this.title, this.body, this.date);
// }

// List<Note> note = [
//   Note('Note1', 'ခရမ်းချဉ်သီး ', '5.11.2021'),
//   Note('Note2', 'ရုံးပလွေသီး', '8.11.2021'),
//   Note('Note3', 'Books', '11.11.2021'),
//   Note('Note4', 'ILETS', '27.11.2021'),
// ];

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final NoteController controller = Get.put(NoteController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: MyHeaderDrawer(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.clear();
          Get.toNamed("/add");
          // Get.snackbar("+", "Add Note");
        },
        child: const Icon(Icons.add),
      ),
      backgroundColor: Colors.white.withOpacity(0.9),
      appBar: _myAppBar(context),
      body: Obx(() => ListView.builder(
          itemCount: controller.notes.length,
          itemBuilder: (ctx, idx) {
            return _noteRow(context, idx);
          })),
    );
  }

  _myAppBar(BuildContext context) {
    return AppBar(
      elevation: 0.5,
      backgroundColor: Colors.white.withOpacity(0.9),
      iconTheme: IconThemeData(color: Colors.red),
      // leading: IconButton(
      //   icon: const Icon(
      //     Icons.menu,
      //     color: Colors.black,
      //   ),
      //   onPressed: () {},
      // ),
      title: const Text(
        'All notes',
        style: TextStyle(color: Colors.black),
      ),

      actions: [
        Obx(
          () => IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black,
                semanticLabel: controller.notes.length.toString(),
              ),

              // child: Text(controller.notes.length.toString()),
              onPressed: () {
                controller.searchNoteByTitle();
                showSearch(
                    context: context,
                    delegate: SearchPage<Note>(
                      onQueryUpdate: (s) => log(s),
                      items: controller.notes,
                      searchLabel: 'Search',
                      suggestion: Center(
                        child: Text('No recent searches'),
                      ),
                      failure: Center(
                        child: Text('No results found :('),
                      ),
                      filter: (note) => [note.title, note.note, note.createAt],
                      builder: (note) => ListTile(
                        title: Text(note.title.toString()),
                        subtitle: Text(note.note.toString()),
                        trailing: Text('${note.createAt}'),
                      ),
                    ));
              }),
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              color: Colors.black,
            )),
      ],
    );
  }

  _noteRow(context, idx) {
    return InkWell(
      onTap: () {
        Get.toNamed('/noteView', arguments: idx);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          trailing: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                  onPressed: () {
                    controller.favoriteById(
                        favoriteInvert(
                            controller.notes[idx].favourite!.toInt()),
                        idx + 1);
                    print(controller.notes[idx].favourite);
                  },
                  icon: controller.notes[idx].favourite == 0
                      ? Icon(Icons.favorite_border)
                      : Icon(Icons.favorite)),
              IconButton(
                  onPressed: () {
                    Get.toNamed('/edit', arguments: idx + 1);
                  },
                  icon: const Icon(Icons.edit, color: Colors.indigo)),
              IconButton(
                onPressed: () {
                  Get.defaultDialog(
                      barrierDismissible: false,
                      title: "Are you sure want to delete?",
                      content: Text(
                        controller.notes[idx].title.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      confirm: ElevatedButton(
                        onPressed: () {
                          controller.deleteNoteById(controller.notes[idx].id!);
                          Get.back();
                        },
                        child: const Text("OK"),
                      ),
                      cancel: ElevatedButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text("cancel")));
                },
                icon: const Icon(Icons.delete_forever, color: Colors.red),
              ),
              // StarButton(
              //     iconSize: 15,
              //     isStarred: false,
              //     valueChanged: (_isStarred) {
              //       print('Is Starred : $_isStarred');
              //     })
            ],
          ),
          tileColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          isThreeLine: true,
          title: Text(
            trimString(
              text: controller.notes[idx].title.toString(),
            ),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(trimString(
                text: controller.notes[idx].note.toString(),
              )),
              Text(
                trimString(
                  text: controller.notes[idx].createAt.toString(),
                ),
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String trimString({required String text}) {
    if (text.length > 30) {
      var trimText = text.substring(0, 28) + "...";
      log(trimText);
      return trimText;
    } else {
      log(text);
      return text;
    }
  }

  int favoriteInvert(int value) {
    return value == 0 ? 1 : 0;
  }
}

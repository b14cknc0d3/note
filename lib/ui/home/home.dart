import 'dart:developer';
//import 'dart:js';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note/controller/note_controller.dart';
import 'package:note/model/note.dart';
import 'package:note/ui/my_drawer/my_drawer.dart';
import 'package:note/ui/note_view/note_view.dart';
import 'package:note/widget/note_row.dart';
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
            return NoteRow(noteList: controller.notes, idx: idx);
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
}

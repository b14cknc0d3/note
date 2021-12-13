// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/utils.dart';

// Project imports:
import 'package:note/controller/note_controller.dart';
import 'package:note/widget/note_row.dart';

class FavouriteScreen extends StatelessWidget {
  FavouriteScreen({Key? key}) : super(key: key);
  final NoteController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    var noteList = controller.favouriteNote;
    return Scaffold(
        appBar: AppBar(
          title: Text("My Favourite"),
        ),
        body: Obx(
          () => ListView.builder(
              itemCount: controller.favouriteNote.length,
              itemBuilder: (context, idx) {
                return InkWell(
                  onTap: () {
                    Get.toNamed('/noteView',
                        arguments: {"idx": idx, "page": 2});
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
                                        noteList[idx].favourite!.toInt()),
                                    noteList[idx].id!);
                              },
                              icon: noteList[idx].favourite == 0
                                  ? Icon(Icons.favorite_border)
                                  : Icon(Icons.favorite)),
                          IconButton(
                              onPressed: () {
                                Get.toNamed('/edit', arguments: idx);
                              },
                              icon:
                                  const Icon(Icons.edit, color: Colors.indigo)),
                          IconButton(
                            onPressed: () {
                              Get.defaultDialog(
                                  barrierDismissible: false,
                                  title: "Are you sure want to delete?",
                                  content: Text(
                                    noteList[idx].title.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  confirm: ElevatedButton(
                                    onPressed: () {
                                      controller.deleteNoteById(
                                          controller.notes[idx].id!);
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
                            icon: const Icon(Icons.delete_forever,
                                color: Colors.red),
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
                          text: noteList[idx].title.toString(),
                        ),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(trimString(
                            text: noteList[idx].note.toString(),
                          )),
                          Text(
                            trimString(
                              text: noteList[idx].createAt.toString(),
                            ),
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ));
  }
}

String trimString({required String text}) {
  if (text.length > 30) {
    var trimText = text.substring(0, 28) + "...";

    return trimText;
  } else {
    return text;
  }
}

int favoriteInvert(int value) {
  return value == 0 ? 1 : 0;
}

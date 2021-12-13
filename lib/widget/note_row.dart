// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:note/controller/note_controller.dart';
import 'package:note/model/note.dart';

class NoteRow extends StatelessWidget {
  NoteRow({
    Key? key,
    required this.noteList,
    required this.noteId,
    required this.deleteForever,
    required this.idx,
  }) : super(key: key);
  final bool deleteForever;
  final List<Note> noteList;
  final int noteId;
  final NoteController controller = Get.find();
  final int idx;
  @override
  Widget build(BuildContext context) {
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
                        favoriteInvert(noteList[noteId].favourite!.toInt()),
                        noteId);
                  },
                  icon: noteList[noteId].favourite == 0
                      ? Icon(Icons.favorite_border)
                      : Icon(Icons.favorite)),
              IconButton(
                  onPressed: () {
                    Get.toNamed('/edit', arguments: noteId);
                  },
                  icon: const Icon(Icons.edit, color: Colors.indigo)),
              IconButton(
                onPressed: () {
                  Get.defaultDialog(
                      barrierDismissible: false,
                      title: "Are you sure want to delete?",
                      content: Text(
                        noteList[noteId].title.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      confirm: ElevatedButton(
                        onPressed: () {
                          deleteForever == true
                              ? controller
                                  .deleteNoteById(controller.notes[noteId].id!)
                              : controller.moveToTrashById(
                                  favoriteInvert(
                                      noteList[noteId].favourite!.toInt()),
                                  controller.notes[noteId].id!);

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
              text: noteList[noteId].title.toString(),
            ),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(trimString(
                text: noteList[noteId].note.toString(),
              )),
              Text(
                trimString(
                  text: noteList[noteId].createAt.toString(),
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

      return trimText;
    } else {
      return text;
    }
  }

  int favoriteInvert(int value) {
    return value == 0 ? 1 : 0;
  }
}

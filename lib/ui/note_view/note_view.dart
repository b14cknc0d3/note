// Dart imports:
import 'dart:developer';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:note/controller/note_controller.dart';

class NoteView extends StatelessWidget {
  NoteView({Key? key}) : super(key: key);

  final NoteController controller = Get.find();
  int noteViewId = Get.arguments["idx"];
  int page = Get.arguments["page"];

  @override
  Widget build(BuildContext context) {
    var listNote = page == 1
        ? controller.notes
        : page == 2
            ? controller.favouriteNote
            : controller.trashNote;

    log("noteView " +
        "Note[0]id " +
        listNote[0].id.toString() +
        " NoteView[idx]" +
        noteViewId.toString());
    return Scaffold(
        appBar: AppBar(
          title: Text(listNote[noteViewId].title.toString()),
          actions: [
            IconButton(
                onPressed: () {
                  Get.toNamed('/edit', arguments: noteViewId);
                },
                icon: Icon(Icons.edit))
          ],
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    listNote[noteViewId].createAt.toString(),
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Center(child: Text(listNote[noteViewId].note.toString())),
          ],
        ));
  }
}

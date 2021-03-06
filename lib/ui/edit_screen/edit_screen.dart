// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:note/controller/note_controller.dart';

class EditScreen extends StatelessWidget {
  EditScreen({Key? key}) : super(key: key);
  final NoteController controller = Get.find();
  int noteId = Get.arguments;

  @override
  Widget build(BuildContext context) {
    controller.selectRowById(noteId);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () {
          controller.updateNoteById(noteId);
          controller.clear();
          //  same Get.back();  = Navigator.of(context).pop();
          Get.back();
        },
      ),
      appBar: AppBar(
        title: const Text("Edit note"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: controller.titleTextController,
              //initialValue: controller.selectRowById(),

              decoration: const InputDecoration(
                hintText: "Title",
                contentPadding: EdgeInsets.only(left: 8.0),
                border: OutlineInputBorder(),
              ),
            ),
          ),

          // Divider(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white54,
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(4)),
                height: 50,
                child: TextFormField(
                  controller: controller.noteTextController,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(left: 8.0),
                      border: InputBorder.none,
                      hintText: "Write Your Note"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note/controller/note_controller.dart';
import 'package:note/widget/note_row.dart';

class TrashView extends StatelessWidget {
  TrashView({Key? key}) : super(key: key);
  final NoteController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Recycle Bin"),
        ),
        body: Obx(
          () => ListView.builder(
              itemCount: controller.trashNote.length,
              itemBuilder: (context, idx) {
                return NoteRow(noteList: controller.trashNote, idx: idx);
              }),
        ));
  }
}

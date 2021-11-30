import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/utils.dart';
import 'package:note/controller/note_controller.dart';
import 'package:note/widget/note_row.dart';

class FavouriteScreen extends StatelessWidget {
  FavouriteScreen({Key? key}) : super(key: key);
  final NoteController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My Favourite"),
        ),
        body: Obx(
          () => ListView.builder(
              itemCount: controller.favouriteNote.length,
              itemBuilder: (context, idx) {
                return NoteRow(noteList: controller.favouriteNote, idx: idx);
              }),
        ));
  }
}

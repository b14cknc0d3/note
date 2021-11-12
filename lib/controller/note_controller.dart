import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:note/model/note.dart';

class NoteController extends GetxController {
  RxList<Note> notes = <Note>[].obs;
  final TextEditingController titleTextController = TextEditingController();
  final TextEditingController noteTextController = TextEditingController();

  @override
  onClose() {
    titleTextController.dispose();
    noteTextController.dispose();
    super.onClose();
  }

  addNote() {
    Note note = Note(
      title: titleTextController.text,
      note: noteTextController.text,
    );
    notes.add(note);
  }
}

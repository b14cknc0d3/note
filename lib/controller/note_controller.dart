import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:note/database/database.dart';
import 'package:note/model/note.dart';

class NoteController extends GetxController {
  RxList<Note> notes = <Note>[].obs;
  final TextEditingController titleTextController = TextEditingController();
  final TextEditingController noteTextController = TextEditingController();
  final _db = DatabaseHelper.instance;

  RxList<Note> searchNote = <Note>[].obs;

  @override
  onClose() {
    titleTextController.dispose();
    noteTextController.dispose();
    super.onClose();
  }

  @override
  onInit() {
    super.onInit();
    getAllNote();
  }

  addNote() {
    Note note = Note(
      title: titleTextController.text,
      note: noteTextController.text,
      createAt: DateTime.now().toIso8601String(),
    );
    log("called add note");
    _db.insert(note.toJson());
    getAllNote();
  }

  getAllNote() async {
    final listNote = await _db.queryAllRows();
    notes.value = listNote;
  }

  clear() {
    titleTextController.clear();
    noteTextController.clear();
  }

  searchNoteByTitle() {
    searchNote.value = notes.reversed.toList();
    log(searchNote.toString());
  }

  selectRowById(int index) async{
    final Map<String, Object?> row = await  _db.selectRowById(index);
    log(row.toString());
    var note = Note.fromJson(row);
    titleTextController.text = note.title.toString();
    noteTextController.text = note.note.toString();
      }
  
  updateNote(){

  }

  deleteNoteById(int index) async {
    try {
      final int row = await _db.delete(index);
      if (row > 0) {
        getAllNote();
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}

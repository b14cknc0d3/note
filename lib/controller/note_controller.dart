// Dart imports:
import 'dart:developer';

// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// Project imports:
import 'package:note/database/database.dart';
import 'package:note/model/note.dart';

GlobalKey<FormState> formKey = GlobalKey<FormState>();

class NoteController extends GetxController {
  RxList<Note> notes = <Note>[].obs;
  final TextEditingController titleTextController = TextEditingController();
  final TextEditingController noteTextController = TextEditingController();
  final _db = DatabaseHelper.instance;
  RxList<Note> favouriteNote = <Note>[].obs;
  RxList<Note> trashNote = <Note>[].obs;
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
    getAllFavouriteNote();
    getAllDeleteNote();
  }

  addNote() {
    if (titleTextController.text.isNotEmpty &&
        noteTextController.text.isNotEmpty) {
      DateTime now = DateTime.now();
      String datetime = DateFormat("dd.MM.yyyy hh:mm a").format(now);
      Note note = Note(
        title: titleTextController.text,
        note: noteTextController.text,
        createAt: "$datetime",
      );
      log("called add note");
      _db.insert(note.toJson());
      getAllNote();
      Get.back();
    } else {
      log("Empty");
    }
  }

  getAllNote() async {
    final listNote = await _db.queryAllRows();
    log("queryallrow " + listNote.toString());
    notes.value = listNote;
  }

  getAllFavouriteNote() async {
    final favNote = await _db.queryAllFavouriteRow();
    favouriteNote.value = favNote;
  }

  getAllDeleteNote() async {
    final tNote = await _db.queryAllTrashRow();
    trashNote.value = tNote;
  }

  deleteAllNote() async {
    try {
      await _db.deleleAll();
      getAllNote();
      getAllFavouriteNote();
      getAllDeleteNote();
      Get.snackbar("Success", "All Note Deleted",
          colorText: Colors.white, backgroundColor: Colors.green);
    } catch (e) {
      Get.snackbar("Error", "Can't Delete All Note");
      throw Exception(e);
    }
  }

  clear() {
    titleTextController.clear();
    noteTextController.clear();
  }

  searchNoteByTitle() {
    searchNote.value = notes.reversed.toList();
    log(searchNote.toString());
  }

  selectRowById(int index) async {
    final Map<String, Object?> row = await _db.selectRowById(index);
    log("Edit Note " + row.toString());
    var note = Note.fromJson(row);
    titleTextController.text = note.title.toString();
    noteTextController.text = note.note.toString();
  }

  updateNoteById(int idx) async {
    Note note = Note(
      title: titleTextController.text,
      note: noteTextController.text,
      createAt: DateTime.now().toIso8601String(),
      //id: idx,
    );
    log(idx.toString());

    await _db.update(note.toJson(), idx);
    getAllNote();
  }

//use in recycle bin
  deleteNoteById(int index) async {
    log("deleteNoteById " + index.toString());
    try {
      await _db.delete(index);

      getAllNote();
      getAllDeleteNote();
      getAllFavouriteNote();
    } catch (e) {
      throw Exception(e);
    }
  }

  favoriteById(int value, int idx) async {
    await _db.favoriteFunction(value, idx);
    getAllNote();
    getAllFavouriteNote();
  }

  moveToTrashById(int value, int idx) async {
    log("moveToTrashById " + value.toString() + " " + idx.toString());
    await _db.moveToTrash(value, idx);

    getAllNote();
    getAllFavouriteNote();
  }

  // deleteNoteRecBinById(int value, int index) async {
  //   await _db.inTrashFun(value, index);
  //   getAllNote();
  // }
}

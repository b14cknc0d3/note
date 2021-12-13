// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:note/controller/note_controller.dart';

class NoteBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NoteController());
  }
}

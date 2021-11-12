import 'package:get/get.dart';
import 'package:note/controller/note_controller.dart';

class NoteBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NoteController());
  }
}

// Dart imports:

// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:get/get.dart';
// Project imports:
import 'package:note/controller/note_controller.dart';

class AddScreen extends StatelessWidget {
  NoteController controller = Get.find();
  AddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () {
          formKey.currentState!.validate();
          controller.addNote();
          controller.clear();

          // same Get.back();  = Navigator.of(context).pop();
          //Get.back();
        },
      ),
      appBar: AppBar(
        title: const Text("Add note"),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            // Column(
            //   mainAxisSize: MainAxisSize.min,
            //   crossAxisAlignment: CrossAxisAlignment.stretch,
            //   children: <Widget>[

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                // keyboardType: TextInputType.name,
                controller: controller.titleTextController,
                decoration: const InputDecoration(
                  hintText: "Title",
                  contentPadding: EdgeInsets.only(left: 8.0),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Required the title';
                  }
                },
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
                      borderRadius: BorderRadius.circular(8)),
                  child: TextFormField(
                    maxLines: null,
                    controller: controller.noteTextController,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(left: 8.0),
                      border: InputBorder.none,
                      hintText: "Write Your Note",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required';
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // body: Column(
      //   children: [
      //     const SizedBox(
      //       height: 20,
      //     ),
      //     // Column(
      //     //   mainAxisSize: MainAxisSize.min,
      //     //   crossAxisAlignment: CrossAxisAlignment.stretch,
      //     //   children: <Widget>[

      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: TextFormField(
      //         controller: controller.titleTextController,
      //         decoration: const InputDecoration(
      //           hintText: "Title",
      //           contentPadding: EdgeInsets.only(left: 8.0),
      //           border: OutlineInputBorder(),
      //         ),
      //       ),
      //     ),

      //     // Divider(),
      //     Expanded(
      //       child: Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Container(
      //           decoration: BoxDecoration(
      //               color: Colors.white54,
      //               border: Border.all(color: Colors.red),
      //               borderRadius: BorderRadius.circular(8)),
      //           child: TextFormField(
      //             maxLines: null,
      //             controller: controller.noteTextController,
      //             decoration: const InputDecoration(
      //               contentPadding: EdgeInsets.only(left: 8.0),
      //               border: InputBorder.none,
      //               hintText: "Write Your Note",
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}

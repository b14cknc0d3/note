import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note/controller/note_controller.dart';
import 'package:markdown_io/markdown_io.dart';
import 'package:markdown_widget/markdown_widget.dart';

class AddScreen extends StatefulWidget {
  AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final NoteController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () {
          controller.addNote();
          controller.clear();
          // same Get.back();  = Navigator.of(context).pop();
          Get.back();
        },
      ),
      appBar: AppBar(
        title: const Text("Add note"),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: controller.titleTextController,
              decoration: const InputDecoration(
                hintText: "Title",
                contentPadding: EdgeInsets.only(left: 8.0),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          // MarkdownWidget(),
          // Container(
          //   width: 300,
          //   height: 300,
          //   child: MarkdownIo(
          //     onChanged: (String value) => log(value),

          //     // initialData: description,
          //     controller: controller.markdownIoTextController,
          //     // label: 'Description',

          //     maxLines: 100,
          //     actions: MarkdownType.values,
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 10),
          //   child: Container(
          //     child: MarkdownBody(
          //       data: controller.markdownIoTextController.text,
          //       shrinkWrap: true,
          //     ),
          //   ),
          // ),

          // Divider(),
          // Expanded(
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Container(
          //       decoration: BoxDecoration(
          //           color: Colors.white54,
          //           border: Border.all(color: Colors.red),
          //           borderRadius: BorderRadius.circular(8)),
          //       height: 50,
          //       child: TextFormField(
          //         controller: controller.noteTextController,
          //         decoration: const InputDecoration(
          //           contentPadding: EdgeInsets.only(left: 8.0),
          //           border: InputBorder.none,
          //           hintText: "Write Your Note",
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note/controller/note_controller.dart';

class AddScreen extends StatelessWidget {
  AddScreen({Key? key}) : super(key: key);
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
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              MarkdownIo(
                // onChanged: (String value) =>

                // initialData: description,
                label: 'Description',
                maxLines: 10,
                actions: MarkdownType.values,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: MarkdownBody(
                  data: "Notes",
                  shrinkWrap: true,
                ),
              ),
            ],
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

          // Divider(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white54,
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(8)),
                height: 50,
                child: TextFormField(
                  controller: controller.noteTextController,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(left: 8.0),
                    border: InputBorder.none,
                    hintText: "Write Your Note",
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

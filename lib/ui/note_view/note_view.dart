import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note/controller/note_controller.dart';

class NoteView extends StatefulWidget {
  const NoteView({Key? key}) : super(key: key);

  @override
  _NoteViewState createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
  final NoteController controller = Get.find();
  int noteViewId = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(controller.notes[noteViewId].title.toString()),
          actions: [
            IconButton(
                onPressed: () {
                  Get.toNamed('/edit', arguments: noteViewId + 1);
                },
                icon: Icon(Icons.edit))
          ],
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    controller.notes[noteViewId].createAt.toString(),
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Center(child: Text(controller.notes[noteViewId].note.toString())),
          ],
        ));
  }
}

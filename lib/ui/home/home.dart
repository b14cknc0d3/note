import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note/controller/note_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final NoteController controller = Get.put(NoteController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed("/add");
          // Get.snackbar("+", "Add Note");
        },
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.white.withOpacity(0.9),
      appBar: _myAppBar(context),
      body: Obx(() => ListView.builder(
          itemCount: controller.notes.length,
          itemBuilder: (ctx, idx) {
            return _noteRow(context, idx);
          })),
    );
  }

  _myAppBar(BuildContext context) {
    return AppBar(
      elevation: 0.5,
      backgroundColor: Colors.white.withOpacity(0.9),
      leading: IconButton(
        icon: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        onPressed: () {},
      ),
      title: const Text(
        'All notes',
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.search,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              color: Colors.black,
            )),
      ],
    );
  }

  _noteRow(context, idx) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        trailing: IconButton(
          onPressed: () {
            Get.defaultDialog(
                title: "Are you sure want to delete?",
                content: Text(
                  controller.notes[idx].title.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                confirm: ElevatedButton(
                  onPressed: () {
                    controller.removeNote(index: idx);
                    Navigator.of(context).pop();
                  },
                  child: const Text("OK"),
                ),
                cancel: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("CANCLE")));
          },
          icon: const Icon(Icons.delete_forever),
        ),
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        isThreeLine: true,
        title: Text(
          controller.notes[idx].title.toString(),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              controller.notes[idx].note.toString(),
            ),
            Text(
              controller.notes[idx].createAt.toString(),
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

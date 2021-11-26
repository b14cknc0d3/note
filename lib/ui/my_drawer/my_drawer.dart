import 'package:flutter/material.dart';
import 'package:note/ui/recycle_bin/recycle_bin.dart';
import 'package:share/share.dart';

class MyHeaderDrawer extends StatefulWidget {
  const MyHeaderDrawer({Key? key}) : super(key: key);

  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              trailing: Icon(Icons.settings),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.note),
              title: Text("All notes"),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text("Share notebooks"),
              onTap: () {
                Share.share("title");
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.turned_in),
              title: Text("Frequently used"),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.delete),
              title: Text("Recycle bin"),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return RecycleBin();
                }));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.folder),
              title: Text("Folder"),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}

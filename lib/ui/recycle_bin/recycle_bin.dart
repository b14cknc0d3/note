import 'package:flutter/material.dart';

class RecycleBin extends StatefulWidget {
  const RecycleBin({Key? key}) : super(key: key);

  @override
  _RecycleBinState createState() => _RecycleBinState();
}

class _RecycleBinState extends State<RecycleBin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Recycle Bin")));
  }
}

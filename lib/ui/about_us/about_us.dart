// Flutter imports:
import 'package:flutter/material.dart';
// Project imports:
import 'package:note/utils/utils.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("About Us"),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30.0,
            ),
            const Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Note',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )),
            const Text(
              'version 1.0.0',
              style: TextStyle(fontSize: 15.0),
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Developed By',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              '''
Ko Ye Lin Aung,
Ko Kyaw Min Htut,
Ko Ye Yint Aung,
Ko Aung Kyaw Myo,
Ma Ei Shwe Sin Win''',
              textAlign: TextAlign.center,
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'For Educational Purpose',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Project Url',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {
                launchURL('https://github.com/b14cknc0d3/note');
              },
              child: const Text('https://github.com/b14cknc0d3/note'),
            )
          ],
        ));
  }
}

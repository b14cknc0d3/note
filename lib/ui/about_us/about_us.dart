import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> nameList = [
      "Developed By",
      "Teacher - KO YE LIN AUNG",
      'KO KYAW MIN HTUT',
      'MA EI SHWE SIN WIN'
    ];
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: const Text("About Us"),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: nameList
                .map((name) => Card(
                      margin: const EdgeInsets.all(10.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      child: SizedBox(
                          height: 50, child: Center(child: Text(name))),
                    ))
                .toList()));
  }
}

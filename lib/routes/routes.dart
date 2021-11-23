//import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note/controller/binding.dart';
import 'package:note/ui/add/add_screen.dart';
import 'package:note/ui/edit_screen/edit_screen.dart';
import 'package:note/ui/home/home.dart';
//import 'package:note/ui/my_drawer/my_drawer.dart';
import 'package:note/ui/splash/splash_screen.dart';

class MyRoutes {
  static final routes = [
    GetPage(name: '/', page: () => const SplashScreen()),
    GetPage(name: '/home', page: () => HomeScreen(), binding: NoteBinding()),
    GetPage(name: '/add', page: () => AddScreen(), binding: NoteBinding()),
    GetPage(name: '/edit', page: () => EditScreen(), binding: NoteBinding()),

    // GetPage(
    //     name: '/my_drawer',
    //     page: () => MyHeaderDrawer(),
    //     binding: NoteBinding()),
  ];
}

//import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:note/controller/binding.dart';
import 'package:note/ui/about_us/about_us.dart';
import 'package:note/ui/add/add_screen.dart';
import 'package:note/ui/edit_screen/edit_screen.dart';
import 'package:note/ui/favourite/favourite_screen.dart';
import 'package:note/ui/home/home.dart';
import 'package:note/ui/note_view/note_view.dart';
import 'package:note/ui/splash/splash_screen.dart';
import 'package:note/ui/trash/trash_view.dart';

//import 'package:note/ui/my_drawer/my_drawer.dart';

class MyRoutes {
  static final routes = [
    GetPage(name: '/', page: () => const SplashScreen()),
    GetPage(name: '/home', page: () => HomeScreen(), binding: NoteBinding()),
    GetPage(name: '/add', page: () => AddScreen(), binding: NoteBinding()),
    GetPage(name: '/edit', page: () => EditScreen(), binding: NoteBinding()),
    GetPage(name: '/noteView', page: () => NoteView(), binding: NoteBinding()),
    GetPage(
        name: '/fav', page: () => FavouriteScreen(), binding: NoteBinding()),

    GetPage(
        name: '/trashView', page: () => TrashView(), binding: NoteBinding()),
    GetPage(name: '/aboutUs', page: () => AboutUs(), binding: NoteBinding()),

    // GetPage(
    //     name: '/my_drawer',
    //     page: () => MyHeaderDrawer(),
    //     binding: NoteBinding()),
  ];
}

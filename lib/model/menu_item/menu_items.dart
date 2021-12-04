import 'package:flutter/material.dart';

import 'menu_item_model.dart';

class MenuItems {
  static const List<MenuItem> itemList = [itemAboutUs, itemGithubLink];

  static const itemAboutUs = MenuItem(text: "About Us", icon: Icons.info);

  static const itemGithubLink = MenuItem(text: "Github", icon: Icons.link);
}

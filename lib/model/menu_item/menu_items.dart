import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'menu_item_model.dart';

class MenuItems {
  static const List<MenuItem> itemList = [itemAboutUs, itemGithubLink];

  static const itemAboutUs =
      MenuItem(text: "About Us", icon: FontAwesomeIcons.infoCircle);

  static const itemGithubLink =
      MenuItem(text: "Github", icon: FontAwesomeIcons.github);
}

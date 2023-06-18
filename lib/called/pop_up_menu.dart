import 'package:flutter/material.dart';

import '../pages/about_us_page.dart';
import '../settings/settings_page.dart';
import '../signup_login/sign_up_page.dart';

class PopUpMenu extends StatelessWidget {
  final List<PopupMenuEntry> menuList;
  final Widget? icon;
  PopUpMenu({Key? key, required this.menuList, this.icon}) : super(key: key);
  var appBarHeight = AppBar().preferredSize.height;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (result) {
        if (result == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignUp()),
          );
        }
        if (result == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Settings()),
          );
        }
        if (result == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AboutUs()),
          );
        }
      },
      offset: Offset(0.0, appBarHeight),
      shape: const RoundedRectangleBorder(
        // borderRadius: BorderRadius.circular(16.0),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8.0),
          bottomRight: Radius.circular(8.0),
          topLeft: Radius.circular(8.0),
          topRight: Radius.circular(8.0),
        ),
      ),
      itemBuilder: ((context) => menuList),
      icon: icon,
    );
  }
}

import 'package:flutter/material.dart';

class PopUpMenu extends StatelessWidget {
  final List<PopupMenuEntry> menuList;
  final Widget? icon;
  PopUpMenu({Key? key, required this.menuList, this.icon}) : super(key: key);
  var appBarHeight = AppBar().preferredSize.height;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
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

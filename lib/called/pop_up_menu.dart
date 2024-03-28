import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pages/about_us_page.dart';
import '../pages/main_page.dart';
import '../pages/my_profile_page.dart';
import '../settings/settings_page.dart';
import '../signup_login/log_in_page.dart';
import '../signup_login/moving_splash.dart';
import '../signup_login/sign_up_page.dart';

class UserState with ChangeNotifier {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  void setLoggedIn(bool value) {
    _isLoggedIn = value;
    notifyListeners();
  }
}

class PopUpMenu extends StatelessWidget {
  final List<PopupMenuEntry> menuList;
  final Widget? icon;
  PopUpMenu({Key? key, required this.menuList, this.icon}) : super(key: key);
  var appBarHeight = AppBar().preferredSize.height;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (result) {
        // if (result == 0) {
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(builder: (context) => LogIn()),
        //   );
        // }
        if (result == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyProfile()),
          );
        }
        if (result == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignUp()),
          );
        }
        if (result == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LogIn()),
          );
        }
        if (result == 3) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Settings()),
          );
        }
        if (result == 4) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AboutUs()),
          );
        }
        if (result == 5) {
          // "Log Out" seçeneği seçildiğinde yapılacak işlemleri burada gerçekleştirin
          logOut(context);
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

  void logOut(BuildContext context) async {
    // Çıkış işlemleri
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('userMail');
    prefs.remove('userPassword');
    prefs.remove('firstName');
    prefs.remove('lastName');
    prefs.remove('username');
    prefs.remove('password');
    prefs.remove('mail');
    prefs.remove('cityName');
    prefs.remove('district');
    prefs.remove('neighbourhood');
    prefs.remove('street');
    prefs.remove('posCode');
    prefs.remove('numberOfHome');
    prefs.remove('address');

    Provider.of<UserState>(context, listen: false).setLoggedIn(false);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MainPage()),
    );
  }
}

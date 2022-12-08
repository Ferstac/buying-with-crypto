import 'package:flutter/material.dart';

import 'pages/main_page.dart';

void main() => runApp( MyFirstApp());

class MyFirstApp extends StatelessWidget {
  static const String title = 'Navigation Menu';

  const MyFirstApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.amber),
        home: const MainPage(),
      );
}
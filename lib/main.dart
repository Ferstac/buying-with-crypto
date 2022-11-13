import 'package:flutter/material.dart';
import 'package:flutter_application_2/callers/Menu.dart';

void main() => runApp(MyFirstApp());

class MyFirstApp extends StatelessWidget {
  static const String title = 'Navigation Menu';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.amber),
        home: const Menu(),
      );
}
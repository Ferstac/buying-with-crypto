import 'package:flutter/material.dart';

import 'pages/main_page.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.amber),
        home: MainPage(),
      ),
    );
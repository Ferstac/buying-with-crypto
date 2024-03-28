import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'called/grid_products.dart';
import 'called/pop_up_menu.dart';
import 'pages/main_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CurrencyProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserState(),
        ), // CurrencyProvider'ı sağlıyoruz
        // Diğer provider'ları burada ekleyebilirsiniz
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.amber),
        home: MainPage(),
      ),
    ),
  );
}

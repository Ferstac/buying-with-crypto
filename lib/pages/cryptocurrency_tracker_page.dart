import 'package:flutter/material.dart';

class CryptocurrencyTracker extends StatelessWidget {
  const CryptocurrencyTracker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cryptocurrency Tracker")),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            16.0,
          ),
          color: Colors.amberAccent.shade100,
        ),
      ),
    );
  }
}

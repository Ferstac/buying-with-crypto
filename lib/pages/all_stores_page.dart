import 'package:flutter/material.dart';

class AllStores extends StatelessWidget {
  const AllStores({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("All Store")),
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

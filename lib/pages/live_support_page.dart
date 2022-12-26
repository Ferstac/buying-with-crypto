import 'package:flutter/material.dart';

class LiveSupport extends StatelessWidget {
  const LiveSupport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Live Support")),
        body: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              16.0,
            ),
            color: Colors.amberAccent.shade100,
          ),
        ));
  }
}

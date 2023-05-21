import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../pages/main_page.dart';

setdata(BuildContext context) async {
  await Future.delayed(
    const Duration(seconds: 5),
    () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainPage()),
      );
    },
  );
}

class SimpleAnimation extends StatelessWidget {
  const SimpleAnimation({Key? key, this.loading}) : super(key: key);
  final bool? loading;

  @override
  Widget build(BuildContext context) {
    setdata(context);
    return Scaffold(
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          child: RiveAnimation.network(
            'https://cdn.rive.app/animations/vehicles.riv',
          ),
        ),
      ),
    );
  }
}

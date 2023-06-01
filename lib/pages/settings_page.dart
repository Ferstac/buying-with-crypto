import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() {
    return _SettingsState();
  }
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Settings",
          style: TextStyle(
              fontFamily: "SignikaSemiBold",
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 20.0),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.amber.shade400,
        ),
        width: double.infinity,
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          children: <Widget>[
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: <Widget>[
                SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Container(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Container(
                            margin:
                                const EdgeInsets.only(top: 20.0, bottom: 10.0),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  bottomLeft: Radius.circular(5)),
                            ),
                            child: MaterialButton(
                              color: Colors.white,
                              highlightColor:
                                  const Color.fromARGB(0, 248, 0, 0),
                              splashColor:
                                  const Color.fromARGB(255, 237, 196, 196),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 85.0),
                                child: Text(
                                  "address settings:",
                                  style: TextStyle(
                                      fontFamily: "SignikaSemiBold",
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 22.0),
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

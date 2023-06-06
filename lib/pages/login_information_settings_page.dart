import 'package:flutter/material.dart';

class LoginInformationSettings extends StatefulWidget {
  const LoginInformationSettings({Key? key}) : super(key: key);

  @override
  _LoginInformationSettingsState createState() {
    return _LoginInformationSettingsState();
  }
}

class _LoginInformationSettingsState extends State<LoginInformationSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login Information",
          style: TextStyle(
              fontFamily: "SignikaSemiBold",
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 20.0),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber.shade400,
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
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Container(
                            margin:
                                const EdgeInsets.only(top: 10.0, bottom: 10.0),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      16.0,
                                    ),
                                    color: Colors.white,
                                  ),
                                  width: 280,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 5.0,
                                    horizontal: 10.0,
                                  ),
                                  child: const Text(
                                    "username: ...........",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontFamily: "SignikaSemiBold",
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                MaterialButton(
                                  highlightColor:
                                      const Color.fromARGB(0, 248, 0, 0),
                                  splashColor:
                                      const Color.fromARGB(255, 237, 196, 196),
                                  child: const Text(
                                    "change",
                                    style: TextStyle(
                                      fontFamily: "SignikaSemiBold",
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Container(
                            margin:
                                const EdgeInsets.only(top: 10.0, bottom: 10.0),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      16.0,
                                    ),
                                    color: Colors.white,
                                  ),
                                  width: 280,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 5.0,
                                    horizontal: 10.0,
                                  ),
                                  child: const Text(
                                    "@mail address: ..@temp.com",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontFamily: "SignikaSemiBold",
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                MaterialButton(
                                  highlightColor:
                                      const Color.fromARGB(0, 248, 0, 0),
                                  splashColor:
                                      const Color.fromARGB(255, 237, 196, 196),
                                  child: const Text(
                                    "change",
                                    style: TextStyle(
                                      fontFamily: "SignikaSemiBold",
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Container(
                            margin:
                                const EdgeInsets.only(top: 10.0, bottom: 10.0),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      16.0,
                                    ),
                                    color: Colors.white,
                                  ),
                                  width: 280,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 5.0,
                                    horizontal: 10.0,
                                  ),
                                  child: const Text(
                                    "password: ..................",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontFamily: "SignikaSemiBold",
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                MaterialButton(
                                  highlightColor:
                                      const Color.fromARGB(0, 248, 0, 0),
                                  splashColor:
                                      const Color.fromARGB(255, 237, 196, 196),
                                  child: const Text(
                                    "change",
                                    style: TextStyle(
                                      fontFamily: "SignikaSemiBold",
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  onPressed: () {},
                                ),
                              ],
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

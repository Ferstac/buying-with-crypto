import 'package:flutter/material.dart';
import 'address_settings_page.dart';
import 'login_information_settings_page.dart';
import 'payment_system_settings_page.dart';

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
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                16.0,
                              ),
                              color: Colors.white,
                            ),
                            width: 380,
                            height: 40,
                            child: MaterialButton(
                              highlightColor:
                                  const Color.fromARGB(0, 248, 0, 0),
                              splashColor:
                                  const Color.fromARGB(255, 237, 196, 196),
                              child: const Text(
                                "address settings:",
                                style: TextStyle(
                                  fontFamily: "SignikaSemiBold",
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 18.0,
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AddressSettings(),
                                  ),
                                );
                              },
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
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                16.0,
                              ),
                              color: Colors.white,
                            ),
                            width: 380,
                            height: 40,
                            child: MaterialButton(
                              highlightColor:
                                  const Color.fromARGB(0, 248, 0, 0),
                              splashColor:
                                  const Color.fromARGB(255, 237, 196, 196),
                              child: const Text(
                                "login information settings:",
                                style: TextStyle(
                                  fontFamily: "SignikaSemiBold",
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 18.0,
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        LoginInformationSettings(),
                                  ),
                                );
                              },
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
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                16.0,
                              ),
                              color: Colors.white,
                            ),
                            width: 380,
                            height: 40,
                            child: MaterialButton(
                              highlightColor:
                                  const Color.fromARGB(0, 248, 0, 0),
                              splashColor:
                                  const Color.fromARGB(255, 237, 196, 196),
                              child: const Text(
                                "payment system settings:",
                                style: TextStyle(
                                  fontFamily: "SignikaSemiBold",
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 18.0,
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        PaymentSystemSettings(),
                                  ),
                                );
                              },
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddressSettings extends StatefulWidget {
  const AddressSettings({Key? key}) : super(key: key);

  @override
  _AddressSettingsState createState() {
    return _AddressSettingsState();
  }
}

class _AddressSettingsState extends State<AddressSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Address Settings",
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
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                bottomLeft: Radius.circular(5),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    CupertinoIcons.add,
                                    size: 34,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            16.0,
                          ),
                          color: Colors.white,
                        ),
                        width: 380,
                        padding: const EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 10.0,
                        ),
                        child: Column(
                          children: const <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "First Name/Last Name: ............",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: "SignikaSemiBold",
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "City/Locality: ..........",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: "SignikaSemiBold",
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "State/Province: ............",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: "SignikaSemiBold",
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Postal Code: ............",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: "SignikaSemiBold",
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Country: Turkey",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: "SignikaSemiBold",
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Telephone number: +90 550 000 00 00",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: "SignikaSemiBold",
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ],
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

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../called/data_factory.dart';

class LoginInformationSettings extends StatefulWidget {
  const LoginInformationSettings({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginInformationSettingsState();
  }
}

class _LoginInformationSettingsState extends State<LoginInformationSettings> {
  late TextEditingController usernameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late bool isUsernameEditable;
  late bool isEmailEditable;
  late bool isPasswordEditable;

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    isUsernameEditable = false;
    isEmailEditable = false;
    isPasswordEditable = false;
    loadUserInformation();
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

Future<void> loadUserInformation() async {
  final prefs = await SharedPreferences.getInstance();
  setState(() {
    usernameController.text = prefs.getString('username') ?? '';
    emailController.text = prefs.getString('email') ?? '';

    // Use saveUserData to get userMail and userPassword
    List<Customer> customers = [
      Customer(
        mail: prefs.getString('userMail') ?? '',
        password: prefs.getString('userPassword') ?? '',
      )
    ];

    if (customers.isNotEmpty) {
      Customer user = customers.first;
      emailController.text = user.mail;
      passwordController.text = user.password;
    }
  });
}

  Future<void> saveUserInformation() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', usernameController.text);
    await prefs.setString('userMail', emailController.text);
    await prefs.setString('userPassword', passwordController.text);
  }

  void toggleUsernameEdit() {
    setState(() {
      isUsernameEditable = !isUsernameEditable;
      if (!isUsernameEditable) {
        saveUserInformation();
      }
    });
  }

  void toggleEmailEdit() {
    setState(() {
      isEmailEditable = !isEmailEditable;
      if (!isEmailEditable) {
        saveUserInformation();
      }
    });
  }

  void togglePasswordEdit() {
    setState(() {
      isPasswordEditable = !isPasswordEditable;
      if (!isPasswordEditable) {
        saveUserInformation();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login Information",
          style: TextStyle(
            fontFamily: "SignikaSemiBold",
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 20.0,
          ),
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
                      // Username
                      Center(
                        child: Container(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Container(
                            margin:
                                const EdgeInsets.only(top: 10.0, bottom: 10.0),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.0),
                                      color: Colors.white,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 5.0,
                                      horizontal: 10.0,
                                    ),
                                    child: TextFormField(
                                      controller: usernameController,
                                      enabled: isUsernameEditable,
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                        fontFamily: "SignikaSemiBold",
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 18.0,
                                      ),
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Username',
                                      ),
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
                                    "Change",
                                    style: TextStyle(
                                      fontFamily: "SignikaSemiBold",
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  onPressed: toggleUsernameEdit,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      // Email
                      Center(
                        child: Container(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Container(
                            margin:
                                const EdgeInsets.only(top: 10.0, bottom: 10.0),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.0),
                                      color: Colors.white,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 5.0,
                                      horizontal: 10.0,
                                    ),
                                    child: TextFormField(
                                      controller: emailController,
                                      enabled: isEmailEditable,
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                        fontFamily: "SignikaSemiBold",
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 18.0,
                                      ),
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Email Address',
                                      ),
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
                                    "Change",
                                    style: TextStyle(
                                      fontFamily: "SignikaSemiBold",
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  onPressed: toggleEmailEdit,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      // Password
                      Center(
                        child: Container(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Container(
                            margin:
                                const EdgeInsets.only(top: 10.0, bottom: 10.0),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.0),
                                      color: Colors.white,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 5.0,
                                      horizontal: 10.0,
                                    ),
                                    child: TextFormField(
                                      controller: passwordController,
                                      enabled: isPasswordEditable,
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                        fontFamily: "SignikaSemiBold",
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 18.0,
                                      ),
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Password',
                                      ),
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
                                    "Change",
                                    style: TextStyle(
                                      fontFamily: "SignikaSemiBold",
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  onPressed: togglePasswordEdit,
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

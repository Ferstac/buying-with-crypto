// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_application_2/called/post_json.dart';
import 'package:getwidget/getwidget.dart';

// import '../datetime_picker.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() {
    return _SignUpState();
  }
}

class _SignUpState extends State<SignUp> {
  final FocusNode focusName = FocusNode();
  final FocusNode focusLastName = FocusNode();
  final FocusNode focusEmail = FocusNode();
  final FocusNode focusPassword = FocusNode();
  final FocusNode focusUsername = FocusNode();

  final TextEditingController focusNameController = TextEditingController();
  final TextEditingController focusLastNameController = TextEditingController();
  final TextEditingController focusUsernameController = TextEditingController();
  final TextEditingController focusPasswordController = TextEditingController();
  final TextEditingController focusEmailController = TextEditingController();

  var dropList = ["male", "female", "other"];

  get child => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Registration",
          style: TextStyle(
              fontFamily: "SignikaSemiBold",
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 20.0),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
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
                          // Padding(
                          //   padding: const EdgeInsets.only(
                          //       top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                          //   child: TextField(
                          //     focusNode: focusName,
                          //     controller: nameController,
                          //     keyboardType: TextInputType.emailAddress,
                          //     style: const TextStyle(
                          //         fontFamily: "SignikaSemiBold",
                          //         fontSize: 16.0,
                          //         color: Colors.black),
                          //     decoration: const InputDecoration(
                          //         border: InputBorder.none,
                          //         hintText: "+1",
                          //         hintStyle: TextStyle(
                          //             fontFamily: "SignikaSemiBold",
                          //             fontSize: 18.0)),
                          //   ),
                          // ),
                          // Container(
                          //   width: 350.0,
                          //   height: 1.0,
                          //   color: Colors.grey,
                          // ),
                          Row(
                            children: const [
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 24.0, bottom: 4.0),
                                child: Text(
                                  "Write your name, please",
                                  style: TextStyle(
                                      fontFamily: "SignikaSemiBold",
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 18.0),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0,
                                bottom: 15.0,
                                left: 22.0,
                                right: 22.0),
                            child: TextField(
                              focusNode: focusName,
                              controller: focusNameController,
                              keyboardType: TextInputType.name,
                              style: const TextStyle(
                                  fontFamily: "SignikaSemiBold",
                                  fontSize: 16.0,
                                  color: Colors.black),
                              decoration: const InputDecoration(
                                labelText: "Enter the name",
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                ),
                                hintText: "Enter the name",
                                hintStyle: TextStyle(
                                    fontFamily: "SignikaSemiBold",
                                    fontSize: 18.0),
                              ),
                            ),
                          ),
                          Row(
                            children: const [
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 24.0, bottom: 4.0),
                                child: Text(
                                  "Write your last name, please",
                                  style: TextStyle(
                                      fontFamily: "SignikaSemiBold",
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 18.0),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0,
                                bottom: 15.0,
                                left: 22.0,
                                right: 22.0),
                            child: TextField(
                              focusNode: focusLastName,
                              controller: focusLastNameController,
                              keyboardType: TextInputType.name,
                              style: const TextStyle(
                                  fontFamily: "SignikaSemiBold",
                                  fontSize: 16.0,
                                  color: Colors.black),
                              decoration: const InputDecoration(
                                  labelText: "Enter the last name",
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                  ),
                                  hintText: "Enter the last name",
                                  hintStyle: TextStyle(
                                      fontFamily: "SignikaSemiBold",
                                      fontSize: 18.0)),
                            ),
                          ),
                          Row(
                            children: const [
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 24.0, bottom: 4.0),
                                child: Text(
                                  "Create a username for your account, please",
                                  style: TextStyle(
                                      fontFamily: "SignikaSemiBold",
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 18.0),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0,
                                bottom: 15.0,
                                left: 22.0,
                                right: 22.0),
                            child: TextField(
                              // onChanged: (value) {
                              //   print('selected $value ');
                              // },
                              focusNode: focusUsername,
                              controller: focusUsernameController,
                              keyboardType: TextInputType.name,
                              style: const TextStyle(
                                  fontFamily: "SignikaSemiBold",
                                  fontSize: 16.0,
                                  color: Colors.black),
                              decoration: const InputDecoration(
                                labelText: "Enter the new username",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                                hintText: "Enter the new username",
                                hintStyle: TextStyle(
                                    fontFamily: "SignikaSemiBold",
                                    fontSize: 18.0),
                              ),
                            ),
                          ),
                          Row(
                            children: const [
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 24.0, bottom: 4.0),
                                child: Text(
                                  "Create a password for your account, please",
                                  style: TextStyle(
                                      fontFamily: "SignikaSemiBold",
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 18.0),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0,
                                bottom: 15.0,
                                left: 22.0,
                                right: 22.0),
                            child: TextField(
                              // onChanged: (value) {
                              //   print('selected $value ');
                              // },
                              focusNode: focusPassword,
                              controller: focusPasswordController,
                              keyboardType: TextInputType.visiblePassword,
                              style: const TextStyle(
                                  fontFamily: "SignikaSemiBold",
                                  fontSize: 16.0,
                                  color: Colors.black),
                              decoration: const InputDecoration(
                                labelText: "Enter the new password",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                                hintText: "Enter the new password",
                                hintStyle: TextStyle(
                                    fontFamily: "SignikaSemiBold",
                                    fontSize: 18.0),
                              ),
                            ),
                          ),
                          Row(
                            children: const [
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 24.0, bottom: 4.0),
                                child: Text(
                                  "Write your email, please",
                                  style: TextStyle(
                                      fontFamily: "SignikaSemiBold",
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 18.0),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0,
                                bottom: 15.0,
                                left: 22.0,
                                right: 22.0),
                            child: TextField(
                              focusNode: focusEmail,
                              controller: focusEmailController,
                              keyboardType: TextInputType.emailAddress,
                              style: const TextStyle(
                                  fontFamily: "SignikaSemiBold",
                                  fontSize: 16.0,
                                  color: Colors.black),
                              decoration: const InputDecoration(
                                  labelText: "Enter the email",
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                  ),
                                  hintText: "Enter the email",
                                  hintStyle: TextStyle(
                                      fontFamily: "SignikaSemiBold",
                                      fontSize: 18.0)),
                            ),
                          ),
                          Container(
                            margin:
                                const EdgeInsets.only(top: 20.0, bottom: 10.0),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  bottomLeft: Radius.circular(5)),
                            ),
                            child: MaterialButton(
                              color: Colors.blue,
                              highlightColor:
                                  const Color.fromARGB(0, 248, 0, 0),
                              splashColor:
                                  const Color.fromARGB(255, 237, 196, 196),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 95.0),
                                child: Text(
                                  "Sign up",
                                  style: TextStyle(
                                      fontFamily: "SignikaSemiBold",
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontSize: 22.0),
                                ),
                              ),
                              onPressed: () {
                                createPost(
                                  focusNameController.text,
                                  focusLastNameController.text,
                                  focusUsernameController.text,
                                  focusPasswordController.text,
                                  focusEmailController.text,
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'post_json.dart';
import 'moving_splash.dart';

// import '../datetime_picker.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() {
    return _SignUpState();
  }
}

class _SignUpState extends State<SignUp> {
  final FocusNode focusName = FocusNode();
  final FocusNode focusLastName = FocusNode();
  final FocusNode focusEmail = FocusNode();
  final FocusNode focusPassword = FocusNode();
  final FocusNode focusUsername = FocusNode();
  final FocusNode focusCityName = FocusNode();
  final FocusNode focusDistrict = FocusNode();
  final FocusNode focusNeighbourhood = FocusNode();
  final FocusNode focusStreet = FocusNode();
  final FocusNode focusposCode = FocusNode();
  final FocusNode focusNumberOfHome = FocusNode();
  final FocusNode focusAddress = FocusNode();

  final TextEditingController focusNameController = TextEditingController();
  final TextEditingController focusLastNameController = TextEditingController();
  final TextEditingController focusUsernameController = TextEditingController();
  final TextEditingController focusPasswordController = TextEditingController();
  final TextEditingController focusEmailController = TextEditingController();
  final TextEditingController focusCityNameController = TextEditingController();
  final TextEditingController focusDistrictController = TextEditingController();
  final TextEditingController focusNeighbourhoodController =
      TextEditingController();
  final TextEditingController focusStreetController = TextEditingController();
  final TextEditingController focusposCodeController = TextEditingController();
  final TextEditingController focusNumberOfHomeController =
      TextEditingController();
  final TextEditingController focusAddressController = TextEditingController();

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
                          Row(
                            children: const [
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 24.0, bottom: 4.0),
                                child: Text(
                                  "Write your city name, please",
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
                              focusNode: focusCityName,
                              controller: focusCityNameController,
                              keyboardType: TextInputType.streetAddress,
                              style: const TextStyle(
                                  fontFamily: "SignikaSemiBold",
                                  fontSize: 16.0,
                                  color: Colors.black),
                              decoration: const InputDecoration(
                                  labelText: "Enter the city name",
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                  ),
                                  hintText: "Enter the city name",
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
                                  "Write your district, please",
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
                              focusNode: focusDistrict,
                              controller: focusDistrictController,
                              keyboardType: TextInputType.streetAddress,
                              style: const TextStyle(
                                  fontFamily: "SignikaSemiBold",
                                  fontSize: 16.0,
                                  color: Colors.black),
                              decoration: const InputDecoration(
                                  labelText: "Enter the district",
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                  ),
                                  hintText: "Enter the district",
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
                                  "Write your neighbourhood, please",
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
                              focusNode: focusNeighbourhood,
                              controller: focusNeighbourhoodController,
                              keyboardType: TextInputType.streetAddress,
                              style: const TextStyle(
                                  fontFamily: "SignikaSemiBold",
                                  fontSize: 16.0,
                                  color: Colors.black),
                              decoration: const InputDecoration(
                                  labelText: "Enter the neighbourhood",
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                  ),
                                  hintText: "Enter the neighbourhood",
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
                                  "Write your street, please",
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
                              focusNode: focusStreet,
                              controller: focusStreetController,
                              keyboardType: TextInputType.streetAddress,
                              style: const TextStyle(
                                  fontFamily: "SignikaSemiBold",
                                  fontSize: 16.0,
                                  color: Colors.black),
                              decoration: const InputDecoration(
                                  labelText: "Enter the street",
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                  ),
                                  hintText: "Enter the street",
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
                                  "Write your posCode, please",
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
                              focusNode: focusposCode,
                              controller: focusposCodeController,
                              keyboardType: TextInputType.number,
                              style: const TextStyle(
                                  fontFamily: "SignikaSemiBold",
                                  fontSize: 16.0,
                                  color: Colors.black),
                              decoration: const InputDecoration(
                                  labelText: "Enter the posCode",
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                  ),
                                  hintText: "Enter the posCode",
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
                                  "Write your numberOfHome, please",
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
                              focusNode: focusNumberOfHome,
                              controller: focusNumberOfHomeController,
                              keyboardType: TextInputType.streetAddress,
                              style: const TextStyle(
                                  fontFamily: "SignikaSemiBold",
                                  fontSize: 16.0,
                                  color: Colors.black),
                              decoration: const InputDecoration(
                                  labelText: "Enter the numberOfHome",
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                  ),
                                  hintText: "Enter the numberOfHome",
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
                                  "Write your address, please",
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
                              focusNode: focusAddress,
                              controller: focusAddressController,
                              keyboardType: TextInputType.streetAddress,
                              style: const TextStyle(
                                  fontFamily: "SignikaSemiBold",
                                  fontSize: 16.0,
                                  color: Colors.black),
                              decoration: const InputDecoration(
                                  labelText: "Enter the address",
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                  ),
                                  hintText: "Enter the address",
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
                                insertCustomert(
                                  focusNameController.text,
                                  focusLastNameController.text,
                                  focusUsernameController.text,
                                  focusPasswordController.text,
                                  focusEmailController.text,
                                  focusCityNameController.text,
                                  focusDistrictController.text,
                                  focusNeighbourhoodController.text,
                                  focusStreetController.text,
                                  focusposCodeController.text,
                                  focusNumberOfHomeController.text,
                                  focusAddressController.text,
                                );

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SimpleAnimation(),
                                  ),
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

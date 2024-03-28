import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../called/data_factory.dart';
import '../called/pop_up_menu.dart';
import 'moving_splash.dart';
import 'post_json.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() {
    return _LogInState();
  }
}

class _LogInState extends State<LogIn> {
  final FocusNode focusEmail = FocusNode();
  final FocusNode focusPassword = FocusNode();

  final TextEditingController focusEmailController = TextEditingController();
  final TextEditingController focusPasswordController = TextEditingController();

  get child => null;

  List<Customer> customers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Log in",
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
                          Row(
                            children: const [
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 24.0, bottom: 4.0),
                                child: Text(
                                  "Enter Email",
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
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                                hintText: "Enter the email",
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
                                  "Enter Password",
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
                              focusNode: focusPassword,
                              controller: focusPasswordController,
                              keyboardType: TextInputType.visiblePassword,
                              style: const TextStyle(
                                  fontFamily: "SignikaSemiBold",
                                  fontSize: 16.0,
                                  color: Colors.black),
                              decoration: const InputDecoration(
                                  labelText: "Enter the password",
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                  ),
                                  hintText: "Enter the password",
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
                                  "Log in",
                                  style: TextStyle(
                                      fontFamily: "SignikaSemiBold",
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontSize: 22.0),
                                ),
                              ),
                              onPressed: () async {
                                try {
                                  List<Customer> customers = await getCustomers(
                                    focusPasswordController.text,
                                    focusEmailController.text,
                                  );

                                  bool isAuthenticated = isUserAuthenticated(
                                    customers,
                                    focusEmailController.text,
                                    focusPasswordController.text,
                                  );

                                  if (isAuthenticated) {
                                    // Kullanıcı girişi başarılı, SharedPreferences kullanarak bilgileri sakla
                                    saveUserData(customers);
                                    Provider.of<UserState>(context, listen: false).setLoggedIn(true);
                                    // Diğer işlemleri gerçekleştir, örneğin bir ana sayfaya yönlendirme
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SimpleAnimation(),
                                      ),
                                    );

                                    print("Giriş başarili!");
                                  } else {
                                    // Kullanıcı girişi başarısız, hata mesajını ekrana yazdır
                                    print("Giriş başarisiz!");
                                  }
                                } catch (e) {
                                  // Bir hata oluştuğunda hatayı ekrana yazdır
                                  print('Hata: $e');
                                }
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

  bool isUserAuthenticated(
      List<Customer> customers, String mail, String password) {
    return customers.any(
        (customer) => customer.mail == mail && customer.password == password);
  }

  void saveUserData(List<Customer> customers) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (customers.isNotEmpty) {
      Customer user = customers.first;
      prefs.setString('userMail', user.mail);
      prefs.setString('userPassword', user.password);
    }
  }
}

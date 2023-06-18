import 'package:flutter/material.dart';

class TopUpCryptocurrencyAccountSettings extends StatefulWidget {
  const TopUpCryptocurrencyAccountSettings({Key? key}) : super(key: key);

  @override
  _TopUpCryptocurrencyAccountSettingsState createState() {
    return _TopUpCryptocurrencyAccountSettingsState();
  }
}

class _TopUpCryptocurrencyAccountSettingsState
    extends State<TopUpCryptocurrencyAccountSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Payment System",
          style: TextStyle(
              fontFamily: "SignikaSemiBold",
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 20.0),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber.shade400,
      ),
      body: SingleChildScrollView(
        child: Container(
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
                        Container(
                          width: 380,
                          padding: const EdgeInsets.symmetric(
                            vertical: 5.0,
                            horizontal: 10.0,
                          ),
                          child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "add money to Bitcoin (BTC) account",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: "SignikaSemiBold",
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            margin:
                                const EdgeInsets.only(top: 10.0, bottom: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                16.0,
                              ),
                              color: Colors.white,
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 5.0,
                              horizontal: 10.0,
                            ),
                            width: 380,
                            height: 60,
                            child: const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "transfer address:\n" +
                                    "3FZbgi29cpjq2GjdwV8eyHuJJnkLtktZc5",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: "SignikaSemiBold",
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 380,
                          padding: const EdgeInsets.symmetric(
                            vertical: 5.0,
                            horizontal: 10.0,
                          ),
                          child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "add money to Ethereum (ETH) account",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: "SignikaSemiBold",
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            margin:
                                const EdgeInsets.only(top: 10.0, bottom: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                16.0,
                              ),
                              color: Colors.white,
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 5.0,
                              horizontal: 10.0,
                            ),
                            width: 380,
                            height: 60,
                            child: const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "transfer address:\n" +
                                    ".........................",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: "SignikaSemiBold",
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 380,
                          padding: const EdgeInsets.symmetric(
                            vertical: 5.0,
                            horizontal: 10.0,
                          ),
                          child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "add money to Tether (USDT) account",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: "SignikaSemiBold",
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            margin:
                                const EdgeInsets.only(top: 10.0, bottom: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                16.0,
                              ),
                              color: Colors.white,
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 5.0,
                              horizontal: 10.0,
                            ),
                            width: 380,
                            height: 60,
                            child: const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "transfer address:\n" +
                                    ".........................",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: "SignikaSemiBold",
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 380,
                          padding: const EdgeInsets.symmetric(
                            vertical: 5.0,
                            horizontal: 10.0,
                          ),
                          child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "add money to BNB (BNB) account",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: "SignikaSemiBold",
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            margin:
                                const EdgeInsets.only(top: 10.0, bottom: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                16.0,
                              ),
                              color: Colors.white,
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 5.0,
                              horizontal: 10.0,
                            ),
                            width: 380,
                            height: 60,
                            child: const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "transfer address:\n" +
                                    ".........................",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: "SignikaSemiBold",
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 380,
                          padding: const EdgeInsets.symmetric(
                            vertical: 5.0,
                            horizontal: 10.0,
                          ),
                          child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "add money to XRP (XRP) account",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: "SignikaSemiBold",
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            margin:
                                const EdgeInsets.only(top: 10.0, bottom: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                16.0,
                              ),
                              color: Colors.white,
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 5.0,
                              horizontal: 10.0,
                            ),
                            width: 380,
                            height: 60,
                            child: const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "transfer address:\n" +
                                    ".........................",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: "SignikaSemiBold",
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 380,
                          padding: const EdgeInsets.symmetric(
                            vertical: 5.0,
                            horizontal: 10.0,
                          ),
                          child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "add money to Cardano (ADA) account",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: "SignikaSemiBold",
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            margin:
                                const EdgeInsets.only(top: 10.0, bottom: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                16.0,
                              ),
                              color: Colors.white,
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 5.0,
                              horizontal: 10.0,
                            ),
                            width: 380,
                            height: 60,
                            child: const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "transfer address:\n" +
                                    ".........................",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: "SignikaSemiBold",
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 18.0,
                                ),
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
      ),
    );
  }
}

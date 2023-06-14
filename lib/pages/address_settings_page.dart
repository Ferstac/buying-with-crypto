import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddressSettings extends StatefulWidget {
  const AddressSettings({Key? key}) : super(key: key);

  @override
  _AddressSettingsState createState() => _AddressSettingsState();
}

class _AddressSettingsState extends State<AddressSettings> {
  List<String> addresses = [];

  TextEditingController firstNameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController telephoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadAddresses();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    cityController.dispose();
    stateController.dispose();
    postalCodeController.dispose();
    countryController.dispose();
    telephoneController.dispose();
    super.dispose();
  }

  Future<void> loadAddresses() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      addresses = prefs.getStringList('addresses') ?? [];
    });
  }

  Future<void> saveAddresses() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('addresses', addresses);
  }

  Future<void> editAddress(int index) async {
    String address = addresses[index];
    List<String> addressParts = address.split('\n');
    String firstNameLastName =
        addressParts[0].substring('First Name/Last Name: '.length);
    String cityLocality = addressParts[1].substring('City/Locality: '.length);
    String stateProvince = addressParts[2].substring('State/Province: '.length);
    String postalCode = addressParts[3].substring('Postal Code: '.length);
    String country = addressParts[4].substring('Country: '.length);
    String telephoneNumber =
        addressParts[5].substring('Telephone number: '.length);

    firstNameController.text = firstNameLastName;
    cityController.text = cityLocality;
    stateController.text = stateProvince;
    postalCodeController.text = postalCode;
    countryController.text = country;
    telephoneController.text = telephoneNumber;

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Address'),
          content: Column(
            children: <Widget>[
              TextField(
                controller: firstNameController,
                decoration: const InputDecoration(
                  labelText: 'First Name/Last Name',
                ),
              ),
              TextField(
                controller: cityController,
                decoration: const InputDecoration(
                  labelText: 'City/Locality',
                ),
              ),
              TextField(
                controller: stateController,
                decoration: const InputDecoration(
                  labelText: 'State/Province',
                ),
              ),
              TextField(
                controller: postalCodeController,
                decoration: const InputDecoration(
                  labelText: 'Postal Code',
                ),
              ),
              TextField(
                controller: countryController,
                decoration: const InputDecoration(
                  labelText: 'Country',
                ),
              ),
              TextField(
                controller: telephoneController,
                decoration: const InputDecoration(
                  labelText: 'Telephone number',
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                String editedAddress = 'First Name/Last Name: ' +
                    firstNameController.text +
                    '\n' +
                    'City/Locality: ' +
                    cityController.text +
                    '\n' +
                    'State/Province: ' +
                    stateController.text +
                    '\n' +
                    'Postal Code: ' +
                    postalCodeController.text +
                    '\n' +
                    'Country: ' +
                    countryController.text +
                    '\n' +
                    'Telephone number: ' +
                    telephoneController.text;

                setState(() {
                  addresses[index] = editedAddress;
                });

                saveAddresses();
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Address Settings",
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
            Expanded(
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Add Address'),
                                    content: Column(
                                      children: <Widget>[
                                        TextField(
                                          controller: firstNameController,
                                          decoration: const InputDecoration(
                                            labelText: 'First Name/Last Name',
                                          ),
                                        ),
                                        TextField(
                                          controller: cityController,
                                          decoration: const InputDecoration(
                                            labelText: 'City/Locality',
                                          ),
                                        ),
                                        TextField(
                                          controller: stateController,
                                          decoration: const InputDecoration(
                                            labelText: 'State/Province',
                                          ),
                                        ),
                                        TextField(
                                          controller: postalCodeController,
                                          decoration: const InputDecoration(
                                            labelText: 'Postal Code',
                                          ),
                                        ),
                                        TextField(
                                          controller: countryController,
                                          decoration: const InputDecoration(
                                            labelText: 'Country',
                                          ),
                                        ),
                                        TextField(
                                          controller: telephoneController,
                                          decoration: const InputDecoration(
                                            labelText: 'Telephone number',
                                          ),
                                        ),
                                      ],
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          String address =
                                              'First Name/Last Name: ' +
                                                  firstNameController.text +
                                                  '\n' +
                                                  'City/Locality: ' +
                                                  cityController.text +
                                                  '\n' +
                                                  'State/Province: ' +
                                                  stateController.text +
                                                  '\n' +
                                                  'Postal Code: ' +
                                                  postalCodeController.text +
                                                  '\n' +
                                                  'Country: ' +
                                                  countryController.text +
                                                  '\n' +
                                                  'Telephone number: ' +
                                                  telephoneController.text;
                                          setState(() {
                                            addresses.add(address);
                                          });
                                          saveAddresses();
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Add'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Cancel'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            icon: const Icon(
                              CupertinoIcons.add,
                              size: 34,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: Colors.white,
                    ),
                    width: 380,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 10.0,
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: addresses.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(addresses[index]),
                          trailing: IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              editAddress(index);
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

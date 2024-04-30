import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../called/data_factory.dart';
import '../signup_login/post_json.dart';

class AddressSettings extends StatefulWidget {
  const AddressSettings({Key? key}) : super(key: key);

  @override
  _AddressSettingsState createState() => _AddressSettingsState();
}

class _AddressSettingsState extends State<AddressSettings> {
  List<String> addresses = [];

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController cityNameController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController neighbourhoodController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController posCodeController = TextEditingController();
  TextEditingController numberOfHomeController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await loadAddresses();
      setState(() {});
    });
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    cityNameController.dispose();
    districtController.dispose();
    neighbourhoodController.dispose();
    streetController.dispose();
    posCodeController.dispose();
    numberOfHomeController.dispose();
    addressController.dispose();
    super.dispose();
  }

  Future<void> loadAddresses() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> addressesLoad = prefs.getStringList('addresses') ?? [];
    addresses.addAll(addressesLoad);
  }

  Future<void> saveAddresses() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('addresses', addresses);
    prefs.setString('firstName', firstNameController.text);
    prefs.setString('lastName', lastNameController.text);
    prefs.setString('cityName', cityNameController.text);
    prefs.setString('district', districtController.text);
    prefs.setString('neighbourhood', neighbourhoodController.text);
    prefs.setString('street', streetController.text);
    prefs.setString('posCode', posCodeController.text);
    prefs.setString('numberOfHome', numberOfHomeController.text);
    prefs.setString('address', addressController.text);
  }

  Future<void> editAddress(int index) async {
    String address = addresses[index];
    List<String> addressParts = address.split('\n');
    String firstName = addressParts[0].substring('First Name: '.length);
    String lastName = addressParts[1].substring('Last Name: '.length);
    String cityName = addressParts[2].substring('City Name: '.length);
    String district = addressParts[3].substring('District: '.length);
    String neighbourhood = addressParts[4].substring('Neighbourhood: '.length);
    String street = addressParts[5].substring('Street: '.length);
    String posCode = addressParts[6].substring('Pos Code: '.length);
    String numberOfHome = addressParts[7].substring('Number Of Home: '.length);
    String fullAddress = addressParts[8].substring('Full Address: '.length);

    firstNameController.text = firstName;
    lastNameController.text = lastName;
    cityNameController.text = cityName;
    districtController.text = district;
    neighbourhoodController.text = neighbourhood;
    streetController.text = street;
    posCodeController.text = posCode;
    numberOfHomeController.text = numberOfHome;
    addressController.text = fullAddress;

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: AlertDialog(
            title: const Text('Edit Address'),
            content: Column(
              children: <Widget>[
                TextField(
                  controller: firstNameController,
                  decoration: const InputDecoration(
                    labelText: 'First Name',
                  ),
                ),
                TextField(
                  controller: lastNameController,
                  decoration: const InputDecoration(
                    labelText: 'Last Name',
                  ),
                ),
                TextField(
                  controller: cityNameController,
                  decoration: const InputDecoration(
                    labelText: 'City Name',
                  ),
                ),
                TextField(
                  controller: districtController,
                  decoration: const InputDecoration(
                    labelText: 'District',
                  ),
                ),
                TextField(
                  controller: neighbourhoodController,
                  decoration: const InputDecoration(
                    labelText: 'Neighbourhood',
                  ),
                ),
                TextField(
                  controller: streetController,
                  decoration: const InputDecoration(
                    labelText: 'Street',
                  ),
                ),
                TextField(
                  controller: posCodeController,
                  decoration: const InputDecoration(
                    labelText: 'Pos Code',
                  ),
                ),
                TextField(
                  controller: numberOfHomeController,
                  decoration: const InputDecoration(
                    labelText: 'Number Of Home',
                  ),
                ),
                TextField(
                  controller: addressController,
                  decoration: const InputDecoration(
                    labelText: 'Full Address',
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  String editedAddress = 'First Name: ' +
                      firstNameController.text +
                      '\n' +
                      'Last Name: ' +
                      lastNameController.text +
                      '\n' +
                      'City Name: ' +
                      cityNameController.text +
                      '\n' +
                      'District: ' +
                      districtController.text +
                      '\n' +
                      'Neighbourhood: ' +
                      neighbourhoodController.text +
                      'Street: ' +
                      streetController.text +
                      'Pos Code: ' +
                      posCodeController.text +
                      'Number Of Home: ' +
                      numberOfHomeController.text +
                      '\n' +
                      'Full Address: ' +
                      addressController.text;

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
          ),
        );
      },
    );
  }

  Future<void> deleteAddress(int index) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Address'),
          content: const Text('Are you sure you want to delete this address?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                setState(() {
                  addresses.removeAt(index);
                });

                saveAddresses();
                Navigator.of(context).pop();
              },
              child: const Text('Delete'),
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
                                  return SingleChildScrollView(
                                    child: AlertDialog(
                                      title: const Text('Add Address'),
                                      content: Column(
                                        children: <Widget>[
                                          TextField(
                                            controller: firstNameController,
                                            decoration: const InputDecoration(
                                              labelText: 'First Name',
                                            ),
                                          ),
                                          TextField(
                                            controller: lastNameController,
                                            decoration: const InputDecoration(
                                              labelText: 'Last Name',
                                            ),
                                          ),
                                          TextField(
                                            controller: cityNameController,
                                            decoration: const InputDecoration(
                                              labelText: 'City Name',
                                            ),
                                          ),
                                          TextField(
                                            controller: districtController,
                                            decoration: const InputDecoration(
                                              labelText: 'District',
                                            ),
                                          ),
                                          TextField(
                                            controller: neighbourhoodController,
                                            decoration: const InputDecoration(
                                              labelText: 'Neighbourhood',
                                            ),
                                          ),
                                          TextField(
                                            controller: streetController,
                                            decoration: const InputDecoration(
                                              labelText: 'Street',
                                            ),
                                          ),
                                          TextField(
                                            controller: posCodeController,
                                            decoration: const InputDecoration(
                                              labelText: 'Pos Code',
                                            ),
                                          ),
                                          TextField(
                                            controller: numberOfHomeController,
                                            decoration: const InputDecoration(
                                              labelText: 'Number Of Home',
                                            ),
                                          ),
                                          TextField(
                                            controller: addressController,
                                            decoration: const InputDecoration(
                                              labelText: 'Full Address',
                                            ),
                                          ),
                                        ],
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () async {
                                            String address = 'First Name: ' +
                                                firstNameController.text +
                                                '\n' +
                                                'Last Name: ' +
                                                lastNameController.text +
                                                '\n' +
                                                'City Name: ' +
                                                cityNameController.text +
                                                '\n' +
                                                'District: ' +
                                                districtController.text +
                                                '\n' +
                                                'Neighbourhood: ' +
                                                neighbourhoodController.text +
                                                'Street: ' +
                                                streetController.text +
                                                'Pos Code: ' +
                                                posCodeController.text +
                                                'Number Of Home: ' +
                                                numberOfHomeController.text +
                                                '\n' +
                                                'Full Address: ' +
                                                addressController.text;
                                            setState(() {
                                              addresses.add(address);
                                            });
                                            saveAddresses();
                                            Navigator.of(context).pop();
                                            SharedPreferences prefs =
                                                await SharedPreferences
                                                    .getInstance();
                                            String mail =
                                                prefs.getString('userMail') ??
                                                    '';
                                            String password = prefs.getString(
                                                    'userPassword') ??
                                                '';
                                            await getCustomersID(
                                              password,
                                              mail,
                                            );
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
                                    ),
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
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () {
                                  editAddress(index);
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  deleteAddress(index);
                                },
                              ),
                            ],
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

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

  TextEditingController editfirstNameController = TextEditingController();
  TextEditingController editlastNameController = TextEditingController();
  TextEditingController editcityNameController = TextEditingController();
  TextEditingController editdistrictController = TextEditingController();
  TextEditingController editneighbourhoodController = TextEditingController();
  TextEditingController editstreetController = TextEditingController();
  TextEditingController editposCodeController = TextEditingController();
  TextEditingController editnumberOfHomeController = TextEditingController();
  TextEditingController editaddressController = TextEditingController();

  TextEditingController newfirstNameController = TextEditingController();
  TextEditingController newlastNameController = TextEditingController();
  TextEditingController newcityNameController = TextEditingController();
  TextEditingController newdistrictController = TextEditingController();
  TextEditingController newneighbourhoodController = TextEditingController();
  TextEditingController newstreetController = TextEditingController();
  TextEditingController newposCodeController = TextEditingController();
  TextEditingController newnumberOfHomeController = TextEditingController();
  TextEditingController newaddressController = TextEditingController();

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
    editfirstNameController.dispose();
    editlastNameController.dispose();
    editcityNameController.dispose();
    editdistrictController.dispose();
    editneighbourhoodController.dispose();
    editstreetController.dispose();
    editposCodeController.dispose();
    editnumberOfHomeController.dispose();
    editaddressController.dispose();
    newfirstNameController.dispose();
    newlastNameController.dispose();
    newcityNameController.dispose();
    newdistrictController.dispose();
    newneighbourhoodController.dispose();
    newstreetController.dispose();
    newposCodeController.dispose();
    newnumberOfHomeController.dispose();
    newaddressController.dispose();
    super.dispose();
  }

  void clearControllers() {
    newfirstNameController.clear();
    newlastNameController.clear();
    newcityNameController.clear();
    newdistrictController.clear();
    newneighbourhoodController.clear();
    newstreetController.clear();
    newposCodeController.clear();
    newnumberOfHomeController.clear();
    newaddressController.clear();
  }

  Future<void> loadAddresses() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> addressesLoad = prefs.getStringList('addresses') ?? [];
    addresses.addAll(addressesLoad);
  }

  Future<void> saveAddresses() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('addresses', addresses);
    prefs.setString('firstName', newfirstNameController.text);
    prefs.setString('lastName', newlastNameController.text);
    prefs.setString('cityName', newcityNameController.text);
    prefs.setString('district', newdistrictController.text);
    prefs.setString('neighbourhood', newneighbourhoodController.text);
    prefs.setString('street', newstreetController.text);
    prefs.setString('posCode', newposCodeController.text);
    prefs.setString('numberOfHome', newnumberOfHomeController.text);
    prefs.setString('address', newaddressController.text);
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

    editfirstNameController.text = firstName;
    editlastNameController.text = lastName;
    editcityNameController.text = cityName;
    editdistrictController.text = district;
    editneighbourhoodController.text = neighbourhood;
    editstreetController.text = street;
    editposCodeController.text = posCode;
    editnumberOfHomeController.text = numberOfHome;
    editaddressController.text = fullAddress;

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: AlertDialog(
            title: const Text('Edit Address'),
            content: Column(
              children: <Widget>[
                TextField(
                  controller: editfirstNameController,
                  decoration: const InputDecoration(
                    labelText: 'First Name',
                  ),
                ),
                TextField(
                  controller: editlastNameController,
                  decoration: const InputDecoration(
                    labelText: 'Last Name',
                  ),
                ),
                TextField(
                  controller: editcityNameController,
                  decoration: const InputDecoration(
                    labelText: 'City Name',
                  ),
                ),
                TextField(
                  controller: editdistrictController,
                  decoration: const InputDecoration(
                    labelText: 'District',
                  ),
                ),
                TextField(
                  controller: editneighbourhoodController,
                  decoration: const InputDecoration(
                    labelText: 'Neighbourhood',
                  ),
                ),
                TextField(
                  controller: editstreetController,
                  decoration: const InputDecoration(
                    labelText: 'Street',
                  ),
                ),
                TextField(
                  controller: editposCodeController,
                  decoration: const InputDecoration(
                    labelText: 'Pos Code',
                  ),
                ),
                TextField(
                  controller: editnumberOfHomeController,
                  decoration: const InputDecoration(
                    labelText: 'Number Of Home',
                  ),
                ),
                TextField(
                  controller: editaddressController,
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
                      editfirstNameController.text +
                      '\n' +
                      'Last Name: ' +
                      editlastNameController.text +
                      '\n' +
                      'City Name: ' +
                      editcityNameController.text +
                      '\n' +
                      'District: ' +
                      editdistrictController.text +
                      '\n' +
                      'Neighbourhood: ' +
                      editneighbourhoodController.text +
                      '\n' +
                      'Street: ' +
                      editstreetController.text +
                      '\n' +
                      'Pos Code: ' +
                      editposCodeController.text +
                      '\n' +
                      'Number Of Home: ' +
                      editnumberOfHomeController.text +
                      '\n' +
                      'Full Address: ' +
                      editaddressController.text;

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
    String address = addresses[index];
    List<String> addressParts = address.split('\n');
    String cityName = addressParts[2].substring('City Name: '.length);
    String district = addressParts[3].substring('District: '.length);
    String neighbourhood = addressParts[4].substring('Neighbourhood: '.length);
    String street = addressParts[5].substring('Street: '.length);
    String posCode = addressParts[6].substring('Pos Code: '.length);
    String numberOfHome = addressParts[7].substring('Number Of Home: '.length);
    String fullAddress = addressParts[8].substring('Full Address: '.length);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Address'),
          content: const Text('Are you sure you want to delete this address?'),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                await getAddressID(cityName, district, neighbourhood, street, posCode,
                    numberOfHome, fullAddress);

                // Listeden adresi kaldır
                setState(() {
                  addresses.removeAt(index);
                });

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
                              clearControllers();
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return SingleChildScrollView(
                                    child: AlertDialog(
                                      title: const Text('Add Address'),
                                      content: Column(
                                        children: <Widget>[
                                          TextField(
                                            controller: newfirstNameController,
                                            decoration: const InputDecoration(
                                              labelText: 'First Name',
                                            ),
                                          ),
                                          TextField(
                                            controller: newlastNameController,
                                            decoration: const InputDecoration(
                                              labelText: 'Last Name',
                                            ),
                                          ),
                                          TextField(
                                            controller: newcityNameController,
                                            decoration: const InputDecoration(
                                              labelText: 'City Name',
                                            ),
                                          ),
                                          TextField(
                                            controller: newdistrictController,
                                            decoration: const InputDecoration(
                                              labelText: 'District',
                                            ),
                                          ),
                                          TextField(
                                            controller:
                                                newneighbourhoodController,
                                            decoration: const InputDecoration(
                                              labelText: 'Neighbourhood',
                                            ),
                                          ),
                                          TextField(
                                            controller: newstreetController,
                                            decoration: const InputDecoration(
                                              labelText: 'Street',
                                            ),
                                          ),
                                          TextField(
                                            controller: newposCodeController,
                                            decoration: const InputDecoration(
                                              labelText: 'Pos Code',
                                            ),
                                          ),
                                          TextField(
                                            controller:
                                                newnumberOfHomeController,
                                            decoration: const InputDecoration(
                                              labelText: 'Number Of Home',
                                            ),
                                          ),
                                          TextField(
                                            controller: newaddressController,
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
                                                newfirstNameController.text +
                                                '\n' +
                                                'Last Name: ' +
                                                newlastNameController.text +
                                                '\n' +
                                                'City Name: ' +
                                                newcityNameController.text +
                                                '\n' +
                                                'District: ' +
                                                newdistrictController.text +
                                                '\n' +
                                                'Neighbourhood: ' +
                                                newneighbourhoodController
                                                    .text +
                                                '\n' +
                                                'Street: ' +
                                                newstreetController.text +
                                                '\n' +
                                                'Pos Code: ' +
                                                newposCodeController.text +
                                                '\n' +
                                                'Number Of Home: ' +
                                                newnumberOfHomeController.text +
                                                '\n' +
                                                'Full Address: ' +
                                                newaddressController.text;
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

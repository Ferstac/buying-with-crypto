import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../called/data_factory.dart';

Future insertCustomert(
    String firstName,
    String lastName,
    String username,
    String password,
    String mail,
    String cityName,
    String district,
    String neighbourhood,
    String street,
    String posCode,
    String numberOfHome,
    String address) async {
  final response = await http.post(
    Uri.parse(
      'https://ilhamsadikhov.com/buyingwithcrypto/insertcustomer_v2.php',
    ),
    headers: <String, String>{
      // 'Content-Type': 'application/json; charset=utf-8',
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Credentials': 'true',
      'Access-Control-Allow-Headers': 'Content-Type',
      'Access-Control-Allow-Methods': 'GET,PUT,POST,DELETE',
      // 'Content': 'application/json;'
    },
    body: {
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'password': password,
      'mail': mail,
      'cityName': cityName,
      'district': district,
      'neighbourhood': neighbourhood,
      'street': street,
      'posCode': posCode,
      'numberOfHome': numberOfHome,
      'address': address
    },
    // encoding: Encoding.getByName('utf-8'),
  );

  if (response.body != "error") {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return response.body;
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception(response);
  }
}

Future<List<Customer>> getCustomers(String password, String mail) async {
  final response = await http.post(
    Uri.parse('https://ilhamsadikhov.com/buyingwithcrypto/getcustomers_v2.php'),
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Credentials': 'true',
      'Access-Control-Allow-Headers': 'Content-Type',
      'Access-Control-Allow-Methods': 'GET,PUT,POST,DELETE',
    },
    body: {
      'password': password,
      'mail': mail,
    },
  );

  print(response.body);

  if (response.statusCode == 200) {
    List<Customer> customers = [];
    var jsonData = json.decode(response.body);

    for (var customerData in jsonData['customers']) {
      customers.add(Customer.fromJson(customerData));

      String customerIdStr = customerData['customerId'];
      int customerId =
          int.tryParse(customerIdStr) ?? 0; // String'i int'e dönüştür

      // fetchCustomerData metodunu customerId ile çağır
      await fetchCustomerData(customerId);
    }

    return customers;
  } else {
    throw Exception('Failed to load customers');
  }
}

Future<List<Customer>> getCustomersID(String password, String mail) async {
  final response = await http.post(
    Uri.parse('https://ilhamsadikhov.com/buyingwithcrypto/getcustomers_v2.php'),
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Credentials': 'true',
      'Access-Control-Allow-Headers': 'Content-Type',
      'Access-Control-Allow-Methods': 'GET,PUT,POST,DELETE',
    },
    body: {
      'password': password,
      'mail': mail,
    },
  );

  print(response.body);

  if (response.statusCode == 200) {
    List<Customer> customers = [];
    var jsonData = json.decode(response.body);

    for (var customerData in jsonData['customers']) {
      customers.add(Customer.fromJson(customerData));

      String customerIdStr = customerData['customerId'];
      int customerId =
          int.tryParse(customerIdStr) ?? 0; // String'i int'e dönüştür

      SharedPreferences prefs = await SharedPreferences.getInstance();

      String cityName = prefs.getString('cityName') ?? '';
      String district = prefs.getString('district') ?? '';
      String neighbourhood = prefs.getString('neighbourhood') ?? '';
      String street = prefs.getString('street') ?? '';
      String posCode = prefs.getString('posCode') ?? '';
      String numberOfHome = prefs.getString('numberOfHome') ?? '';
      String address = prefs.getString('address') ?? '';
      await addNewAddress(customerId, cityName, district, neighbourhood, street,
          posCode, numberOfHome, address);
    }

    return customers;
  } else {
    throw Exception('Failed to load customers');
  }
}

Future<void> getAddressID(
    String cityName,
    String district,
    String neighbourhood,
    String street,
    String posCode,
    String numberOfHome,
    String address) async {
  final response = await http.post(
    Uri.parse(
        'https://ilhamsadikhov.com/buyingwithcrypto/getAddressIdFromIndex.php'),
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Credentials': 'true',
      'Access-Control-Allow-Headers': 'Content-Type',
      'Access-Control-Allow-Methods': 'GET,PUT,POST,DELETE',
    },
    body: {
      'cityName': cityName,
      'district': district,
      'neighbourhood': neighbourhood,
      'street': street,
      'posCode': posCode,
      'numberOfHome': numberOfHome,
      'address': address,
    },
  );

  print(response.body);

  if (response.statusCode == 200) {
    var jsonData = json.decode(response.body);

    for (var addressData in jsonData['address']) {
      String addressIdStr = addressData['addressId'];
      int addressId =
          int.tryParse(addressIdStr) ?? 0; // String'i int'e dönüştür

      await deleteAddressFromDatabase(addressId);
    }
  } else {
    throw Exception('Failed to load address');
  }
}

Future<void> addNewAddress(
    int customerId,
    String cityName,
    String district,
    String neighbourhood,
    String street,
    String posCode,
    String numberOfHome,
    String address) async {
  final response = await http.post(
    Uri.parse('https://ilhamsadikhov.com/buyingwithcrypto/addnewaddress.php'),
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Credentials': 'true',
      'Access-Control-Allow-Headers': 'Content-Type',
      'Access-Control-Allow-Methods': 'GET,PUT,POST,DELETE',
    },
    body: {
      'customerId': customerId.toString(),
      'cityName': cityName,
      'district': district,
      'neighbourhood': neighbourhood,
      'street': street,
      'posCode': posCode,
      'numberOfHome': numberOfHome,
      'address': address,
    },
  );

  if (response.body != "error") {
    print("Yeni adres başariyla eklendi");
  } else {
    throw Exception("Adres eklenirken bir hata oluştu");
  }
}

Future<void> deleteAddressFromDatabase(int addressId) async {
  var url = Uri.parse(
      'https://ilhamsadikhov.com/buyingwithcrypto/deleteAddressFromDatabase.php');
  var response = await http.post(url, body: {
    'addressId': addressId.toString(),
  });

  if (response.statusCode == 200) {
    print('Address deleted successfully');
  } else {
    print('Failed to delete address: ${response.body}');
  }
}

Future<void> fetchCustomerData(int customerId) async {
  final response = await http.post(
    Uri.parse(
        'https://ilhamsadikhov.com/buyingwithcrypto/getcustomerwithaddress.php'),
    body: {
      'customerId': customerId.toString(),
    },
  );
  List<String> addresses = [];
  // print(response.body);

  if (response.statusCode == 200) {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var jsonData = json.decode(response.body);
    print(response.body);

    List<Map<String, dynamic>> customers =
        (jsonData['customers'] as List).cast<Map<String, dynamic>>();
    List<Map<String, dynamic>> address =
        (jsonData['address'] as List).cast<Map<String, dynamic>>();

    // print(customers);
    // print(addresses);

    if (customers.isNotEmpty && address.isNotEmpty) {
      // Save customer data to SharedPreferences
      prefs.setString('customerId', customers[0]['customerId'].toString());
      prefs.setString('firstName', customers[0]['firstName']);
      prefs.setString('lastName', customers[0]['lastName']);
      prefs.setString('username', customers[0]['username']);
      prefs.setString('password', customers[0]['password']);
      prefs.setString('mail', customers[0]['mail']);
      prefs.setString('addressId', customers[0]['addressId'].toString());
      prefs.setString('orderId', customers[0]['orderId'].toString());

      // Save address data to SharedPreferences
      for (int i = 0; i < address.length; i++) {
        String address1 = 'First Name: ${customers[i]["firstName"]}\n' +
            'Last Name: ${customers[i]["lastName"]}\n' +
            'City Name: ${address[i]["cityName"]}\n' +
            'District: ${address[i]["district"]}\n' +
            'Neighbourhood: ${address[i]["neighbourhood"]}\n' +
            'Street: ${address[i]["street"]}\n' +
            'Pos Code: ${address[i]["posCode"]}\n' +
            'Number Of Home: ${address[i]["numberOfHome"]}\n' +
            'Full Address: ${address[i]["address"]}\n';

        addresses.add(address1);
        await prefs.setStringList('addresses', addresses);
      }
      prefs.setString('addressId', address[0]['addressId'].toString());
      prefs.setString('customerId', address[0]['customerId'].toString());
      prefs.setString('cityName', address[0]['cityName']);
      prefs.setString('district', address[0]['district']);
      prefs.setString('neighbourhood', address[0]['neighbourhood']);
      prefs.setString('street', address[0]['street']);
      prefs.setString('posCode', address[0]['posCode']);
      prefs.setString('numberOfHome', address[0]['numberOfHome']);
      prefs.setString('address', address[0]['address']);
    }
  } else {
    throw Exception('Failed to load customer data');
  }
}

// class Post {
//   final String firstName;
//   final String lastName;
//   final String username;
//   final String password;
//   final String mail;

//   Post({
//     required this.firstName,
//     required this.lastName,
//     required this.username,
//     required this.password,
//     required this.mail,
//   });

//   @override
//   String toString() {
//     return "Post(firstName: $firstName, lastName: $lastName, username: $username, password: $password, mail: $mail)";
//   }

//   factory Post.fromJson(Map<String, dynamic> json) {
//     return Post(
//       firstName: json['firstName'],
//       lastName: json['lastName'],
//       username: json['username'],
//       password: json['password'],
//       mail: json['mail'],
//     );
//   }
// }

// Future<Post> createPost(String firstName, String lastName, String username,
//     String password, String mail) async {
//   final response = await http.post(
//     Uri.parse(
//       'https://ilhamsadikhov.com/buyingwithcrypto/insertcustomer_json.php',
//     ),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=utf-8',
//       'Access-Control-Allow-Origin': '*',
//       'Access-Control-Allow-Credentials': 'true',
//       'Access-Control-Allow-Headers': 'Content-Type',
//       'Access-Control-Allow-Methods': 'GET,PUT,POST,DELETE',
//       'Content': 'application/json;'
//     },
//     body: jsonEncode(
//       <String, String>{
//         'firstName': firstName,
//         'lastName': lastName,
//         'username': username,
//         'password': password,
//         'mail': mail,
//       },
//     ),
//     encoding: Encoding.getByName('utf-8'),
//   );
//   print(response.body);

//   if (response.statusCode == 201) {
//     print(response.body);
//     // If the server did return a 201 CREATED response,
//     // then parse the JSON.
//     return Post.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 201 CREATED response,
//     // then throw an exception.
//     throw Exception(response.statusCode);
//   }
// }

// createPost(String firstName, lastName, username, password, mail) async {
//     Map<String, String> data = {
      
//         'firstName': firstName,
//         'lastName': lastName,
//         'username': username,
//         'password': password,
//         'mail': mail,
//     };
//     print(data);

//     String body = json.encode(data);
//     var url = 'http://ilhamsadikhov.com/buyingwithcrypto/insertcustomer.php';
//     var response = await http.post(
//       Uri.parse(url),
//       body: body,
//       headers: {
//         "Content-Type": "application/json",
//         "accept": "application/json",
//         "Access-Control-Allow-Origin": "*"
//       },
//     );
//     print(response.body);
//     print(response.statusCode);
//     if (response.statusCode == 201) {
//       //Or put here your next screen using Navigator.push() method
//       print('success');
//     } else {
//       print(response.statusCode);
//     }
//   }

// ##################################################

// Future<void> makePostRequest() async {
//   var urlPrefix = "https://ilhamsadikhov.com/buyingwithcrypto/insertcustomer.php";
//   final url = Uri.parse('$urlPrefix/posts');
//   final headers = {"Content-type": "application/json"};
//   final json = '{"firstName": "iljam", "lastName": "sadigf", "username": "username", "password": "password", "mail": "ilahm@gmaf.com"}';
//   final response = await http.post(url, headers: headers, body: jsonEncode(json), encoding: Encoding.getByName('utf-8'));
//   print('Status code: ${response.statusCode}');
//   print('Body: ${response.body}');
// }
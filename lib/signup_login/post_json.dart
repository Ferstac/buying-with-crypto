import 'dart:async';
import 'dart:convert';
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

Future<void> fetchCustomerData(int customerId) async {
  final response = await http.post(
    Uri.parse(
        'https://ilhamsadikhov.com/buyingwithcrypto/getcustomerwithaddress.php'),
    body: {
      'customerId': customerId.toString(),
    },
  );

  // print(response.body);

  if (response.statusCode == 200) {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var jsonData = json.decode(response.body);
    print(response.body);

    List<Map<String, dynamic>> customers =
        (jsonData['customers'] as List).cast<Map<String, dynamic>>();
    List<Map<String, dynamic>> addresses =
        (jsonData['address'] as List).cast<Map<String, dynamic>>();

    // print(customers);
    // print(addresses);

    if (customers.isNotEmpty && addresses.isNotEmpty) {
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
      prefs.setString('addressId', addresses[0]['addressId'].toString());
      prefs.setString('customerId', addresses[0]['customerId'].toString());
      prefs.setString('district', addresses[0]['district']);
      prefs.setString('neighbourhood', addresses[0]['neighbourhood']);
      prefs.setString('street', addresses[0]['street']);
      prefs.setString('posCode', addresses[0]['posCode']);
      prefs.setString('numberOfHome', addresses[0]['numberOfHome']);
      prefs.setString('address', addresses[0]['address']);
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
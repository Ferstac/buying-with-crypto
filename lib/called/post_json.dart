import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


Future createPost(String firstName, String lastName, String username,
    String password, String mail) async {
  final response = await http.post(
    Uri.parse(
      'https://ilhamsadikhov.com/buyingwithcrypto/insertcustomer.php',
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
    },
    // encoding: Encoding.getByName('utf-8'),
  );
  print(response.body);

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
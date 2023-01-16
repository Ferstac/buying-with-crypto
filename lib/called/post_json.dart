import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Post {
  final String firstName;
  final String lastName;
  final String username;
  final String password;
  final String mail;

  Post(
      {required this.firstName,
      required this.lastName,
      required this.username,
      required this.password,
      required this.mail});

  @override
  String toString() {
    return "Post(firstName: $firstName, lastName: $lastName, username: $username, password: $password, mail: $mail)";
  }

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      firstName: json['firstName'],
      lastName: json['lastName'],
      username: json['username'],
      password: json['password'],
      mail: json['mail'],
    );
  }
}

Future<Post> createPost(String firstName, String lastName, String username,
    String password, String mail) async {
  final response = await http.post(
    Uri.parse('http://ilhamsadikhov.com/buyingwithcrypto/insertcustomer.php'),
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Credentials': 'true',
      'Access-Control-Allow-Headers': 'Content-Type',
      'Access-Control-Allow-Methods': 'GET,PUT,POST,DELETE'
    },
    body: jsonEncode(
      <String, String>{
        'firstName': firstName,
        'lastName': lastName,
        'username': username,
        'password': password,
        'mail': mail,
      },
    ),
  );
  print(response.body);

  if (response.statusCode == 201) {
    print(response.body);
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Post.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception(response.statusCode);
  }
}

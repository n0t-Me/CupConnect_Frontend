import 'package:hive_flutter/hive_flutter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/models/user.dart';

import 'package:flutter_application_1/constante.dart';

Future<dynamic> userAuth(String email, String password) async {
  Map body = {
    "email": email,
    "password": password
  };
  var uri = Uri.https('devjam.onrender.com', '/api/token/');
  var res = await http.post(uri, body: body);

  print(res.body);
  print(res.statusCode);
  if (res.statusCode == 200) {
    Map json = jsonDecode(res.body);
    String token = json['access'];
    var box = await Hive.openBox(tokenBox);
    box.put("token", token);
    User? user = await getUser(token, email); // Pass the email parameter here
    return user;
  } else {
    Map json = jsonDecode(res.body);
    print(json);
    if (json.containsKey("email")) {
      return json["email"][0];
    }
    if (json.containsKey("password")) {
      return json["password"][0];
    }
    if (json.containsKey("non_field_errors")) {
      return json["non_field_errors"][0];
    }
  }
}

Future<User?> getUser(String token, String email) async {
  var uri = Uri.https('devjam.onrender.com', '/api/user/getuser/$email');
  var res = await http.get(uri, headers: {
    'Authorization': 'Bearer $token',
  });

  if (res.statusCode == 200) {
    var json = jsonDecode(res.body);
    User user = User.fromJson(json);
    user.token = token;
    return user;
  } else {
    return null;
  }
}

Future<User?> registerUser(User user) async {
  // Serialize the user object into JSON format
  Map<String, dynamic> body = user.toJson();

  var uri = Uri.https('devjam.onrender.com', '/api/user/create/');
  var res = await http.post(uri, body: body);

  if (res.statusCode == 201) {
    print("User registered successfully");
    return null;
  } else {
    print("Registration failed with status code: ${res.statusCode}");
    print("Response body: ${res.body}");
    return null;
  }
}
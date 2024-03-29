import 'package:flutter_application_1/models/studium.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Studiumapi {
  static Future<List<Studium>> getStudium() async {
    var uri = Uri.https('devjam.onrender.com', 'api/stadium/');

    final response = await http.get(uri);

if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(Utf8Decoder().convert(response.bodyBytes));
      List<Studium> studiums = [];

      for (var item in data) {
        Studium studium = Studium.fromJson(item);
        studiums.add(studium);
      }

      return studiums;}
else {
     print('Failed to load data. Status Code: ${response.statusCode}');
      throw Exception('Failed to load data');
    }
  }
}
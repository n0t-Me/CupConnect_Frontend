import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_application_1/models/city.dart';

class CityApi {
  static Future<City> getCityByStadId(int id) async {
    var uri = Uri.https('devjam.onrender.com', 'api/city/$id');

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      City city = City.fromJson(data);
      return city;
    } else {
      print('Failed to load data. Status Code: ${response.statusCode}');
      throw Exception('Failed to load data');
    }
  }
}

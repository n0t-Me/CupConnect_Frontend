import 'package:flutter_application_1/models/dishes.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DishApi {
  static Future<List<Dish>> getDishesByCityName(String cityName) async {
    var uri = Uri.https('devjam.onrender.com', 'api/dishes/$cityName');

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(Utf8Decoder().convert(response.bodyBytes));
      List<Dish> dishes = [];

      for (var item in data) {
        Dish dish = Dish.fromJson(item);
        dishes.add(dish);
      }

      return dishes;
    } else {
      print('Failed to load data. Status Code: ${response.statusCode}');
      throw Exception('Failed to load data');
    }
  }
}

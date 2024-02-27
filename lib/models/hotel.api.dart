import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_application_1/models/hotel.dart';

class HotelApi {
  static Future<List<Hotel>> getHotels(int stadId) async {
    var uri = Uri.https('devjam.onrender.com', 'api/hotel/$stadId');

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(Utf8Decoder().convert(response.bodyBytes));
      List<Hotel> hotels = [];

      for (var item in data) {
        Hotel hotel = Hotel.fromJson(item);
        hotels.add(hotel);
      }

      return hotels;
    } else {
      print('Failed to load data. Status Code: ${response.statusCode}');
      throw Exception('Failed to load data');
    }
  }
}

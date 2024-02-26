import 'dart:convert';

class User {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String gender;
  final String phone;
  final String country;
  String token;
  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.gender,
    required this.phone,
    required this.country,
     required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      gender: json['gender'] as String,
      phone: json['phone'] as String,
      country: json['country'] as String,
      token: '',
    );
  }

  static List<User> usersFromJson(String jsonString) {
    final jsonData = json.decode(jsonString);
    return List<User>.from(jsonData.map((user) => User.fromJson(user)));
  }
}

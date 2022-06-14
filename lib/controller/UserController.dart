import 'dart:convert';

import 'package:alcanceaulas/model/user.dart';
import 'package:http/http.dart' as http;

class UserController {
  UserController();

  static Future<User> login(String email, String document) async {
    final response = await http.get(Uri.parse(
        "https://alcanceaulas-d555e-default-rtdb.firebaseio.com/users.json"));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      List<User> users = data.values
          .cast<Map<String, dynamic>>()
          .map<User>((item) => User.fromJson(item))
          .toList();

      return users.firstWhere(
          (user) => (user.email == email && user.document == document));
    } else {
      throw Exception('Failed to load user');
    }
  }
}

import 'package:alcanceaulas/controller/UserController.dart';
import 'package:flutter/cupertino.dart';

class User extends ChangeNotifier {
  int user_id;
  String name;
  String email;
  String document;
  String image;

  User(
      {required this.user_id,
      required this.name,
      required this.email,
      required this.document,
      required this.image});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        user_id: json['user_id'],
        name: json['name'],
        email: json['email'],
        document: json['document'],
        image: json['image']);
  }
}

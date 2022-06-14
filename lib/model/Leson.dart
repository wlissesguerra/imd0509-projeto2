import 'package:flutter/cupertino.dart';

class Leson extends ChangeNotifier {
  int id;
  int course_id;
  String title;
  String video;
  String description;
  List<String> anotacoes = [];

  Leson(
      {required this.id,
      required this.course_id,
      required this.title,
      required this.video,
      required this.description,
      required this.anotacoes});

  void addAnotacao(String anotacao) {
    anotacoes.add(anotacao);
    notifyListeners();
  }

  factory Leson.fromJson(Map<String, dynamic> json) {
    return Leson(
        id: json['id'],
        course_id: json['course_id'],
        title: json['title'],
        description: json['description'],
        video: json['video'],
        anotacoes: <String>[]);
  }
}

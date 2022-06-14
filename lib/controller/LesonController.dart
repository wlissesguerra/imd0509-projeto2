import 'dart:convert';

import '../model/Leson.dart';
import 'package:http/http.dart' as http;

class LesonController {
  final _baseUri =
      "https://alcanceaulas-d555e-default-rtdb.firebaseio.com/lesons.json";

  Future<void> create(Leson leson) async {
    final request = http.post(Uri.parse(_baseUri),
        body: jsonEncode({
          'id': leson.id,
          'course_id': leson.course_id,
          'title': leson.title,
          'description': leson.description,
          'video': leson.video,
          'anotacoes': leson.anotacoes
        }));
    request.then((value) => print(value));
  }

  Future<Leson> getLesonById(id) async {
    final response = await http.get(Uri.parse(_baseUri));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      Leson leson = data.values
          .cast<Map<String, dynamic>>()
          .map<Leson>((item) => Leson.fromJson(item))
          .firstWhere((element) => element.id == id);

      return leson;
    } else {
      throw Exception('Failed to load user');
    }
  }

  Future<List<Leson>> getLesonsByCourseId(course_id) async {
    final response = await http.get(Uri.parse(_baseUri));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      List<Leson> lesons = data.values
          .cast<Map<String, dynamic>>()
          .map<Leson>((item) => Leson.fromJson(item))
          .where((element) => element.course_id == course_id)
          .toList();
      return lesons;
    } else {
      throw Exception('Failed to load user');
    }
  }
}

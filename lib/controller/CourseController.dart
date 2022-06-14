import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/Course.dart';

class CourseController {
  final _baseUri =
      "https://alcanceaulas-d555e-default-rtdb.firebaseio.com/courses.json";

  Future<void> create(Course course) async {
    final request = http.post(Uri.parse(_baseUri),
        body: jsonEncode({
          "course_id": course.course_id,
          "title": course.title,
          "description": course.description,
          "image": course.image,
        }));
    request.then((value) => print(value));
  }

  Future<List<Course>> getAllCourses() async {
    final response = await http.get(Uri.parse(_baseUri));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      List<Course> courses = data.values
          .cast<Map<String, dynamic>>()
          .map<Course>((item) => Course.fromJson(item))
          .toList();

      return courses;
    } else {
      throw Exception('Failed to load user');
    }
  }
}

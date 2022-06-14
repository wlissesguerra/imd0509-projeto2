import 'package:alcanceaulas/model/Course.dart';
import 'package:flutter/cupertino.dart';

class SelectedCourse extends ChangeNotifier {
  Course course = Course(
    course_id: 0,
    title: '',
    description: '',
    image: '',
  );

  void select(Course course) {
    this.course = course;
  }
}

import 'package:alcanceaulas/component/LesonsList.dart';
import 'package:alcanceaulas/model/Course.dart';
import 'package:alcanceaulas/model/SelectedCourse.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({Key? key}) : super(key: key);

  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  @override
  Widget build(BuildContext context) {
    Course course = context.watch<SelectedCourse>().course;
    return Scaffold(
      appBar: AppBar(
        title: Text("${course.title}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              course.image,
              fit: BoxFit.fill,
              width: double.infinity,
            ),
            LesonsList(course.course_id),
          ],
        ),
      ),
    );
  }
}

import 'package:alcanceaulas/model/Leson.dart';
import 'package:alcanceaulas/model/Course.dart';
import 'package:alcanceaulas/model/SelectedCourse.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../controller/CourseController.dart';
import '../utils/routes.dart';

class CoursesList extends StatefulWidget {
  @override
  State<CoursesList> createState() => _CoursesListState();
}

class _CoursesListState extends State<CoursesList> {
  // void _visualizarcourse(Course course) {
  //   Navigator.of(context).pushNamed(AppRoutes.course, arguments: course);
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Course>>(
      future: CourseController().getAllCourses(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text("Ocorreu um erro!"),
            ),
          );
        } else if (snapshot.hasData) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 3,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final course = snapshot.data![index];
              return Card(
                elevation: 3,
                child: InkWell(
                  onTap: () {
                    Provider.of<SelectedCourse>(context, listen: false)
                        .select(course);
                    Navigator.of(context).pushNamed(AppRoutes.COURSE);
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                        child: Image.network(
                          course.image,
                          fit: BoxFit.fitHeight,
                          alignment: Alignment.topCenter,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          course.title,
                          style: GoogleFonts.lato(
                              textStyle: Theme.of(context).textTheme.bodyText1),
                        ),
                      ),
                    ],
                  ),
                ),
              );
              // return ListTile(
              //   title: Text(course.titulo),
              //   trailing: const Icon(Icons.navigate_next),
              //   onTap: ,
              // );
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

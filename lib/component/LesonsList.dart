import 'package:alcanceaulas/controller/LesonController.dart';
import 'package:alcanceaulas/model/Course.dart';
import 'package:alcanceaulas/model/Leson.dart';
import 'package:alcanceaulas/model/SelectedCourse.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/SelectedLesson.dart';
import '../utils/routes.dart';

class LesonsList extends StatefulWidget {
  final course_id;

  LesonsList(this.course_id);

  @override
  State<LesonsList> createState() => _LesonsListState();
}

class _LesonsListState extends State<LesonsList> {
  void _visualizarAula(Leson leson) {
    Provider.of<SelectedLeson>(context, listen: false).select(leson);
    Navigator.of(context).pushNamed(AppRoutes.LESON);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Leson>>(
        future: LesonController().getLesonsByCourseId(
            context.watch<SelectedCourse>().course.course_id),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final leson = snapshot.data![index];
                return ListTile(
                  title: Text(leson.title),
                  trailing: Icon(Icons.navigate_next),
                  onTap: () => _visualizarAula(leson),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}

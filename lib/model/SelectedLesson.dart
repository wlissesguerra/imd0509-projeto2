import 'package:alcanceaulas/model/Leson.dart';
import 'package:flutter/cupertino.dart';

class SelectedLeson extends ChangeNotifier {
  Leson leson = Leson(
    id: 0,
    title: '',
    description: '',
    video: '',
    anotacoes: [],
    course_id: 0,
  );

  void select(Leson leson) {
    this.leson = leson;
  }
}

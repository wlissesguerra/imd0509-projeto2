import 'package:flutter/cupertino.dart';

import '../controller/UserController.dart';
import 'User.dart';

class AuthUser extends ChangeNotifier {
  User user = User(user_id: 0, name: "", email: "", document: "", image: "");

  void login(String email, String document) {
    UserController.login(email, document).then((user) {
      this.user.user_id = user.user_id;
      this.user.name = user.name;
      this.user.document = user.document;
      this.user.email = user.email;
      this.user.image = user.image;

      notifyListeners();
    });
  }
}

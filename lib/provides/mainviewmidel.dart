import 'package:app_login/model/profile.dart';
import 'package:app_login/model/student.dart';
import 'package:app_login/model/user.dart';
import 'package:flutter/foundation.dart';

class MainViewModel with ChangeNotifier {
  static final MainViewModel _instance = MainViewModel._internal();
  // ignore: unused_element
  MainViewModel._internal();
  factory MainViewModel() {
    return _instance;
  }
  int activeMenu = 0;

  void setActive(int index) {
    activeMenu = index;
    notifyListeners();
  }

  void logout() {
    Profile profile = Profile();
    profile.token = "";
    profile.clearUsernamePassword();
    profile.user = User.clearInfo();
    profile.student = Student.clearInfo();
    notifyListeners();
  }
}

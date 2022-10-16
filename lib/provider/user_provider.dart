import 'package:flutter/foundation.dart';
import 'package:shamo_app/model/user.dart';

class UserProvider extends ChangeNotifier {
  User? _dataUser;

  User? get getDataUser => _dataUser;

  void UserData(User user) {
    _dataUser = user;
    notifyListeners();
  }
}

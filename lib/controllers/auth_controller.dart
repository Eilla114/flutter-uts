// controllers/auth_controller.dart
import 'package:flutter/material.dart';

class AuthController extends ChangeNotifier {
  String _username = '';
  bool _isLoggedIn = false;

  String get username => _username;
  bool get isLoggedIn => _isLoggedIn;

  

  bool login(String username, String password) {
    if (username.isNotEmpty && password.length >= 6) {
      _username = username;
      _isLoggedIn = true;
      notifyListeners();
      return true;
    }
    return false;
  }

  void logout() {
    _username = '';
    _isLoggedIn = false;
    notifyListeners();
  }
}
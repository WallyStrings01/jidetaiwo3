import 'package:flutter/material.dart';
import 'package:jidetaiwoapp/model/user_model.dart';

class Userprovider extends ChangeNotifier {
  User? _user;

  User get getUser {
    return _user!;
  }

  Future<void> loginUser(String email, String password) async {
    const url = '';
    try {} catch (error) {
      rethrow;
    }
    notifyListeners();
  }

  Future<void> signupUser(User user) async {
    const url = '';
    try {} catch (error) {
      rethrow;
    }
    notifyListeners();
  }

  Future<void> updateUser(User user) async {
    const url = '';
    try {} catch (error) {
      rethrow;
    }
    notifyListeners();
  }
}

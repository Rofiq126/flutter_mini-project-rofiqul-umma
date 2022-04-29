import 'dart:async';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:my_recipe/screen/auth/login_screen.dart';
import 'package:my_recipe/screen/auth/model/auth_model.dart';
import 'package:my_recipe/screen/my_recipe/bottom_navBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataLogin extends ChangeNotifier {
  void addUser(UserLogin userLogin) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userName', userLogin.userName);
    prefs.setString('email', userLogin.email);
    prefs.setString('password', userLogin.password);
    notifyListeners();
  }

  void deleteUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('userName');
    prefs.remove('email');
    prefs.remove('password');
    prefs.remove('profilePict');
    notifyListeners();
  }

  checkLogin(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('userName') != null &&
        prefs.getString('email') != null) {
      Timer(
          const Duration(seconds: 3),
          () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const BottomNavBar())));
    } else {
      Timer(
          const Duration(seconds: 3),
          () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const LoginScreen())));
    }
    notifyListeners();
  }

  void pickImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? _nameFile;
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      final file = result.files.first;
      _nameFile = file.path;
      prefs.setString('profilePict', _nameFile ?? '');
    } else {
      return;
    }
    notifyListeners();
  }
}

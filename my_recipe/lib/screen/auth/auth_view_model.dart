import 'dart:async';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:my_recipe/screen/auth/login_screen.dart';
import 'package:my_recipe/screen/auth/model/auth_model.dart';
import 'package:my_recipe/property/bottom_navbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AuthViewState { none, loading, error }

class AuthViewModel extends ChangeNotifier {
  String userName = '';
  String email = '';
  String password = '';
  String profilePicture = '';
  String bannerPicture = '';

  AuthViewState _states = AuthViewState.none;
  AuthViewState get states => _states;

  changeState(AuthViewState state) {
    _states = state;
    notifyListeners();
  }

  void addUser(UserData userLogin) async {
    changeState(AuthViewState.loading);
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('userName', userLogin.userName!);
      prefs.setString('email', userLogin.email!);
      prefs.setString('password', userLogin.password!);
      notifyListeners();
      changeState(AuthViewState.none);
    } catch (e) {
      changeState(AuthViewState.error);
    }
  }

  void deleteUser() async {
    changeState(AuthViewState.loading);
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove('userName');
      prefs.remove('email');
      prefs.remove('password');
      prefs.remove('profilePict');
      prefs.remove('banerPict');
      notifyListeners();
      changeState(AuthViewState.none);
    } catch (e) {
      changeState(AuthViewState.error);
    }
  }

  Future<void> checkLogin(BuildContext context) async {
    changeState(AuthViewState.loading);
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (prefs.getString('userName') != null &&
          prefs.getString('email') != null) {
        Timer(
            const Duration(seconds: 1),
            () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const BottomNavBar())));
      } else {
        Timer(
            const Duration(seconds: 3),
            () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const LoginScreen())));
      }
      notifyListeners();
      changeState(AuthViewState.none);
    } catch (value) {
      changeState(AuthViewState.error);
    }
  }

  Future<void> pickImageProfile() async {
    changeState(AuthViewState.loading);
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? _profilePict;
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null) {
        final file = result.files.first;
        _profilePict = file.path;
        prefs.setString('profilePict', _profilePict ?? '');
      } else {
        return;
      }
      notifyListeners();
      changeState(AuthViewState.none);
    } catch (value) {
      changeState(AuthViewState.error);
    }
  }

  Future<void> pickImageBanner() async {
    changeState(AuthViewState.loading);
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? _banerPict;
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null) {
        final file = result.files.first;
        _banerPict = file.path;
        prefs.setString('banerPict', _banerPict ?? '');
      } else {
        return;
      }
      notifyListeners();
      changeState(AuthViewState.none);
    } catch (value) {
      changeState(AuthViewState.error);
    }
  }

  Future<void> getDataUser() async {
    changeState(AuthViewState.loading);
    try {
      var prefs = await SharedPreferences.getInstance();
      userName = prefs.getString('userName').toString();
      email = prefs.getString('email').toString();
      password = prefs.getString('password').toString();
      profilePicture = prefs.getString('profilePict') ?? '';
      bannerPicture = prefs.getString('banerPict') ?? '';
      notifyListeners();
      changeState(AuthViewState.none);
    } catch (value) {
      changeState(AuthViewState.error);
    }
  }
}

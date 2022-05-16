import 'dart:async';
import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:my_recipe/model/my_recipe_model.dart';
import 'package:my_recipe/screen/auth/login_screen.dart';
import 'package:my_recipe/screen/auth/model/auth_model.dart';
import 'package:my_recipe/property/bottom_navbar.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AuthViewState { none, loading, error }

class AuthViewModel extends ChangeNotifier {
  late String userName = '';
  late String email = '';
  late String password = '';
  late String profilePicture = '';
  late String bannerPicture = '';

  final List<Favorites> _idFoods = [];
  List<Favorites> get idFoods => _idFoods;

  AuthViewState _states = AuthViewState.none;
  AuthViewState get states => _states;

  changeState(AuthViewState state) {
    _states = state;
    notifyListeners();
  }

  Future<void> login(UserData userLogin) async {
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

  Future<void> logout() async {
    changeState(AuthViewState.loading);
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      //Delete all data in SharedPreference
      prefs.clear();
      //Delete all data in _idFoods
      _idFoods.clear();
      final listJson = _idFoods.map((value) {
        return value.toMap();
      }).toList();
      final jsonString = jsonEncode(listJson);
      prefs.setString('listGetFavorites', jsonString);
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
            () => Navigator.pushReplacement(
                context,
                PageTransition(
                    child: const BottomNavBar(),
                    type: PageTransitionType.fade)));
      } else {
        Timer(
            const Duration(seconds: 1),
            () => Navigator.pushReplacement(
                context,
                PageTransition(
                    child: const LoginScreen(),
                    type: PageTransitionType.fade)));
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

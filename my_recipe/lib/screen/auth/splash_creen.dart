import 'package:flutter/material.dart';
import 'package:my_recipe/screen/auth/auth_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SharedPreferences loginData;
  late bool? newUser;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      var dataLogin = Provider.of<AuthViewModel>(context, listen: false);
      await dataLogin.checkLogin(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: Center(
        child: SizedBox(
            width: 220,
            height: 220,
            child: Image.asset('assets/splash_logo.png')),
      ),
    );
  }
}

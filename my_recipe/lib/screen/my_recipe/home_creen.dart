import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late SharedPreferences loginData;
  String userName = '';


  @override
  void initState() {
    initial();
    super.initState();
  }

  void initial() async {
    loginData = await SharedPreferences.getInstance();
    setState(() {
      userName = loginData.getString('userName').toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 25,
              ),
              textHello(),
              const SizedBox(
                height: 5,
              ),
              greetings(),
            ],
          ),
        ),
      ),
    );
  }

  Widget textHello() {
    return Text(
      'Hi, $userName,',
      style: const TextStyle(
          color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
    );
  }

  Widget greetings() {
    return const Text(
      'Welcome to My Recipe',
      style: TextStyle(color: Colors.black),
    );
  }
}

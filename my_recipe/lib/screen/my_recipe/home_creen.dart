import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_recipe/screen/auth/auth_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late SharedPreferences loginData;
  String userName = '';
  String pictureProfile = '';
  AuthViewModel? loginProvider;

  @override
  void initState() {
    initData();
    getDataUser();
    super.initState();
  }

  Future<void> initData() async {
    WidgetsBinding.instance!.addPostFrameCallback(
      (timeStamp) async {
        loginProvider = Provider.of<AuthViewModel>(context, listen: false);
        await loginProvider!.getDataUser();
        getDataUser();
      },
    );
  }

  void getDataUser() async {
    loginData = await SharedPreferences.getInstance();
    setState(() {
      userName = loginProvider!.userName;
      pictureProfile = loginProvider!.profilePicture;
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
              children: [
                const SizedBox(
                  height: 25,
                ),
                cardGreetings()
              ],
            )),
      ),
    );
  }

  Widget cardGreetings() {
    return Card(
        color: Colors.white,
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi, $userName,',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Welcome to My Recipe',
                  style: TextStyle(color: Colors.black),
                )
              ],
            ),
            ClipOval(
                child: pictureProfile.isNotEmpty
                    ? Image.file(
                        File(pictureProfile),
                        fit: BoxFit.cover,
                        width: 40,
                        height: 40,
                      )
                    : const SizedBox(
                        width: 40,
                        height: 40,
                        child: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/empty_profile.webp')),
                      ))
          ],
        ));
  }
}

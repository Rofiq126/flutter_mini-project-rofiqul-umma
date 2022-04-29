import 'dart:io';
import 'package:flutter/material.dart';
import 'package:my_recipe/screen/auth/auth_view_model.dart';
import 'package:my_recipe/screen/auth/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String userName = '';
  String email = '';
  late SharedPreferences prefs;
  String picture = '';

  @override
  void initState() {
    super.initState();
    getDataUser();
  }

  getDataUser() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('userName').toString();
      email = prefs.getString('email').toString();
      picture = prefs.getString('profilePict') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<DataLogin>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text(
          'User Profile',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          //Profile picture
          profilePict(loginProvider),
          const SizedBox(
            height: 25,
          ),
          //Text Display Username
          textName(loginProvider),
          const SizedBox(
            height: 5,
          ),
          //Text Display Email
          textEmail(loginProvider),
          const SizedBox(
            height: 20,
          ),
          buttonLogout(loginProvider)
        ],
      ),
    );
  }

  Widget profilePict(DataLogin loginProvider) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Positioned(
            child: Container(
          color: Colors.redAccent,
          width: double.infinity,
          height: 120,
        )),
        Positioned(
          child: Center(
            child: SizedBox(
              height: 210,
              width: 210,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: ClipOval(
                  child: picture.isNotEmpty
                      ? Image.file(
                          File(picture),
                          fit: BoxFit.cover,
                          width: 200,
                          height: 200,
                        )
                      : const Icon(
                          Icons.person,
                          size: 70,
                          color: Colors.white,
                        ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
            top: 167,
            right: 130,
            child: InkWell(
              onTap: () {
                loginProvider.pickImage();
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 3.5),
                    shape: BoxShape.circle,
                    color: Colors.redAccent),
                child: const Icon(
                  Icons.add_a_photo,
                  color: Colors.white,
                ),
              ),
            ))
      ],
    );
  }

  Widget textName(DataLogin loginProvider) {
    return Text(
      userName,
      style: const TextStyle(color: Colors.black, fontSize: 25),
    );
  }

  Widget textEmail(DataLogin loginProvider) {
    return Text(
      email,
      style: const TextStyle(color: Colors.grey, fontSize: 18),
    );
  }

  Widget buttonLogout(DataLogin loginProvider) {
    return ElevatedButton(
        onPressed: () {
          loginProvider.deleteUser();
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const LoginScreen()));
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.redAccent),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)))),
        child: const Text('Log out'));
  }
}

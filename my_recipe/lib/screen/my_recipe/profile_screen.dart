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
  late SharedPreferences prefs;
  String pictureProfile = '';
  String banerProfile = '';
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthViewModel? loginProvider;
  @override
  void initState() {
    super.initState();
    initData();
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

  getDataUser() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      userNameController.text = loginProvider!.userName;
      emailController.text = loginProvider!.email;
      passwordController.text = loginProvider!.password;
      pictureProfile = loginProvider!.profilePicture;
      banerProfile = loginProvider!.bannerPicture;
    });
  }

  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            if (loginProvider != null)
              //Profile picture
              profilePict(loginProvider!),
            const SizedBox(
              height: 5,
            ),
            textFormFieldUserName(),
            const SizedBox(height: 5),
            textFormFieldEmail(),
            const SizedBox(height: 5),
            textFormFieldPassword(),
            const SizedBox(
              height: 30,
            ),
            if (loginProvider != null) buttonLogout(loginProvider!),
          ],
        ),
      ),
    );
  }

  Widget profilePict(AuthViewModel loginProvider) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Positioned(
            child: ClipRect(
                child: banerProfile.isNotEmpty
                    ? Image.file(
                        File(banerProfile),
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 165,
                      )
                    : Container(
                        color: Colors.grey,
                        width: double.infinity,
                        height: 165,
                      ))),
        Center(
          heightFactor: 1.4,
          child: SizedBox(
            height: 210,
            width: 210,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: ClipOval(
                  child: pictureProfile.isNotEmpty
                      ? Image.file(
                          File(pictureProfile),
                          fit: BoxFit.cover,
                          width: 200,
                          height: 200,
                        )
                      : const SizedBox(
                          width: 200,
                          height: 200,
                          child: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/empty_profile.webp')),
                        )),
            ),
          ),
        ),
        Positioned(
            top: 210,
            right: 130,
            child: InkWell(
              onTap: () {
                loginProvider.pickImageProfile().then((_) => getDataUser());
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 3.5),
                    shape: BoxShape.circle,
                    color: Colors.orangeAccent),
                child: pictureProfile.isNotEmpty
                    ? const Icon(Icons.edit_rounded, color: Colors.white)
                    : const Icon(
                        Icons.add_a_photo,
                        color: Colors.white,
                      ),
              ),
            )),
        Positioned(
            top: 117,
            right: 7,
            child: InkWell(
              onTap: () {
                loginProvider.pickImageBanner().then((_) => getDataUser());
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.transparent),
                child: banerProfile.isNotEmpty
                    ? const Icon(Icons.edit_rounded, color: Colors.white)
                    : const Icon(
                        Icons.add_a_photo,
                        color: Colors.white,
                      ),
              ),
            )),
      ],
    );
  }

  Widget textFormFieldUserName() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: TextFormField(
        controller: userNameController,
        readOnly: true,
        decoration: const InputDecoration(
            prefixIcon: Icon(Icons.person_rounded, color: Colors.orangeAccent),
            labelText: 'UserName'),
      ),
    );
  }

  Widget textFormFieldEmail() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: TextFormField(
        controller: emailController,
        readOnly: true,
        decoration: const InputDecoration(
            prefixIcon: Icon(Icons.email_rounded, color: Colors.orangeAccent),
            labelText: 'Email'),
      ),
    );
  }

  Widget textFormFieldPassword() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: TextFormField(
        obscureText: true,
        controller: passwordController,
        readOnly: true,
        decoration: const InputDecoration(
            prefixIcon:
                Icon(Icons.password_rounded, color: Colors.orangeAccent),
            labelText: 'Password'),
      ),
    );
  }

  Widget buttonLogout(AuthViewModel loginProvider) {
    return ElevatedButton.icon(
      onPressed: () {
        loginProvider.deleteUser();
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      },
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))),
      label: const Text(
        'Logout',
        style: TextStyle(color: Colors.grey),
      ),
      icon: const Icon(
        Icons.logout,
        color: Colors.grey,
      ),
    );
  }
}

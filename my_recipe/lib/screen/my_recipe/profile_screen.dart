import 'dart:io';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:my_recipe/screen/auth/auth_view_model.dart';
import 'package:my_recipe/screen/auth/login_screen.dart';
import 'package:my_recipe/screen/my_recipe/view_model/my_recipe_view_model.dart';
import 'package:page_transition/page_transition.dart';
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
  AuthViewModel? authViewModel;
  @override
  void initState() {
    super.initState();
    initData();
  }

  Future<void> initData() async {
    WidgetsBinding.instance!.addPostFrameCallback(
      (timeStamp) async {
        authViewModel = Provider.of<AuthViewModel>(context, listen: false);
        await authViewModel!.getDataUser();
        getDataUserLogin();
      },
    );
  }

  void getDataUserLogin() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      userNameController.text = authViewModel!.userName;
      emailController.text = authViewModel!.email;
      passwordController.text = authViewModel!.password;
      pictureProfile = authViewModel!.profilePicture;
      banerProfile = authViewModel!.bannerPicture;
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
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              //Image banner
              bannerPicture(authViewModel),
              //Button pickImageBanner
              buttonPickImageBanner(authViewModel),
              //Profile image
              profilePict(authViewModel),
              //button PickImageProfile
              buttonPickImageProfile(authViewModel),
              //Card data user
              cardDataUser(authViewModel),
            ],
          ),
        ),
      ),
    );
  }

  Widget profilePict(AuthViewModel authViewModel) {
    final isLoading = authViewModel.states == AuthViewState.loading;
    final isError = authViewModel.states == AuthViewState.error;
    if (isLoading) {
      return Center(
          child: LoadingFadingLine.circle(
        borderColor: Colors.orange,
        size: 40,
        backgroundColor: Colors.orangeAccent,
        duration: const Duration(milliseconds: 500),
      ));
    }
    if (isError) {
      return const Center(
        child: Text('There something wrong :('),
      );
    }
    return Center(
      heightFactor: 1.9,
      child: SizedBox(
        height: 210,
        width: 210,
        child: ClipOval(
            //Succes state
            child: pictureProfile.isNotEmpty
                ? Image.file(
                    File(pictureProfile),
                    fit: BoxFit.cover,
                    width: 200,
                    height: 200,
                  )
                //Failed state
                : const SizedBox(
                    width: 200,
                    height: 200,
                    child: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/empty_profile.webp')),
                  )),
      ),
    );
  }

  Widget textFormFieldUserName() {
    return TextFormField(
      controller: userNameController,
      readOnly: true,
      decoration: const InputDecoration(
          prefixIcon: Icon(Icons.person_rounded, color: Colors.orangeAccent),
          labelText: 'UserName'),
    );
  }

  Widget textFormFieldEmail() {
    return TextFormField(
      controller: emailController,
      readOnly: true,
      decoration: const InputDecoration(
          prefixIcon: Icon(Icons.email_rounded, color: Colors.orangeAccent),
          labelText: 'Email'),
    );
  }

  Widget textFormFieldPassword() {
    return TextFormField(
      obscureText: true,
      controller: passwordController,
      readOnly: true,
      decoration: const InputDecoration(
          prefixIcon: Icon(Icons.password_rounded, color: Colors.orangeAccent),
          labelText: 'Password'),
    );
  }

  Widget buttonLogout(AuthViewModel loginProvider) {
    return ElevatedButton.icon(
      onPressed: () {
        loginProvider.logout();
        Navigator.pushReplacement(
            context,
            PageTransition(
                child: const LoginScreen(), type: PageTransitionType.fade));
      },
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(Colors.orangeAccent),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))),
      label: const Text(
        'Logout',
        style: TextStyle(color: Colors.white),
      ),
      icon: const Icon(
        Icons.logout,
        color: Colors.white,
      ),
    );
  }

  Widget cardDataUser(AuthViewModel authViewModel) {
    final isLoading = authViewModel.states == AuthViewState.loading;
    final isError = authViewModel.states == AuthViewState.error;
    if (isLoading) {
      return Center(
        child: LoadingFadingLine.circle(
          borderColor: Colors.orange,
          size: 40,
          backgroundColor: Colors.orangeAccent,
          duration: const Duration(milliseconds: 500),
        ),
      );
    }
    if (isError) {
      return const Center(
        child: Text('There something wrong :('),
      );
    }
    return Center(
      heightFactor: 2.8,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Card(
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  textFormFieldUserName(),
                  const SizedBox(height: 5),
                  textFormFieldEmail(),
                  const SizedBox(height: 5),
                  textFormFieldPassword(),
                  const SizedBox(
                    height: 50,
                  ),
                  buttonLogout(authViewModel),
                ],
              ),
            )),
      ),
    );
  }

  Widget bannerPicture(AuthViewModel authViewModel) {
    final isLoading = authViewModel.states == AuthViewState.loading;
    final isError = authViewModel.states == AuthViewState.error;
    if (isLoading) {
      return Center(
          child: LoadingFadingLine.circle(
        borderColor: Colors.orange,
        size: 40,
        backgroundColor: Colors.orangeAccent,
        duration: const Duration(milliseconds: 500),
      ));
    }
    if (isError) {
      return const Center(
        child: Text('There something wrong :('),
      );
    }
    return Positioned(
        //Succes state
        child: banerProfile.isNotEmpty
            ? Container(
                width: double.infinity,
                height: 210,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.35),
                          BlendMode.multiply,
                        ),
                        image: FileImage(File(banerProfile)),
                        fit: BoxFit.cover)),
              )
            //Failed state
            : Container(
                color: Colors.grey,
                width: double.infinity,
                height: 210,
              ));
  }

  Widget buttonPickImageProfile(AuthViewModel authViewModel) {
    final isLoading = authViewModel.states == AuthViewState.loading;
    final isError = authViewModel.states == AuthViewState.error;
    if (isLoading) {
      return Center(
        child: LoadingFadingLine.circle(
          borderColor: Colors.orange,
          size: 40,
          backgroundColor: Colors.orangeAccent,
          duration: const Duration(milliseconds: 500),
        ),
      );
    }
    if (isError) {
      return const Center(
        child: Text('There something wrong :('),
      );
    }
    return Positioned(
        top: 262,
        right: 130,
        child: InkWell(
          onTap: () {
            authViewModel.pickImageProfile().then((_) => initData());
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.black.withOpacity(0.35)),
            child: pictureProfile.isNotEmpty
                ? const Icon(Icons.edit_rounded, color: Colors.white)
                : const Icon(
                    Icons.add_a_photo,
                    color: Colors.white,
                  ),
          ),
        ));
  }

  Widget buttonPickImageBanner(AuthViewModel authViewModel) {
    final isLoading = authViewModel.states == AuthViewState.loading;
    final isError = authViewModel.states == AuthViewState.error;
    if (isLoading) {
      return Center(
        child: LoadingFadingLine.circle(
          borderColor: Colors.orange,
          size: 40,
          backgroundColor: Colors.orangeAccent,
          duration: const Duration(milliseconds: 500),
        ),
      );
    }
    if (isError) {
      return const Center(
        child: Text('There something wrong :('),
      );
    }
    return Positioned(
        top: 165,
        right: 7,
        child: InkWell(
          onTap: () {
            authViewModel.pickImageBanner().then((_) => initData());
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.black.withOpacity(0.35)),
            child: banerProfile.isNotEmpty
                ? const Icon(Icons.edit_rounded, color: Colors.white)
                : const Icon(
                    Icons.add_a_photo,
                    color: Colors.white,
                  ),
          ),
        ));
  }
}

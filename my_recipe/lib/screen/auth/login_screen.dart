import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:my_recipe/screen/auth/auth_view_model.dart';
import 'package:my_recipe/screen/auth/model/auth_model.dart';
import 'package:my_recipe/property/bottom_navbar.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/background_login.png'),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Center(
            child: Center(
              child: SizedBox(
                width: 370,
                height: 500,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  clipBehavior: Clip.antiAlias,
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: Form(
                      key: formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            //textLogin
                            textLogin(),
                            const SizedBox(
                              height: 20,
                            ),
                            textDescription(),
                            const SizedBox(
                              height: 20,
                            ),
                            textFormFieldUsername(),
                            const SizedBox(
                              height: 15,
                            ),
                            textFormFieldEmail(),
                            const SizedBox(
                              height: 20,
                            ),
                            textFormFieldPassword(),
                            const SizedBox(
                              height: 25,
                            ),
                            buttonLogin(context),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget textLogin() {
    return const Text(
      'Login',
      style: TextStyle(
          fontSize: 30,
          color: Colors.orangeAccent,
          fontWeight: FontWeight.w600),
    );
  }

  Widget textDescription() {
    return const Text(
      'Please insert yout username, email, and password',
      style: TextStyle(color: Colors.black, fontSize: 12),
    );
  }

  Widget textFormFieldUsername() {
    return TextFormField(
      controller: usernameController,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.person_rounded),
        labelText: 'Username',
      ),
      validator: (username) {
        if (username != null && username.length < 5) {
          return "Enter at least 4 characters";
        } else {
          return null;
        }
      },
    );
  }

  Widget textFormFieldEmail() {
    return TextFormField(
      controller: emailController,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.email_rounded),
        labelText: 'Email',
      ),
      validator: (email) {
        if (email != null && !EmailValidator.validate(email)) {
          return "Enter a valid email";
        } else {
          return null;
        }
      },
    );
  }

  Widget textFormFieldPassword() {
    return TextFormField(
      controller: passwordController,
      obscureText: true,
      enableSuggestions: false,
      autocorrect: false,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.password_rounded),
        labelText: 'Password',
      ),
      validator: (password) {
        if (password != null && password.length < 8) {
          return "Enter at least 8 characters";
        } else {
          return null;
        }
      },
    );
  }

  Widget buttonLogin(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
            onPressed: () async {
              if (!formKey.currentState!.validate()) return;
              formKey.currentState!.save();
              final authProvider =
                  Provider.of<AuthViewModel>(context, listen: false);
              authProvider.addUser(UserData(
                userName: usernameController.text,
                email: emailController.text,
                password: passwordController.text,
              ));
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const BottomNavBar()),
                  ((route) => false));
            },
            style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
                backgroundColor:
                    MaterialStateProperty.all(Colors.orangeAccent)),
            child: const Text('Log in')));
  }
}

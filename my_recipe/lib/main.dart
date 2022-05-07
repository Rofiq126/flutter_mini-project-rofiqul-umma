import 'package:flutter/material.dart';
import 'package:my_recipe/screen/auth/auth_view_model.dart';
import 'package:my_recipe/screen/auth/splash_creen.dart';
import 'package:my_recipe/screen/my_recipe/view_model/my_recipe_view_model_detail.dart';
import 'package:my_recipe/screen/my_recipe/view_model/my_recipe_view_model_home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => AuthViewModel()),
    ChangeNotifierProvider(create: (_) => MyRecipeViewModelHome()),
    ChangeNotifierProvider(create: (_) => MyRecipeViewModelDetail()),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Recipe',
        theme: ThemeData(
          fontFamily: 'Poppins',
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen());
  }
}

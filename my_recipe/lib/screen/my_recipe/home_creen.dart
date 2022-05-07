import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:my_recipe/model/my_recipe_model.dart';
import 'package:my_recipe/screen/auth/auth_view_model.dart';
import 'package:my_recipe/screen/my_recipe/overView_screen.dart';
import 'package:my_recipe/screen/my_recipe/view_model/my_recipe_view_model_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late SharedPreferences loginData;
  String? userName;
  String pictureProfile = '';
  AuthViewModel? authProvider;

  late List<Result> recipe = [];
  bool isLoading = true;

  Future<void> initDataUser() async {
    WidgetsBinding.instance!.addPostFrameCallback(
      (timeStamp) async {
        authProvider = Provider.of<AuthViewModel>(context, listen: false);
        await authProvider!.getDataUser();
        getDataUser();
      },
    );
  }

  Future<void> initDataRecipe() async {
    WidgetsBinding.instance!.addPostFrameCallback(
      (timeStamp) async {
        var myRecipeViewModel =
            Provider.of<MyRecipeViewModelHome>(context, listen: false);
        await myRecipeViewModel.getRecipes();
      },
    );
  }

  void getDataUser() async {
    loginData = await SharedPreferences.getInstance();
    setState(() {
      userName = authProvider!.userName;
      pictureProfile = authProvider!.profilePicture;
    });
  }

  @override
  void initState() {
    initDataUser();
    initDataRecipe();
    getDataUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final myRecipeViewModel = Provider.of<MyRecipeViewModelHome>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  cardGreetings(),
                  const SizedBox(
                    height: 20,
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: myRecipeViewModel.recipes.length,
                      itemBuilder: (context, index) {
                        final recipes = myRecipeViewModel.recipes[index];
                        debugPrint("recipes count : " +
                            myRecipeViewModel.recipes.length.toString());
                        return CardRecipe(
                          foodName: recipes.title,
                          foodImage: recipes.image,
                          foodRating: 4.5,
                          foodId: recipes.id.toString(),
                        );
                      })
                ],
              ),
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

class CardRecipe extends StatelessWidget {
  final String? foodName;
  final String? foodImage;
  final double? foodRating;
  final String foodId;

  const CardRecipe({
    Key? key,
    required this.foodName,
    required this.foodImage,
    required this.foodRating,
    required this.foodId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.35),
                BlendMode.multiply,
              ),
              image: NetworkImage(foodImage!),
              fit: BoxFit.cover)),
      child: Stack(children: [
        Align(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              foodName ?? '',
              style: const TextStyle(fontSize: 19, color: Colors.white),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
          alignment: Alignment.center,
        ),
        Align(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(children: [
                const Icon(Icons.star, color: Colors.yellowAccent, size: 18),
                const SizedBox(
                  width: 7,
                ),
                Text(foodRating.toString(),
                    style: const TextStyle(color: Colors.white))
              ]),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OverViewScreen(
                              id: foodId,
                              nameFood: foodName!,
                              image: foodImage!,
                            )));
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(children: const [
                  Icon(
                    Icons.favorite_rounded,
                    color: Colors.red,
                    size: 18,
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Text('Favorites', style: TextStyle(color: Colors.white))
                ]),
              ),
            )
          ]),
          alignment: Alignment.bottomCenter,
        )
      ]),
    );
  }
}

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:my_recipe/property/card_recipe.dart';
import 'package:my_recipe/screen/my_recipe/search_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_recipe/screen/auth/auth_view_model.dart';
import 'package:my_recipe/screen/my_recipe/view_model/my_recipe_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late SharedPreferences loginData;
  String? userName;
  String pictureProfile = '';
  AuthViewModel? authProvider;

  bool isLoading = true;

  Future<void> initDataUser() async {
    WidgetsBinding.instance!.addPostFrameCallback(
      (timeStamp) async {
        authProvider = Provider.of<AuthViewModel>(context, listen: false);
        await authProvider!.getDataUser();
        checkData();
        getDataUser();
      },
    );
  }

  void checkData() {
    setState(() {
      isLoading = false;
    });
  }

  Future<void> initDataRecipe() async {
    WidgetsBinding.instance!.addPostFrameCallback(
      (timeStamp) async {
        var myRecipeViewModel =
            Provider.of<MyRecipeViewModel>(context, listen: false);
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
    final myRecipeViewModel = Provider.of<MyRecipeViewModel>(context);
    return Scaffold(
        backgroundColor: Colors.white, body: body(myRecipeViewModel));
  }

  Widget body(MyRecipeViewModel myRecipeViewModel) {
    return SafeArea(
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
                  height: 10,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: myRecipeViewModel.recipes.length,
                    itemBuilder: (context, index) {
                      final recipes = myRecipeViewModel.recipes[index];
                      return CardRecipe(
                        like: myRecipeViewModel.recipeDetail.aggregateLikes
                            .toString(),
                        foodName: recipes.title,
                        foodImage: recipes.image,
                        foodId: recipes.id.toString(),
                      );
                    })
              ],
            ),
          )),
    );
  }

  Widget cardGreetings() {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Card(
            color: Colors.white,
            elevation: 0,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userName != null ? 'Hi, $userName,' : 'Hi, Guest',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 25,
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
                                    backgroundImage: AssetImage(
                                        'assets/empty_profile.webp')),
                              ))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                searchField(),
              ],
            ));
  }

  Widget searchField() {
    return TextFormField(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SearchScreen()));
      },
      readOnly: true,
      decoration: InputDecoration(
        hintText: 'Search any recipe',
        prefixIcon:
            const Icon(Icons.search_rounded, color: Colors.orangeAccent),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.orangeAccent, width: 2),
            borderRadius: BorderRadius.circular(50)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 2),
            borderRadius: BorderRadius.circular(50)),
      ),
    );
  }
}

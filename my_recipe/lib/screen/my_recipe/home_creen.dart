import 'dart:io';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
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

  Future<void> getDataUser() async {
    loginData = await SharedPreferences.getInstance();
    userName = authProvider!.userName;
    pictureProfile = authProvider!.profilePicture;
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
              height: 10,
            ),
            listRecipe(myRecipeViewModel),
          ],
        )),
      ),
    ));
  }

  Widget listRecipe(MyRecipeViewModel myRecipeViewModel) {
    final isLoading = myRecipeViewModel.state == MyRecipeViewState.loading;
    final isError = myRecipeViewModel.state == MyRecipeViewState.error;
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
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: myRecipeViewModel.recipes.length,
        itemBuilder: (context, index) {
          final recipes = myRecipeViewModel.recipes[index];
          return CardRecipe(
            like: myRecipeViewModel.recipeDetail.aggregateLikes.toString(),
            foodName: recipes.title,
            foodImage: recipes.image,
            foodId: recipes.id.toString(),
          );
        });
  }

  Widget cardGreetings() {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Card(
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userName != null ? 'Hi, $userName' : 'Hi, Guest',
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'Welcome to My Recipe',
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
              ),
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
            borderSide: const BorderSide(
              color: Colors.orangeAccent,
            ),
            borderRadius: BorderRadius.circular(15)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}

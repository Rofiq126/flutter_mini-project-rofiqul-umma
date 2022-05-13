import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:my_recipe/property/bottom_navbar.dart';
import 'package:my_recipe/screen/my_recipe/home_creen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:my_recipe/screen/my_recipe/view_model/my_recipe_view_model.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({
    Key? key,
  }) : super(key: key);

  get context => null;

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  bool? isAdded;
  // MyRecipeViewModel? myRecipeViewModel;

  Future<void> getAllFavorites() async {
    Future.delayed(Duration.zero, () async {
      var myRecipeViewModel =
          Provider.of<MyRecipeViewModel>(context, listen: false);
      await myRecipeViewModel.getListFavorites();
    });
  }

  @override
  void initState() {
    super.initState();
    getAllFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      buttonBack(),
                      const SizedBox(
                        width: 15,
                      ),
                      textFavorite(),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  listFavorites(),
                ],
              ),
            ),
          ),
        ));
  }

  Widget listFavorites() {
    final myRecipeViewModel = Provider.of<MyRecipeViewModel>(context);
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
        child: Text('There something wrong'),
      );
    }
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: myRecipeViewModel.idFoods.length,
        itemBuilder: (context, index) {
          return SafeArea(
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: ListTile(
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: myRecipeViewModel
                                  .idFoods[index].image!.isNotEmpty
                              ? NetworkImage(
                                  myRecipeViewModel.idFoods[index].image!)
                              : const NetworkImage(
                                  'https://cdn.dribbble.com/users/310943/screenshots/2792692/empty-state-illustrations.gif'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(15)),
                ),
                title: myRecipeViewModel.idFoods[index].name!.isNotEmpty
                    ? Text(
                        myRecipeViewModel.idFoods[index].name!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      )
                    : const Text('error'),
                subtitle: Row(children: [
                  const Icon(Icons.star, color: Colors.yellow, size: 18),
                  const SizedBox(
                    width: 7,
                  ),
                  myRecipeViewModel.idFoods[index].rating!.isNotEmpty
                      ? Text((myRecipeViewModel.idFoods[index].rating!),
                          style: const TextStyle(color: Colors.black))
                      : const Text('error'),
                ]),
                trailing: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.redAccent),
                  child: InkWell(
                    onTap: () {
                      myRecipeViewModel.deleteFavorite(index);
                    },
                    child: const Icon(
                      Icons.delete_forever_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  Widget buttonBack() {
    return Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.orangeAccent,
          borderRadius: BorderRadius.circular(100),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const BottomNavBar()));
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ));
  }

  Widget textFavorite() {
    return const Text(
      'Favorites',
      style: TextStyle(
          color: Colors.black87, fontWeight: FontWeight.w600, fontSize: 22),
    );
  }
}

import 'package:flutter/widgets.dart';
import 'package:my_recipe/model/api/my_recipe_api.dart';
import 'package:my_recipe/model/my_recipe_model.dart';

class MyRecipeViewModel extends ChangeNotifier {
  List<Recipe> _recipes = [];
  List<Recipe> get recipes => _recipes;

  Future<void> getRecipes() async {
    var data = await RecipeAPI.getRecipe();
    _recipes = data;
    notifyListeners();
  }
}

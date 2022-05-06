import 'package:flutter/widgets.dart';
import 'package:my_recipe/model/api/my_recipe_api.dart';
import 'package:my_recipe/model/api/my_recipe_model_3.dart';

class MyRecipeViewModel extends ChangeNotifier {
  List<Feed> _recipes = [];
  List<Feed> get recipes => _recipes;

  Future<void> getRecipes() async {
    var data = await RecipeAPI.getRecipe();
    _recipes = data;
    notifyListeners();
  }
}

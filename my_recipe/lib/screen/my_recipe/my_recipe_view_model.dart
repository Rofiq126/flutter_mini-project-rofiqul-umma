import 'package:flutter/widgets.dart';
import 'package:my_recipe/model/api/my_recipe_api.dart';
import 'package:my_recipe/model/api/my_recipe_model_3.dart';
import 'package:my_recipe/model/result_model_recipe.dart';

class MyRecipeViewModel extends ChangeNotifier {
  List<Result> _recipes = [];
  List<Result> get recipes => _recipes;

  Future<void> getRecipes() async {
    var data = await RecipeAPI.getRecipe("10");
    _recipes = data;
    notifyListeners();
  }
}

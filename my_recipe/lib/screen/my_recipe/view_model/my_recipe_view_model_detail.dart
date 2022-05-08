import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_recipe/model/api/my_recipe_detail_api.dart';
import 'package:my_recipe/model/my_recipe_detail_model.dart';

class MyRecipeViewModelDetail extends ChangeNotifier {
  MyRecipeDetail _recipeDetail = MyRecipeDetail(
      vegetarian: true,
      vegan: true,
      glutenFree: false,
      dairyFree: false,
      veryHealthy: true,
      cheap: true,
      veryPopular: true,
      sustainable: false,
      gaps: '',
      lowFodmap: true,
      aggregateLikes: 0,
      spoonacularScore: 0.0,
      healthScore: 0.0,
      creditsText: '',
      sourceName: '',
      pricePerServing: 0,
      extendedIngredients: <ExtendedIngredient>[],
      id: 0,
      title: '',
      readyInMinutes: 0,
      servings: 0,
      sourceUrl: '',
      image: '',
      imageType: '',
      summary: '',
      cuisines: <String>[],
      dishTypes: [],
      diets: [],
      occasions: [],
      instructions: '',
      analyzedInstructions: [],
      spoonacularSourceUrl: '');
  MyRecipeDetail get recipeDetail => _recipeDetail;

  Future<void> getRecipeDetail(String id) async {
    var data = await RecipeApiDetail.getRecipeDetail(id);
    if (data != null) {
      _recipeDetail = data;
      notifyListeners();
    }
  }
}

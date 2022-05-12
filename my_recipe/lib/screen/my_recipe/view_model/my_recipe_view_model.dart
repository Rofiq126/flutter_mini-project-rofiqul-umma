import 'package:flutter/widgets.dart';
import 'package:my_recipe/model/api/my_recipe_api.dart';
import 'package:my_recipe/model/my_recipe_detail_model.dart';
import 'package:my_recipe/model/my_recipe_model.dart';

enum MyRecipeViewState { none, loading, error }

class MyRecipeViewModel extends ChangeNotifier {
  List<Result> _recipes = [];
  List<Result> get recipes => _recipes;

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

  List<Result> _search = [];
  List<Result> get searchs => _search;

  MyRecipeViewState _states = MyRecipeViewState.none;
  MyRecipeViewState get state => _states;

  changeState(MyRecipeViewState state) {
    _states = state;
    notifyListeners();
  }

  Future<void> getRecipes() async {
    changeState(MyRecipeViewState.loading);
    try {
      var data = await RecipeAPI.getRecipe("30", '');
      _recipes = data;
      notifyListeners();
      changeState(MyRecipeViewState.none);
    } catch (e) {
      changeState(MyRecipeViewState.error);
    }
  }

  Future<void> getRecipeDetail(String id) async {
    changeState(MyRecipeViewState.loading);
    try {
      var data = await RecipeApiDetail.getRecipeDetail(id);
      if (data != null) {
        _recipeDetail = data;
        notifyListeners();
        changeState(MyRecipeViewState.none);
      }
    } catch (e) {
      changeState(MyRecipeViewState.error);
    }
  }

  Future<void> getResultSearch(String name) async {
    changeState(MyRecipeViewState.loading);
    try {
      var data = await RecipeAPI.getRecipe("20", name);
      _search = data;
      notifyListeners();
      changeState(MyRecipeViewState.none);
    } catch (e) {
      changeState(MyRecipeViewState.error);
    }
  }
}

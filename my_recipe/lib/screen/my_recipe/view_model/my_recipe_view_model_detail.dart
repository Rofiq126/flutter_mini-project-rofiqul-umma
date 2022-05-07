import 'package:flutter/widgets.dart';
import 'package:my_recipe/model/api/my_recipe_detail_api.dart';
import 'package:my_recipe/model/my_recipe_detail_model.dart';

class MyRecipeViewModelDetail extends ChangeNotifier {
  late MyRecipeDetail _recipeDetail;
  MyRecipeDetail get recipeDetail => _recipeDetail;

  Future<void> getRecipeDetail(String id) async {
    var data = await RecipeApiDetail.getRecipeDetail(id);
    if(data is MyRecipeDetail){
    _recipeDetail = data;
    }
    notifyListeners();
  }
}

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:my_recipe/model/my_recipe_model.dart';

class RecipeAPI {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https(
        "yummly2.p.rapidapi.com", "/feeds/list", {"limit": "24", "start": "0"});

    final response = await Dio().getUri(uri,
        options: Options(headers: {
          "X-RapidAPI-Host": "yummly2.p.rapidapi.com",
          "X-RapidAPI-Key":
              "48a0cb6c9emsh3775b6ec8fca71ap167776jsn677153c79455",
          "useQueryString": true
        }));
    Map data = jsonDecode(response.toString());
    List _temp = [];

    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }
    return Recipe.recipesFromSnapshot(_temp);
  }
}

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:my_recipe/model/my_recipe_model.dart';

class RecipeAPI {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https(
        "yummly2.p.rapidapi.com", "/feeds/list", {"limit": "18", "start": "0"});

    final response = await Dio().getUri(uri,
        options: Options(headers: {
          "X-RapidAPI-Host": "yummly2.p.rapidapi.com",
          "X-RapidAPI-Key":
              '48a0cb6c9emsh3775b6ec8fca71ap167776jsn677153c79455',
          "access-control-allow-credentials": "true",
          "access-control-allow-headers": "ver",
          "access-control-allow-methods": "GET, POST",
          "access-control-allow-origin": "*",
          "connection": "keep-alive",
          "content-type": "application/json",
        }));

    var jsonString = jsonEncode(response.data);
    Map data = jsonDecode(jsonString);
    List _temp = [];
    if (data.isNotEmpty) {
      for (var i in data['feed']) {
        _temp.add(i['content']['details']);
      }
    }
    return Recipe.recipesFromSnapshot(_temp);
  }
}

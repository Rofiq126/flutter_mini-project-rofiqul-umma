import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_recipe/model/api/my_recipe_model_3.dart';
import 'package:my_recipe/model/result_model_recipe.dart';

import '../../commons/constant.dart';

class RecipeAPI {
  static Future<List<Feed>> getRecipe() async {
    var uri = Uri.https(
        "yummly2.p.rapidapi.com", "/feeds/list", {"limit": "2", "start": "0"});

    final response = await Dio().getUri(uri,
        options: Options(headers: {
          "access-control-allow-credentials": "true",
          "access-control-allow-headers": "ver",
          "access-control-allow-methods": "GET, POST",
          "access-control-allow-origin": "*",
          "connection": "keep-alive",
          "content-type": "application/json",
        }));

    var jsonString = jsonEncode(response.data);
    var data = jsonDecode(jsonString);
    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 202 ||
        response.statusCode == 203) {
      ListsModelRecipe listRecipeModel = ListsModelRecipe.fromJson(data);
      List<Feed> listFeed = listRecipeModel.feed;
      return listFeed;
    }

    debugPrint('Error Fetching data!');
    return [];
  }
}

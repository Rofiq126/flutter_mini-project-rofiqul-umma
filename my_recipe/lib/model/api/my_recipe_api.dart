import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_recipe/model/api/my_recipe_model_2.dart';

class RecipeAPI {
  static Future<List<Feed>> getRecipe() async {
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
          "date": "Fri, 06 May 2022 10:03:16 GMT",
          "server": "RapidAPI-1.2.8",
          "transfer-encoding": "chunked",
          "x-rapidapi-region": "AWS - ap-southeast-1",
          "x-rapidapi-version": "1.2.8",
          "x-ratelimit-requests-limit": "500",
          "x-ratelimit-requests-remaining": "206",
          "x-ratelimit-requests-reset": "1620992"
        }));

    var jsonString = jsonEncode(response.data);
    var data = jsonDecode(jsonString);
    debugPrint(response.statusCode.toString());
    List _temp = [];
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 202 ||
        response.statusCode == 203) {
      ListRecipeModel listRecipeModel = ListRecipeModel.fromJson(data);
      List<Feed> listFeed = data.feed;
      return listFeed;
    }

    // if (data.isNotEmpty) {
    //   for (var i in data['feed']) {
    //     _temp.add(i['content']['details']);
    //   }
    // }
    // return Recipe.recipesFromSnapshot(_temp);
    return [];
  }
}

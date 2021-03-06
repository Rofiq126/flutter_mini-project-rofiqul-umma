import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_recipe/model/my_recipe_detail_model.dart';
import 'package:my_recipe/model/my_recipe_model.dart';

class RecipeAPI {
  static Future<List<Result>> getRecipe(String limitNumber, String name) async {
    var uri = Uri.https('api.spoonacular.com', '/recipes/complexSearch', {
      "number": limitNumber,
      "apiKey": "5c31d76633974dc7bc206df12b0b66a4",
      "query": name
    });

    final response = await Dio().getUri(uri,
        options: Options(headers: {
          "Content-Type": "application/json",
        }));

    var jsonString = jsonEncode(response.data);
    var data = jsonDecode(jsonString);
    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 202 ||
        response.statusCode == 203) {
      debugPrint('Success Fetching Data');
      return ResultModelRecipe.fromJson(data).results;
    }

    debugPrint('Error Fetching data!');
    return [];
  }
}

class RecipeApiDetail {
  static Future<dynamic> getRecipeDetail(String id) async {
    var uri = Uri.https('api.spoonacular.com', '/recipes/$id/information',
        {"apiKey": "5c31d76633974dc7bc206df12b0b66a4"});

    final response = await Dio().getUri(uri,
        options: Options(headers: {
          "Content-Type": "application/json",
        }));
    var jsonString = jsonEncode(response.data);
    var data = jsonDecode(jsonString);
    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 202 ||
        response.statusCode == 203) {
      debugPrint('Success Fetching Data');
      return MyRecipeDetail.fromJson(data);
    }

    debugPrint('Error Fetching data!');
    return 'error';
  }
}

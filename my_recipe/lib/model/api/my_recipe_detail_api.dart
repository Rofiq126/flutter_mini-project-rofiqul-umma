import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_recipe/model/my_recipe_detail_model.dart';
import 'package:dio/dio.dart';

class RecipeApiDetail {
  static Future<dynamic> getRecipeDetail(String id) async {
    var uri = Uri.https('api.spoonacular.com', '/recipes/$id/information',
        {"apiKey": "1f65e26d318e4719bcf719aca0395275"});

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
      debugPrint('Success Fetching Data');
      return MyRecipeDetail.fromJson(data);
    }

    debugPrint('Error Fetching data!');
    return 'error';
  }
}

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_recipe/model/api/my_recipe_model_3.dart';
import 'package:my_recipe/model/result_model_recipe.dart';

import '../../commons/constant.dart';

class RecipeAPI {
  static Future<List<Result>> getRecipe(String limitNumber) async {
    var uri = Uri.https(Constant.kRootUrl, Constant.kSearchUrl,
        {"limit": limitNumber, "apiKey": Constant.kApiKeyParams});

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
      return ResultModelRecipe.fromJson(json.decode(data)).results;
    }

    debugPrint('Error Fetching data!');
    return [];
  }
}

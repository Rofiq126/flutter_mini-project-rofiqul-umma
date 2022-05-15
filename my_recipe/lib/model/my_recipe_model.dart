// To parse this JSON data, do
//
//     final resultModelRecipe = resultModelRecipeFromJson(jsonString);

import 'dart:convert';

ResultModelRecipe resultModelRecipeFromJson(String str) =>
    ResultModelRecipe.fromJson(json.decode(str));

String resultModelRecipeToJson(ResultModelRecipe data) =>
    json.encode(data.toJson());

class ResultModelRecipe {
  ResultModelRecipe({
    required this.results,
    required this.offset,
    required this.number,
    required this.totalResults,
  });

  List<Result> results;
  int offset;
  int number;
  int totalResults;

  factory ResultModelRecipe.fromJson(Map<String, dynamic> json) =>
      ResultModelRecipe(
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        offset: json["offset"],
        number: json["number"],
        totalResults: json["totalResults"],
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "offset": offset,
        "number": number,
        "totalResults": totalResults,
      };
}

class Result {
  Result({
    required this.id,
    required this.title,
    required this.image,
    required this.imageType,
  });

  int? id;
  String? title;
  String? image;
  String? imageType;
  bool isFavorite = false;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        imageType: json["imageType"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "imageType": imageType,
      };
}

class Favorites {
  String? name;
  String? id;
  String? image;
  String? rating;
  Favorites({
    required this.name,
    required this.id,
    required this.image,
    required this.rating,
  });
  Map<String, dynamic> toMap() {
    var map = <String, Object?>{
      'name': name,
      'id': id,
      'image': image,
      'rating': rating
    };
    return map;
  }

  Favorites.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    id = map['id'];
    image = map['image'];
    rating = map['rating'];
  }
}

class ListgetFavorites {
  List<Favorites> listGetFavorites = [];
  Map<String, dynamic> toMap() {
    var map = <String, Object?>{'listGetFavorites': listGetFavorites};
    return map;
  }

  static List<Favorites> fromList(List<dynamic> map) {
    return map.map((e) {
      return Favorites.fromMap(e);
    }).toList();
  }
}

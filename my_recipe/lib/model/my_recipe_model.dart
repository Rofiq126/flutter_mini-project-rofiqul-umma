class Recipe {
  String? name = '';
  String? image = '';
  double? rating = 0.0;
  Recipe({
    required this.name,
    required this.image,
    required this.rating,
  });

  factory Recipe.fromJson(
    Map<String, dynamic> json,
  ) {
    return Recipe(
      name: json["name"] as String?,
      image: json["hostedLargeUrl"] as String?,
      rating: json["rating"] as double?,
    );
  }
  // static Future<List<Recipe>> recipesFromSnapshot(List snapShot) async {
  //   return snapShot.map((e) => Recipe.fromJson(e)).toList();
  // }

  @override
  String toString() {
    return 'Recipe{name: $name, image: $image, rating: $rating}';
  }
}

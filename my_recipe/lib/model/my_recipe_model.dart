class Recipe {
  final String name;
  final String image;
  final double rating;
  Recipe({
    required this.name,
    required this.image,
    required this.rating,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      name: json["name"] as String,
      image: json["images"][0]["hostedLargeUrl"] as String,
      rating: json["rating"] as double,
    );
  }
  static List<Recipe> recipesFromSnapshot(List snapShot) {
    return snapShot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Recipe{name: $name, image: $image, rating: $rating}';
  }
}

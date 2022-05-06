// To parse this JSON data, do
//
//     final listRecipeModel = listRecipeModelFromJson(jsonString);

import 'dart:convert';

ListRecipeModel listRecipeModelFromJson(String str) =>
    ListRecipeModel.fromJson(json.decode(str));

String listRecipeModelToJson(ListRecipeModel data) =>
    json.encode(data.toJson());
List<Picture> listPicture = [
  Picture(
      hostedLargeUrl:
          'https://i.pinimg.com/originals/f9/f1/e7/f9f1e722c01eb83182adb117026cd1a5.jpg',
      resizableImageUrl:
          'https://i.pinimg.com/originals/f9/f1/e7/f9f1e722c01eb83182adb117026cd1a5.jpg',
      resizableImageHeight: 100,
      resizableImageWidth: 100)
];

class ListRecipeModel {
  ListRecipeModel({
    required this.feed,
  });

  List<Feed> feed;

  factory ListRecipeModel.fromJson(Map<String, dynamic> json) =>
      ListRecipeModel(
        feed: List<Feed>.from(json["feed"].map((x) => Feed.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "feed": List<dynamic>.from(feed.map((x) => x.toJson())),
      };
}

class Feed {
  Feed({
    required this.type,
    required this.content,
  });

  String type;
  Content content;

  factory Feed.fromJson(Map<String, dynamic> json) => Feed(
        type: json["type"],
        content: Content.fromJson(json["content"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "content": content.toJson(),
      };
}

class Content {
  Content({
    required this.description,
    required this.preparationSteps,
    required this.details,
    // required this.relatedContent,
    // required this.ingredientLines,
    required this.unitSystem,
    // required this.reviews,
    required this.preparationStepCount,
  });

  dynamic description;
  dynamic preparationSteps;
  Details details;
  // MoreContent relatedContent;
  // List<IngredientLine> ingredientLines;
  String? unitSystem;
  // Reviews? reviews;
  int? preparationStepCount;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        description: json["description"],
        preparationSteps: json["preparationSteps"],
        details: Details.fromJson(json["details"]),
        // relatedContent: MoreContent.fromJson(json["relatedContent"]),
        // ingredientLines: List<IngredientLine>.from(
        //     json["ingredientLines"].map((x) => IngredientLine.fromJson(x))),
        unitSystem: json["unitSystem"],
        // reviews: Reviews.fromJson(json["reviews"]),
        preparationStepCount: json["preparationStepCount"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "preparationSteps": preparationSteps,
        "details": details.toJson(),
        // "relatedContent": relatedContent.toJson(),
        // "ingredientLines":
        //     List<dynamic>.from(ingredientLines.map((x) => x.toJson())),
        "unitSystem": unitSystem,
        // "reviews": reviews!.toJson(),
        "preparationStepCount": preparationStepCount,
      };
}

class Details {
  Details({
    required this.totalTime,
    required this.displayName,
    // required this.images,
    required this.name,
    // required this.keywords,
    required this.brand,
    required this.id,
    // required this.attribution,
    required this.recipeId,
    required this.numberOfServings,
    required this.globalId,
    required this.totalTimeInSeconds,
    required this.rating,
  });

  String? totalTime;
  String? displayName;
  // List<Picture>? images;
  String? name;
  // List<String> keywords;
  dynamic brand;
  String? id;
  // Attribution attribution;
  String? recipeId;
  int? numberOfServings;
  String? globalId;
  int? totalTimeInSeconds;
  double? rating;

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        totalTime: json["totalTime"],
        displayName: json["displayName"],
        // images: List<Picture>.from(
        //         json["images"].map((x) => Picture.fromJson(x))),
        name: json["name"],
        // keywords: List<String>.from(json["keywords"].map((x) => x)),
        brand: json["brand"],
        id: json["id"],
        // attribution: Attribution.fromJson(json["attribution"]),
        recipeId: json["recipeId"],
        numberOfServings: json["numberOfServings"],
        globalId: json["globalId"],
        totalTimeInSeconds: json["totalTimeInSeconds"],
        rating: json["rating"],
      );

  Map<String, dynamic> toJson() => {
        "totalTime": totalTime,
        "displayName": displayName,
        // "images": List<dynamic>.from(images!.map((x) => x.toJson())),
        "name": name,
        // "keywords": List<dynamic>.from(keywords.map((x) => x)),
        "brand": brand,
        "id": id,
        // "attribution": attribution.toJson(),
        "recipeId": recipeId,
        "numberOfServings": numberOfServings,
        "globalId": globalId,
        "totalTimeInSeconds": totalTimeInSeconds,
        "rating": rating,
      };
}

class Attribution {
  Attribution({
    required this.html,
    required this.url,
    required this.text,
    required this.logo,
  });

  String html;
  String url;
  String text;
  String logo;

  factory Attribution.fromJson(Map<String, dynamic> json) => Attribution(
        html: json["html"],
        url: json["url"],
        text: json["text"],
        logo: json["logo"],
      );

  Map<String, dynamic> toJson() => {
        "html": html,
        "url": url,
        "text": text,
        "logo": logo,
      };
}

class Picture {
  Picture({
    required this.hostedLargeUrl,
    required this.resizableImageUrl,
    required this.resizableImageHeight,
    required this.resizableImageWidth,
  });

  String hostedLargeUrl;
  String resizableImageUrl;
  int resizableImageHeight;
  int resizableImageWidth;

  factory Picture.fromJson(Map<String, dynamic> json) => Picture(
        hostedLargeUrl: json["hostedLargeUrl"],
        resizableImageUrl: json["resizableImageUrl"],
        resizableImageHeight: json["resizableImageHeight"],
        resizableImageWidth: json["resizableImageWidth"],
      );

  Map<String, dynamic> toJson() => {
        "hostedLargeUrl": hostedLargeUrl,
        "resizableImageUrl": resizableImageUrl,
        "resizableImageHeight": resizableImageHeight,
        "resizableImageWidth": resizableImageWidth,
      };
}

class IngredientLine {
  IngredientLine({
    required this.category,
    required this.unit,
    required this.ingredientId,
    required this.categoryId,
    required this.ingredient,
    required this.id,
    required this.remainder,
    required this.wholeLine,
  });

  String category;
  String unit;
  String ingredientId;
  String categoryId;
  String ingredient;
  String id;
  String remainder;
  String wholeLine;

  factory IngredientLine.fromJson(Map<String, dynamic> json) => IngredientLine(
        category: json["category"],
        unit: json["unit"],
        ingredientId: json["ingredientId"],
        categoryId: json["categoryId"],
        ingredient: json["ingredient"],
        id: json["id"],
        remainder: json["remainder"],
        wholeLine: json["wholeLine"],
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "unit": unit,
        "ingredientId": ingredientId,
        "categoryId": categoryId,
        "ingredient": ingredient,
        "id": id,
        "remainder": remainder,
        "wholeLine": wholeLine,
      };
}

class MoreContent {
  MoreContent({
    required this.mobileSectionName,
    required this.feed,
  });

  String mobileSectionName;
  List<dynamic> feed;

  factory MoreContent.fromJson(Map<String, dynamic> json) => MoreContent(
        mobileSectionName: json["mobileSectionName"],
        feed: List<dynamic>.from(json["feed"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "mobileSectionName": mobileSectionName,
        "feed": List<dynamic>.from(feed.map((x) => x)),
      };
}

enum Abbreviation { KCAL, G, IU }

final abbreviationValues = EnumValues(
    {"g": Abbreviation.G, "IU": Abbreviation.IU, "kcal": Abbreviation.KCAL});

enum Name { CALORIE, GRAM, IU }

final nameValues =
    EnumValues({"calorie": Name.CALORIE, "gram": Name.GRAM, "IU": Name.IU});

enum Plural { CALORIES, GRAMS, IU }

final pluralValues = EnumValues(
    {"calories": Plural.CALORIES, "grams": Plural.GRAMS, "IU": Plural.IU});

class Reviews {
  Reviews({
    required this.mobileSectionName,
    required this.totalReviewCount,
    required this.averageRating,
    required this.reviews,
    required this.thisUserReview,
    required this.sortBy,
  });

  String mobileSectionName;
  int totalReviewCount;
  double averageRating;
  List<dynamic> reviews;
  dynamic thisUserReview;
  String sortBy;

  factory Reviews.fromJson(Map<String, dynamic> json) => Reviews(
        mobileSectionName: json["mobileSectionName"],
        totalReviewCount: json["totalReviewCount"],
        averageRating: json["averageRating"],
        reviews: List<dynamic>.from(json["reviews"].map((x) => x)),
        thisUserReview: json["thisUserReview"],
        sortBy: json["sortBy"],
      );

  Map<String, dynamic> toJson() => {
        "mobileSectionName": mobileSectionName,
        "totalReviewCount": totalReviewCount,
        "averageRating": averageRating,
        "reviews": List<dynamic>.from(reviews.map((x) => x)),
        "thisUserReview": thisUserReview,
        "sortBy": sortBy,
      };
}

class Profile {
  Profile({
    required this.profileName,
    required this.displayName,
    required this.siteUrl,
    required this.pictureUrl,
    required this.pageUrl,
    required this.description,
    required this.type,
    required this.profileUrl,
  });

  String profileName;
  String displayName;
  String siteUrl;
  String pictureUrl;
  String pageUrl;
  dynamic description;
  String type;
  String profileUrl;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        profileName: json["profileName"],
        displayName: json["displayName"],
        siteUrl: json["siteUrl"],
        pictureUrl: json["pictureUrl"],
        pageUrl: json["pageUrl"],
        description: json["description"],
        type: json["type"],
        profileUrl: json["profileUrl"],
      );

  Map<String, dynamic> toJson() => {
        "profileName": profileName,
        "displayName": displayName,
        "siteUrl": siteUrl,
        "pictureUrl": pictureUrl,
        "pageUrl": pageUrl,
        "description": description,
        "type": type,
        "profileUrl": profileUrl,
      };
}

class Source {
  Source({
    required this.sourceRecipeUrl,
    required this.sourceFaviconUrl,
    required this.sourceHttpsOk,
    required this.sourceInFrame,
    required this.sourceDisplayName,
    required this.proSource,
    required this.sourceSiteUrl,
    required this.eyebrowText,
    required this.sourcePageUrl,
    required this.marketingCopy,
    required this.sourceHttpOk,
    required this.marketingImage,
  });

  String sourceRecipeUrl;
  dynamic sourceFaviconUrl;
  bool sourceHttpsOk;
  bool sourceInFrame;
  String sourceDisplayName;
  dynamic proSource;
  String sourceSiteUrl;
  dynamic eyebrowText;
  String sourcePageUrl;
  dynamic marketingCopy;
  bool sourceHttpOk;
  dynamic marketingImage;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        sourceRecipeUrl: json["sourceRecipeUrl"],
        sourceFaviconUrl: json["sourceFaviconUrl"],
        sourceHttpsOk: json["sourceHttpsOk"],
        sourceInFrame: json["sourceInFrame"],
        sourceDisplayName: json["sourceDisplayName"],
        proSource: json["proSource"],
        sourceSiteUrl: json["sourceSiteUrl"],
        eyebrowText: json["eyebrowText"],
        sourcePageUrl: json["sourcePageUrl"],
        marketingCopy: json["marketingCopy"],
        sourceHttpOk: json["sourceHttpOk"],
        marketingImage: json["marketingImage"],
      );

  Map<String, dynamic> toJson() => {
        "sourceRecipeUrl": sourceRecipeUrl,
        "sourceFaviconUrl": sourceFaviconUrl,
        "sourceHttpsOk": sourceHttpsOk,
        "sourceInFrame": sourceInFrame,
        "sourceDisplayName": sourceDisplayName,
        "proSource": proSource,
        "sourceSiteUrl": sourceSiteUrl,
        "eyebrowText": eyebrowText,
        "sourcePageUrl": sourcePageUrl,
        "marketingCopy": marketingCopy,
        "sourceHttpOk": sourceHttpOk,
        "marketingImage": marketingImage,
      };
}

class Snapshot {
  Snapshot({
    required this.original,
    required this.resizable,
  });

  dynamic original;
  dynamic resizable;

  factory Snapshot.fromJson(Map<String, dynamic> json) => Snapshot(
        original: json["original"],
        resizable: json["resizable"],
      );

  Map<String, dynamic> toJson() => {
        "original": original,
        "resizable": resizable,
      };
}

class SpotlightSearch {
  SpotlightSearch({
    required this.keywords,
    required this.noindex,
  });

  List<String> keywords;
  bool noindex;

  factory SpotlightSearch.fromJson(Map<String, dynamic> json) =>
      SpotlightSearch(
        keywords: List<String>.from(json["keywords"].map((x) => x)),
        noindex: json["noindex"],
      );

  Map<String, dynamic> toJson() => {
        "keywords": List<dynamic>.from(keywords.map((x) => x)),
        "noindex": noindex,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

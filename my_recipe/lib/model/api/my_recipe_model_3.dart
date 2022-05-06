// To parse this JSON data, do
//
//     final listsModelRecipe = listsModelRecipeFromJson(jsonString);

import 'dart:convert';

ListsModelRecipe listsModelRecipeFromJson(String str) => ListsModelRecipe.fromJson(json.decode(str));

String listsModelRecipeToJson(ListsModelRecipe data) => json.encode(data.toJson());

class ListsModelRecipe {
  ListsModelRecipe({
    required this.feed,
  });

  List<Feed> feed;

  factory ListsModelRecipe.fromJson(Map<String, dynamic> json) => ListsModelRecipe(
    feed: List<Feed>.from(json["feed"].map((x) => Feed.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "feed": List<dynamic>.from(feed.map((x) => x.toJson())),
  };
}

class Feed {
  Feed({
    required this.display,
    required this.type,
    // required this.recipeType,
    // this.content,
  });

  FeedDisplay display;
  String type;
  // bool promoted;
  // bool proRecipe;
  // List<String> recipeType;
  // Content content;

  factory Feed.fromJson(Map<String, dynamic> json) => Feed(
    display: FeedDisplay.fromJson(json["display"]),
    type: json["type"],
    // recipeType: json["recipeType"] == null ? null : List<String>.from(json["recipeType"].map((x) => x)),
    // content: Content.fromJson(json["content"]),
  );

  Map<String, dynamic> toJson() => {
    "display": display.toJson(),
    "type": type,
    // "promoted": promoted,
    // "proRecipe": proRecipe == null ? null : proRecipe,
    // "recipeType": recipeType == null ? null : List<dynamic>.from(recipeType.map((x) => x)),
    // "tracking-id": trackingId,
    // "seo": seo == null ? null : seo.toJson(),
    // "content": content.toJson(),
  };
}

// class Content {
//   Content({
//     this.description,
//     this.tags,
//     this.preparationSteps,
//     this.alternateExternalUrls,
//     this.moreContent,
//     this.tagsAds,
//     this.details,
//     this.relatedContent,
//     this.ingredientLines,
//     this.unitSystem,
//     this.reviews,
//     this.relatedProducts,
//     this.preparationStepCount,
//     this.nutrition,
//     this.yums,
//     this.videos,
//     this.ctaUrl,
//     this.platformName,
//   });
//
//   Description description;
//   List<dynamic> urbSubmitters;
//   Tags tags;
//   List<dynamic> preparationSteps;
//   AlternateExternalUrls alternateExternalUrls;
//   MoreContent moreContent;
//   TagsAds tagsAds;
//   Details details;
//   MoreContent relatedContent;
//   List<IngredientLine> ingredientLines;
//   String unitSystem;
//   Reviews reviews;
//   MoreContent relatedProducts;
//   int preparationStepCount;
//   Nutrition nutrition;
//   Yums yums;
//   Videos videos;
//   String ctaUrl;
//   String platformName;
//
//   factory Content.fromJson(Map<String, dynamic> json) => Content(
//     description: json["description"] == null ? null : Description.fromJson(json["description"]),
//     urbSubmitters: json["urbSubmitters"] == null ? null : List<dynamic>.from(json["urbSubmitters"].map((x) => x)),
//     tags: json["tags"] == null ? null : Tags.fromJson(json["tags"]),
//     preparationSteps: json["preparationSteps"] == null ? null : List<dynamic>.from(json["preparationSteps"].map((x) => x)),
//     alternateExternalUrls: json["alternateExternalUrls"] == null ? null : AlternateExternalUrls.fromJson(json["alternateExternalUrls"]),
//     moreContent: json["moreContent"] == null ? null : MoreContent.fromJson(json["moreContent"]),
//     tagsAds: json["tagsAds"] == null ? null : TagsAds.fromJson(json["tagsAds"]),
//     details: Details.fromJson(json["details"]),
//     relatedContent: json["relatedContent"] == null ? null : MoreContent.fromJson(json["relatedContent"]),
//     ingredientLines: json["ingredientLines"] == null ? null : List<IngredientLine>.from(json["ingredientLines"].map((x) => IngredientLine.fromJson(x))),
//     unitSystem: json["unitSystem"] == null ? null : json["unitSystem"],
//     reviews: json["reviews"] == null ? null : Reviews.fromJson(json["reviews"]),
//     relatedProducts: json["relatedProducts"] == null ? null : MoreContent.fromJson(json["relatedProducts"]),
//     preparationStepCount: json["preparationStepCount"] == null ? null : json["preparationStepCount"],
//     nutrition: json["nutrition"] == null ? null : Nutrition.fromJson(json["nutrition"]),
//     yums: json["yums"] == null ? null : Yums.fromJson(json["yums"]),
//     videos: json["videos"] == null ? null : Videos.fromJson(json["videos"]),
//     ctaUrl: json["ctaUrl"] == null ? null : json["ctaUrl"],
//     platformName: json["platformName"] == null ? null : json["platformName"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "description": description == null ? null : description.toJson(),
//     "urbSubmitters": urbSubmitters == null ? null : List<dynamic>.from(urbSubmitters.map((x) => x)),
//     "tags": tags == null ? null : tags.toJson(),
//     "preparationSteps": preparationSteps == null ? null : List<dynamic>.from(preparationSteps.map((x) => x)),
//     "alternateExternalUrls": alternateExternalUrls == null ? null : alternateExternalUrls.toJson(),
//     "moreContent": moreContent == null ? null : moreContent.toJson(),
//     "tagsAds": tagsAds == null ? null : tagsAds.toJson(),
//     "details": details.toJson(),
//     "relatedContent": relatedContent == null ? null : relatedContent.toJson(),
//     "ingredientLines": ingredientLines == null ? null : List<dynamic>.from(ingredientLines.map((x) => x.toJson())),
//     "unitSystem": unitSystem == null ? null : unitSystem,
//     "reviews": reviews == null ? null : reviews.toJson(),
//     "relatedProducts": relatedProducts == null ? null : relatedProducts.toJson(),
//     "preparationStepCount": preparationStepCount == null ? null : preparationStepCount,
//     "nutrition": nutrition == null ? null : nutrition.toJson(),
//     "yums": yums == null ? null : yums.toJson(),
//     "videos": videos == null ? null : videos.toJson(),
//     "ctaUrl": ctaUrl == null ? null : ctaUrl,
//     "platformName": platformName == null ? null : platformName,
//   };
// }



// class Details {
//   Details({
//     this.directionsUrl,
//     this.totalTime,
//     this.displayName,
//     this.images,
//     this.name,
//     this.keywords,
//     this.brand,
//     this.id,
//     this.attribution,
//     this.recipeId,
//     this.numberOfServings,
//     this.globalId,
//     this.totalTimeInSeconds,
//     this.rating,
//   });
//
//   String directionsUrl;
//   String totalTime;
//   String displayName;
//   List<Image> images;
//   String name;
//   List<String> keywords;
//   dynamic brand;
//   String id;
//   Attribution attribution;
//   String recipeId;
//   int numberOfServings;
//   String globalId;
//   int totalTimeInSeconds;
//   int rating;
//
//   factory Details.fromJson(Map<String, dynamic> json) => Details(
//     directionsUrl: json["directionsUrl"] == null ? null : json["directionsUrl"],
//     totalTime: json["totalTime"] == null ? null : json["totalTime"],
//     displayName: json["displayName"] == null ? null : json["displayName"],
//     images: json["images"] == null ? null : List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
//     name: json["name"] == null ? null : json["name"],
//     keywords: json["keywords"] == null ? null : List<String>.from(json["keywords"].map((x) => x)),
//     brand: json["brand"],
//     id: json["id"],
//     attribution: json["attribution"] == null ? null : Attribution.fromJson(json["attribution"]),
//     recipeId: json["recipeId"] == null ? null : json["recipeId"],
//     numberOfServings: json["numberOfServings"] == null ? null : json["numberOfServings"],
//     globalId: json["globalId"] == null ? null : json["globalId"],
//     totalTimeInSeconds: json["totalTimeInSeconds"] == null ? null : json["totalTimeInSeconds"],
//     rating: json["rating"] == null ? null : json["rating"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "directionsUrl": directionsUrl == null ? null : directionsUrl,
//     "totalTime": totalTime == null ? null : totalTime,
//     "displayName": displayName == null ? null : displayName,
//     "images": images == null ? null : List<dynamic>.from(images.map((x) => x.toJson())),
//     "name": name == null ? null : name,
//     "keywords": keywords == null ? null : List<dynamic>.from(keywords.map((x) => x)),
//     "brand": brand,
//     "id": id,
//     "attribution": attribution == null ? null : attribution.toJson(),
//     "recipeId": recipeId == null ? null : recipeId,
//     "numberOfServings": numberOfServings == null ? null : numberOfServings,
//     "globalId": globalId == null ? null : globalId,
//     "totalTimeInSeconds": totalTimeInSeconds == null ? null : totalTimeInSeconds,
//     "rating": rating == null ? null : rating,
//   };
// }


// class Image {
//   Image({
//     this.hostedLargeUrl,
//     this.resizableImageUrl,
//     this.resizableImageHeight,
//     this.resizableImageWidth,
//   });
//
//   String hostedLargeUrl;
//   String resizableImageUrl;
//   int resizableImageHeight;
//   int resizableImageWidth;
//
//   factory Image.fromJson(Map<String, dynamic> json) => Image(
//     hostedLargeUrl: json["hostedLargeUrl"],
//     resizableImageUrl: json["resizableImageUrl"],
//     resizableImageHeight: json["resizableImageHeight"],
//     resizableImageWidth: json["resizableImageWidth"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "hostedLargeUrl": hostedLargeUrl,
//     "resizableImageUrl": resizableImageUrl,
//     "resizableImageHeight": resizableImageHeight,
//     "resizableImageWidth": resizableImageWidth,
//   };
// }

// class IngredientLine {
//   IngredientLine({
//     this.category,
//     this.amount,
//     this.unit,
//     this.ingredientId,
//     this.categoryId,
//     this.relatedRecipeSearchTerm,
//     this.ingredient,
//     this.id,
//     this.remainder,
//     this.quantity,
//     this.wholeLine,
//   });
//
//   String category;
//   Amount amount;
//   String unit;
//   String ingredientId;
//   String categoryId;
//   List<RelatedRecipeSearchTerm> relatedRecipeSearchTerm;
//   String ingredient;
//   String id;
//   String remainder;
//   double quantity;
//   String wholeLine;
//
//   factory IngredientLine.fromJson(Map<String, dynamic> json) => IngredientLine(
//     category: json["category"],
//     amount: Amount.fromJson(json["amount"]),
//     unit: json["unit"],
//     ingredientId: json["ingredientId"],
//     categoryId: json["categoryId"],
//     relatedRecipeSearchTerm: List<RelatedRecipeSearchTerm>.from(json["relatedRecipeSearchTerm"].map((x) => RelatedRecipeSearchTerm.fromJson(x))),
//     ingredient: json["ingredient"],
//     id: json["id"],
//     remainder: json["remainder"],
//     quantity: json["quantity"] == null ? null : json["quantity"].toDouble(),
//     wholeLine: json["wholeLine"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "category": category,
//     "amount": amount.toJson(),
//     "unit": unit,
//     "ingredientId": ingredientId,
//     "categoryId": categoryId,
//     "relatedRecipeSearchTerm": List<dynamic>.from(relatedRecipeSearchTerm.map((x) => x.toJson())),
//     "ingredient": ingredient,
//     "id": id,
//     "remainder": remainder,
//     "quantity": quantity == null ? null : quantity,
//     "wholeLine": wholeLine,
//   };
// }




enum Kind { COUNT, VOLUME, MASS }

final kindValues = EnumValues({
  "count": Kind.COUNT,
  "mass": Kind.MASS,
  "volume": Kind.VOLUME
});



// class Nutrition {
//   Nutrition({
//     this.mobileSectionName,
//     this.nutritionEstimates,
//   });
//
//   String mobileSectionName;
//   List<NutritionEstimate> nutritionEstimates;
//
//   factory Nutrition.fromJson(Map<String, dynamic> json) => Nutrition(
//     mobileSectionName: json["mobileSectionName"],
//     nutritionEstimates: List<NutritionEstimate>.from(json["nutritionEstimates"].map((x) => NutritionEstimate.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "mobileSectionName": mobileSectionName,
//     "nutritionEstimates": List<dynamic>.from(nutritionEstimates.map((x) => x.toJson())),
//   };
// }

// class NutritionEstimate {
//   NutritionEstimate({
//     this.attribute,
//     this.value,
//     this.unit,
//     this.display,
//   });
//
//   String attribute;
//   double value;
//   NutritionEstimateUnit unit;
//   NutritionEstimateDisplay display;
//
//   factory NutritionEstimate.fromJson(Map<String, dynamic> json) => NutritionEstimate(
//     attribute: json["attribute"],
//     value: json["value"].toDouble(),
//     unit: NutritionEstimateUnit.fromJson(json["unit"]),
//     display: NutritionEstimateDisplay.fromJson(json["display"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "attribute": attribute,
//     "value": value,
//     "unit": unit.toJson(),
//     "display": display.toJson(),
//   };
// }

// class NutritionEstimateDisplay {
//   NutritionEstimateDisplay({
//     this.value,
//     this.unit,
//     this.percentDailyValue,
//   });
//
//   int value;
//   UnitEnum unit;
//   int percentDailyValue;
//
//   factory NutritionEstimateDisplay.fromJson(Map<String, dynamic> json) => NutritionEstimateDisplay(
//     value: json["value"] == null ? null : json["value"],
//     unit: json["unit"] == null ? null : unitEnumValues.map[json["unit"]],
//     percentDailyValue: json["percentDailyValue"] == null ? null : json["percentDailyValue"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "value": value == null ? null : value,
//     "unit": unit == null ? null : unitEnumValues.reverse[unit],
//     "percentDailyValue": percentDailyValue == null ? null : percentDailyValue,
//   };
// }

enum UnitEnum { MG, G }

final unitEnumValues = EnumValues({
  "g": UnitEnum.G,
  "mg": UnitEnum.MG
});

// class NutritionEstimateUnit {
//   NutritionEstimateUnit({
//     this.name,
//     this.abbreviation,
//     this.plural,
//     this.decimal,
//   });
//
//   Name name;
//   Abbreviation abbreviation;
//   Plural plural;
//   bool decimal;
//
//   factory NutritionEstimateUnit.fromJson(Map<String, dynamic> json) => NutritionEstimateUnit(
//     name: nameValues.map[json["name"]],
//     abbreviation: abbreviationValues.map[json["abbreviation"]],
//     plural: pluralValues.map[json["plural"]],
//     decimal: json["decimal"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "name": nameValues.reverse[name],
//     "abbreviation": abbreviationValues.reverse[abbreviation],
//     "plural": pluralValues.reverse[plural],
//     "decimal": decimal,
//   };
// }

enum Abbreviation { KCAL, G, IU }

final abbreviationValues = EnumValues({
  "g": Abbreviation.G,
  "IU": Abbreviation.IU,
  "kcal": Abbreviation.KCAL
});

enum Name { CALORIE, GRAM, IU }

final nameValues = EnumValues({
  "calorie": Name.CALORIE,
  "gram": Name.GRAM,
  "IU": Name.IU
});

enum Plural { CALORIES, GRAMS, IU }

final pluralValues = EnumValues({
  "calories": Plural.CALORIES,
  "grams": Plural.GRAMS,
  "IU": Plural.IU
});

// class Reviews {
//   Reviews({
//     this.mobileSectionName,
//     this.totalReviewCount,
//     this.averageRating,
//     this.reviews,
//     this.thisUserReview,
//     this.sortBy,
//   });
//
//   String mobileSectionName;
//   int totalReviewCount;
//   double averageRating;
//   List<dynamic> reviews;
//   dynamic thisUserReview;
//   String sortBy;
//
//   factory Reviews.fromJson(Map<String, dynamic> json) => Reviews(
//     mobileSectionName: json["mobileSectionName"],
//     totalReviewCount: json["totalReviewCount"],
//     averageRating: json["averageRating"].toDouble(),
//     reviews: List<dynamic>.from(json["reviews"].map((x) => x)),
//     thisUserReview: json["thisUserReview"],
//     sortBy: json["sortBy"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "mobileSectionName": mobileSectionName,
//     "totalReviewCount": totalReviewCount,
//     "averageRating": averageRating,
//     "reviews": List<dynamic>.from(reviews.map((x) => x)),
//     "thisUserReview": thisUserReview,
//     "sortBy": sortBy,
//   };
// }
//



class FeedDisplay {
  FeedDisplay({
    required this.displayName,
    required this.images,
    required this.flag,
    // this.profiles,
    // this.displayPrepStepsInline,
    // this.collections,
    required this.title,
    // this.description,
    // this.callToActionText,
    // this.cardType,
    required this.textLocation,
  });

  String displayName;
  List<String> images;
  String flag;
  // Source source;
  // List<Profile> profiles;
  // bool displayPrepStepsInline;
  // List<dynamic> collections;
  String title;
  // dynamic description;
  // dynamic callToActionText;
  // String cardType;
  String textLocation;

  factory FeedDisplay.fromJson(Map<String, dynamic> json) => FeedDisplay(
    displayName: json["displayName"] == null ? null : json["displayName"],
    images: List<String>.from(json["images"].map((x) => x)),
    flag: json["flag"],
    // source: json["source"] == null ? null : Source.fromJson(json["source"]),
    // profiles: json["profiles"] == null ? null : List<Profile>.from(json["profiles"].map((x) => Profile.fromJson(x))),
    // displayPrepStepsInline: json["displayPrepStepsInline"] == null ? null : json["displayPrepStepsInline"],
    // collections: json["collections"] == null ? null : List<dynamic>.from(json["collections"].map((x) => x)),
    title: json["title"] == null ? null : json["title"],
    // description: json["description"],
    // callToActionText: json["callToActionText"],
    // cardType: json["cardType"] == null ? null : json["cardType"],
    textLocation: json["textLocation"] == null ? null : json["textLocation"],
  );

  Map<String, dynamic> toJson() => {
    "displayName": displayName == null ? null : displayName,
    "images": List<dynamic>.from(images.map((x) => x)),
    "flag": flag,
    // "source": source == null ? null : source.toJson(),
    // "profiles": profiles == null ? null : List<dynamic>.from(profiles.map((x) => x.toJson())),
    // "displayPrepStepsInline": displayPrepStepsInline == null ? null : displayPrepStepsInline,
    // "collections": collections == null ? null : List<dynamic>.from(collections.map((x) => x)),
    "title": title == null ? null : title,
    // "description": description,
    // "callToActionText": callToActionText,
    // "cardType": cardType == null ? null : cardType,
    "textLocation": textLocation == null ? null : textLocation,
  };
}

// class Profile {
//   Profile({
//     required this.profileName,
//     required this.displayName,
//     required this.siteUrl,
//     required this.pictureUrl,
//     required this.pageUrl,
//     required this.type,
//     required this.profileUrl,
//   });
//
//   String profileName;
//   String displayName;
//   String siteUrl;
//   String pictureUrl;
//   String pageUrl;
//   String type;
//   String profileUrl;
//
//   factory Profile.fromJson(Map<String, dynamic> json) => Profile(
//     profileName: json["profileName"],
//     displayName: json["displayName"],
//     siteUrl: json["siteUrl"],
//     pictureUrl: json["pictureUrl"],
//     pageUrl: json["pageUrl"],
//     type: json["type"],
//     profileUrl: json["profileUrl"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "profileName": profileName,
//     "displayName": displayName,
//     "siteUrl": siteUrl,
//     "pictureUrl": pictureUrl,
//     "pageUrl": pageUrl,
//     "type": type,
//     "profileUrl": profileUrl,
//   };
// }

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

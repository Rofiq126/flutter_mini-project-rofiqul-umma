// To parse this JSON data, do
//
//     final listRecipeModel = listRecipeModelFromJson(jsonString);

import 'dart:convert';

ListRecipeModel listRecipeModelFromJson(String str) => ListRecipeModel.fromJson(json.decode(str));

String listRecipeModelToJson(ListRecipeModel data) => json.encode(data.toJson());

class ListRecipeModel {
    ListRecipeModel({
        required this.feed,
        required this.seo,
    });

    List<Feed> feed;
    ListRecipeModelSeo seo;

    factory ListRecipeModel.fromJson(Map<String, dynamic> json) => ListRecipeModel(
        feed: List<Feed>.from(json["feed"].map((x) => Feed.fromJson(x))),
        seo: ListRecipeModelSeo.fromJson(json["seo"]),
    );

    Map<String, dynamic> toJson() => {
        "feed": List<dynamic>.from(feed.map((x) => x.toJson())),
        "seo": seo.toJson(),
    };
}

class Feed {
    Feed({
        required this.display,
        required this.type,
        required this.promoted,
        required this.proRecipe,
        required this.recipeType,
        required this.trackingId,
        required this.seo,
        required this.content,
    });

    FeedDisplay display;
    String type;
    bool promoted;
    bool proRecipe;
    List<String> recipeType;
    String trackingId;
    FeedSeo seo;
    Content content;

    factory Feed.fromJson(Map<String, dynamic> json) => Feed(
        display: FeedDisplay.fromJson(json["display"]),
        type: json["type"],
        promoted: json["promoted"],
        proRecipe: json["proRecipe"],
        recipeType: List<String>.from(json["recipeType"].map((x) => x)),
        trackingId: json["tracking-id"],
        seo: FeedSeo.fromJson(json["seo"]),
        content: Content.fromJson(json["content"]),
    );

    Map<String, dynamic> toJson() => {
        "display": display.toJson(),
        "type": type,
        "promoted": promoted,
        "proRecipe": proRecipe,
        "recipeType": List<dynamic>.from(recipeType.map((x) => x)),
        "tracking-id": trackingId,
        "seo": seo.toJson(),
        "content": content.toJson(),
    };
}

class Content {
    Content({
        required this.description,
        required this.urbSubmitters,
        required this.tags,
        required this.preparationSteps,
        required this.alternateExternalUrls,
        required this.moreContent,
        required this.tagsAds,
        required this.details,
        required this.relatedContent,
        required this.ingredientLines,
        required this.unitSystem,
        required this.reviews,
        required this.relatedProducts,
        required this.preparationStepCount,
        required this.nutrition,
        required this.yums,
    });

    dynamic description;
    List<dynamic> urbSubmitters;
    Tags tags;
    dynamic preparationSteps;
    AlternateExternalUrls alternateExternalUrls;
    MoreContent moreContent;
    TagsAds tagsAds;
    Details details;
    MoreContent relatedContent;
    List<IngredientLine> ingredientLines;
    String unitSystem;
    Reviews reviews;
    MoreContent relatedProducts;
    int preparationStepCount;
    Nutrition nutrition;
    Yums yums;

    factory Content.fromJson(Map<String, dynamic> json) => Content(
        description: json["description"],
        urbSubmitters: List<dynamic>.from(json["urbSubmitters"].map((x) => x)),
        tags: Tags.fromJson(json["tags"]),
        preparationSteps: json["preparationSteps"],
        alternateExternalUrls: AlternateExternalUrls.fromJson(json["alternateExternalUrls"]),
        moreContent: MoreContent.fromJson(json["moreContent"]),
        tagsAds: TagsAds.fromJson(json["tagsAds"]),
        details: Details.fromJson(json["details"]),
        relatedContent: MoreContent.fromJson(json["relatedContent"]),
        ingredientLines: List<IngredientLine>.from(json["ingredientLines"].map((x) => IngredientLine.fromJson(x))),
        unitSystem: json["unitSystem"],
        reviews: Reviews.fromJson(json["reviews"]),
        relatedProducts: MoreContent.fromJson(json["relatedProducts"]),
        preparationStepCount: json["preparationStepCount"],
        nutrition: Nutrition.fromJson(json["nutrition"]),
        yums: Yums.fromJson(json["yums"]),
    );

    Map<String, dynamic> toJson() => {
        "description": description,
        "urbSubmitters": List<dynamic>.from(urbSubmitters.map((x) => x)),
        "tags": tags.toJson(),
        "preparationSteps": preparationSteps,
        "alternateExternalUrls": alternateExternalUrls.toJson(),
        "moreContent": moreContent.toJson(),
        "tagsAds": tagsAds.toJson(),
        "details": details.toJson(),
        "relatedContent": relatedContent.toJson(),
        "ingredientLines": List<dynamic>.from(ingredientLines.map((x) => x.toJson())),
        "unitSystem": unitSystem,
        "reviews": reviews.toJson(),
        "relatedProducts": relatedProducts.toJson(),
        "preparationStepCount": preparationStepCount,
        "nutrition": nutrition.toJson(),
        "yums": yums.toJson(),
    };
}

class AlternateExternalUrls {
    AlternateExternalUrls({
        required this.sourceAmpViewUrl,
    });

    String sourceAmpViewUrl;

    factory AlternateExternalUrls.fromJson(Map<String, dynamic> json) => AlternateExternalUrls(
        sourceAmpViewUrl: json["source-amp-view-url"],
    );

    Map<String, dynamic> toJson() => {
        "source-amp-view-url": sourceAmpViewUrl,
    };
}

class Details {
    Details({
        required this.directionsUrl,
        required this.totalTime,
        required this.displayName,
        required this.images,
        required this.name,
        required this.keywords,
        required this.brand,
        required this.id,
        required this.attribution,
        required this.recipeId,
        required this.numberOfServings,
        required this.globalId,
        required this.totalTimeInSeconds,
        required this.rating,
    });

    String directionsUrl;
    String totalTime;
    String displayName;
    List<Picture> images;
    String name;
    List<String> keywords;
    dynamic brand;
    String id;
    Attribution attribution;
    String recipeId;
    int numberOfServings;
    String globalId;
    int totalTimeInSeconds;
    int rating;

    factory Details.fromJson(Map<String, dynamic> json) => Details(
        directionsUrl: json["directionsUrl"],
        totalTime: json["totalTime"],
        displayName: json["displayName"],
        images: List<Picture>.from(json["images"].map((x) => Picture.fromJson(x))),
        name: json["name"],
        keywords: List<String>.from(json["keywords"].map((x) => x)),
        brand: json["brand"],
        id: json["id"],
        attribution: Attribution.fromJson(json["attribution"]),
        recipeId: json["recipeId"],
        numberOfServings: json["numberOfServings"],
        globalId: json["globalId"],
        totalTimeInSeconds: json["totalTimeInSeconds"],
        rating: json["rating"],
    );

    Map<String, dynamic> toJson() => {
        "directionsUrl": directionsUrl,
        "totalTime": totalTime,
        "displayName": displayName,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "name": name,
        "keywords": List<dynamic>.from(keywords.map((x) => x)),
        "brand": brand,
        "id": id,
        "attribution": attribution.toJson(),
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
        required this.amount,
        required this.unit,
        required this.ingredientId,
        required this.categoryId,
        required this.relatedRecipeSearchTerm,
        required this.ingredient,
        required this.id,
        required this.remainder,
        required this.quantity,
        required this.wholeLine,
    });

    String category;
    Amount amount;
    String unit;
    String ingredientId;
    String categoryId;
    List<RelatedRecipeSearchTerm> relatedRecipeSearchTerm;
    String ingredient;
    String id;
    String remainder;
    double quantity;
    String wholeLine;

    factory IngredientLine.fromJson(Map<String, dynamic> json) => IngredientLine(
        category: json["category"],
        amount: Amount.fromJson(json["amount"]),
        unit: json["unit"],
        ingredientId: json["ingredientId"],
        categoryId: json["categoryId"],
        relatedRecipeSearchTerm: List<RelatedRecipeSearchTerm>.from(json["relatedRecipeSearchTerm"].map((x) => RelatedRecipeSearchTerm.fromJson(x))),
        ingredient: json["ingredient"],
        id: json["id"],
        remainder: json["remainder"],
        quantity: json["quantity"].toDouble(),
        wholeLine: json["wholeLine"],
    );

    Map<String, dynamic> toJson() => {
        "category": category,
        "amount": amount.toJson(),
        "unit": unit,
        "ingredientId": ingredientId,
        "categoryId": categoryId,
        "relatedRecipeSearchTerm": List<dynamic>.from(relatedRecipeSearchTerm.map((x) => x.toJson())),
        "ingredient": ingredient,
        "id": id,
        "remainder": remainder,
        "quantity": quantity,
        "wholeLine": wholeLine,
    };
}

class Amount {
    Amount({
        required this.metric,
        required this.imperial,
    });

    Imperial metric;
    Imperial imperial;

    factory Amount.fromJson(Map<String, dynamic> json) => Amount(
        metric: Imperial.fromJson(json["metric"]),
        imperial: Imperial.fromJson(json["imperial"]),
    );

    Map<String, dynamic> toJson() => {
        "metric": metric.toJson(),
        "imperial": imperial.toJson(),
    };
}

class Imperial {
    Imperial({
        required this.unit,
        required this.quantity,
    });

    ImperialUnit unit;
    double quantity;

    factory Imperial.fromJson(Map<String, dynamic> json) => Imperial(
        unit: ImperialUnit.fromJson(json["unit"]),
        quantity: json["quantity"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "unit": unit.toJson(),
        "quantity": quantity,
    };
}

class ImperialUnit {
    ImperialUnit({
        required this.id,
        required this.name,
        required this.abbreviation,
        required this.plural,
        required this.pluralAbbreviation,
        required this.kind,
        required this.decimal,
    });

    String id;
    String name;
    String abbreviation;
    String plural;
    String pluralAbbreviation;
    Kind? kind;
    bool decimal;

    factory ImperialUnit.fromJson(Map<String, dynamic> json) => ImperialUnit(
        id: json["id"],
        name: json["name"],
        abbreviation: json["abbreviation"],
        plural: json["plural"],
        pluralAbbreviation: json["pluralAbbreviation"],
        kind: kindValues.map[json["kind"]],
        decimal: json["decimal"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "abbreviation": abbreviation,
        "plural": plural,
        "pluralAbbreviation": pluralAbbreviation,
        "kind": kindValues.reverse[kind],
        "decimal": decimal,
    };
}

enum Kind { COUNT, VOLUME, MASS }

final kindValues = EnumValues({
    "count": Kind.COUNT,
    "mass": Kind.MASS,
    "volume": Kind.VOLUME
});

class RelatedRecipeSearchTerm {
    RelatedRecipeSearchTerm({
        required this.allowedIngredient,
    });

    String allowedIngredient;

    factory RelatedRecipeSearchTerm.fromJson(Map<String, dynamic> json) => RelatedRecipeSearchTerm(
        allowedIngredient: json["allowedIngredient"],
    );

    Map<String, dynamic> toJson() => {
        "allowedIngredient": allowedIngredient,
    };
}

class MoreContent {
    MoreContent({
        required this.mobileSectionName,
        required this.queryParams,
        required this.feed,
    });

    String mobileSectionName;
    QueryParams queryParams;
    List<dynamic> feed;

    factory MoreContent.fromJson(Map<String, dynamic> json) => MoreContent(
        mobileSectionName: json["mobileSectionName"],
        queryParams: QueryParams.fromJson(json["queryParams"]),
        feed: List<dynamic>.from(json["feed"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "mobileSectionName": mobileSectionName,
        "queryParams": queryParams.toJson(),
        "feed": List<dynamic>.from(feed.map((x) => x)),
    };
}

class QueryParams {
    QueryParams({
        required this.start,
        required this.authorId,
        required this.id,
        required this.apiFeedType,
        required this.relatedContentType,
    });

    int start;
    String authorId;
    String id;
    String apiFeedType;
    String relatedContentType;

    factory QueryParams.fromJson(Map<String, dynamic> json) => QueryParams(
        start: json["start"],
        authorId: json["authorId"] == null ? null : json["authorId"],
        id: json["id"],
        apiFeedType: json["apiFeedType"],
        relatedContentType: json["relatedContentType"] == null ? null : json["relatedContentType"],
    );

    Map<String, dynamic> toJson() => {
        "start": start,
        "authorId": authorId == null ? null : authorId,
        "id": id,
        "apiFeedType": apiFeedType,
        "relatedContentType": relatedContentType == null ? null : relatedContentType,
    };
}

class Nutrition {
    Nutrition({
        required this.mobileSectionName,
        required this.nutritionEstimates,
    });

    String mobileSectionName;
    List<NutritionEstimate> nutritionEstimates;

    factory Nutrition.fromJson(Map<String, dynamic> json) => Nutrition(
        mobileSectionName: json["mobileSectionName"],
        nutritionEstimates: List<NutritionEstimate>.from(json["nutritionEstimates"].map((x) => NutritionEstimate.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "mobileSectionName": mobileSectionName,
        "nutritionEstimates": List<dynamic>.from(nutritionEstimates.map((x) => x.toJson())),
    };
}

class NutritionEstimate {
    NutritionEstimate({
        required this.attribute,
        required this.value,
        required this.unit,
        required this.display,
    });

    String attribute;
    double value;
    NutritionEstimateUnit unit;
    NutritionEstimateDisplay display;

    factory NutritionEstimate.fromJson(Map<String, dynamic> json) => NutritionEstimate(
        attribute: json["attribute"],
        value: json["value"].toDouble(),
        unit: NutritionEstimateUnit.fromJson(json["unit"]),
        display: NutritionEstimateDisplay.fromJson(json["display"]),
    );

    Map<String, dynamic> toJson() => {
        "attribute": attribute,
        "value": value,
        "unit": unit.toJson(),
        "display": display.toJson(),
    };
}

class NutritionEstimateDisplay {
    NutritionEstimateDisplay({
        required this.value,
        required this.unit,
        required this.percentDailyValue,
    });

    int value;
    String unit;
    int percentDailyValue;

    factory NutritionEstimateDisplay.fromJson(Map<String, dynamic> json) => NutritionEstimateDisplay(
        value: json["value"] == null ? null : json["value"],
        unit: json["unit"] == null ? null : json["unit"],
        percentDailyValue: json["percentDailyValue"] == null ? null : json["percentDailyValue"],
    );

    Map<String, dynamic> toJson() => {
        "value": value == null ? null : value,
        "unit": unit == null ? null : unit,
        "percentDailyValue": percentDailyValue == null ? null : percentDailyValue,
    };
}

class NutritionEstimateUnit {
    NutritionEstimateUnit({
        required this.name,
        required this.abbreviation,
        required this.plural,
        required this.decimal,
    });

    Name? name;
    Abbreviation? abbreviation;
    Plural? plural;
    bool? decimal;

    factory NutritionEstimateUnit.fromJson(Map<String, dynamic> json) => NutritionEstimateUnit(
        name: nameValues.map[json["name"]],
        abbreviation: abbreviationValues.map[json["abbreviation"]],
        plural: pluralValues.map[json["plural"]],
        decimal: json["decimal"],
    );

    Map<String, dynamic> toJson() => {
        "name": nameValues.reverse[name],
        "abbreviation": abbreviationValues.reverse[abbreviation],
        "plural": pluralValues.reverse[plural],
        "decimal": decimal,
    };
}

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
    int averageRating;
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

class Tags {
    Tags({
        required this.dish,
    });

    List<Dish> dish;

    factory Tags.fromJson(Map<String, dynamic> json) => Tags(
        dish: List<Dish>.from(json["dish"].map((x) => Dish.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "dish": List<dynamic>.from(dish.map((x) => x.toJson())),
    };
}

class Dish {
    Dish({
        required this.displayName,
        required this.tagUrl,
    });

    String displayName;
    String tagUrl;

    factory Dish.fromJson(Map<String, dynamic> json) => Dish(
        displayName: json["display-name"],
        tagUrl: json["tag-url"],
    );

    Map<String, dynamic> toJson() => {
        "display-name": displayName,
        "tag-url": tagUrl,
    };
}

class TagsAds {
    TagsAds({
        required this.adtag,
    });

    List<Dish> adtag;

    factory TagsAds.fromJson(Map<String, dynamic> json) => TagsAds(
        adtag: List<Dish>.from(json["adtag"].map((x) => Dish.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "adtag": List<dynamic>.from(adtag.map((x) => x.toJson())),
    };
}

class Yums {
    Yums({
        required this.count,
        required this.thisUser,
    });

    int count;
    String thisUser;

    factory Yums.fromJson(Map<String, dynamic> json) => Yums(
        count: json["count"],
        thisUser: json["this-user"],
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "this-user": thisUser,
    };
}

class FeedDisplay {
    FeedDisplay({
        required this.displayName,
        required this.images,
        required this.flag,
        required this.source,
        required this.profiles,
        required this.displayPrepStepsInline,
        required this.collections,
    });

    String displayName;
    List<String> images;
    String flag;
    Source source;
    List<Profile> profiles;
    dynamic displayPrepStepsInline;
    List<dynamic> collections;

    factory FeedDisplay.fromJson(Map<String, dynamic> json) => FeedDisplay(
        displayName: json["displayName"],
        images: List<String>.from(json["images"].map((x) => x)),
        flag: json["flag"],
        source: Source.fromJson(json["source"]),
        profiles: List<Profile>.from(json["profiles"].map((x) => Profile.fromJson(x))),
        displayPrepStepsInline: json["displayPrepStepsInline"],
        collections: List<dynamic>.from(json["collections"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "displayName": displayName,
        "images": List<dynamic>.from(images.map((x) => x)),
        "flag": flag,
        "source": source.toJson(),
        "profiles": List<dynamic>.from(profiles.map((x) => x.toJson())),
        "displayPrepStepsInline": displayPrepStepsInline,
        "collections": List<dynamic>.from(collections.map((x) => x)),
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
        required this.introVideo,
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
    IntroVideo introVideo;
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
        introVideo: IntroVideo.fromJson(json["introVideo"]),
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
        "introVideo": introVideo.toJson(),
        "eyebrowText": eyebrowText,
        "sourcePageUrl": sourcePageUrl,
        "marketingCopy": marketingCopy,
        "sourceHttpOk": sourceHttpOk,
        "marketingImage": marketingImage,
    };
}

class IntroVideo {
    IntroVideo({
        required this.id,
        required this.originalUrl,
        required this.hlsUrl,
        required this.dashUrl,
        required this.hasAudio,
        required this.snapshot,
    });

    dynamic id;
    dynamic originalUrl;
    dynamic hlsUrl;
    dynamic dashUrl;
    dynamic hasAudio;
    Snapshot snapshot;

    factory IntroVideo.fromJson(Map<String, dynamic> json) => IntroVideo(
        id: json["id"],
        originalUrl: json["originalUrl"],
        hlsUrl: json["hlsUrl"],
        dashUrl: json["dashUrl"],
        hasAudio: json["hasAudio"],
        snapshot: Snapshot.fromJson(json["snapshot"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "originalUrl": originalUrl,
        "hlsUrl": hlsUrl,
        "dashUrl": dashUrl,
        "hasAudio": hasAudio,
        "snapshot": snapshot.toJson(),
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

class FeedSeo {
    FeedSeo({
        required this.web,
        required this.spotlightSearch,
        required this.firebase,
    });

    Web web;
    SpotlightSearch spotlightSearch;
    Firebase firebase;

    factory FeedSeo.fromJson(Map<String, dynamic> json) => FeedSeo(
        web: Web.fromJson(json["web"]),
        spotlightSearch: SpotlightSearch.fromJson(json["spotlightSearch"]),
        firebase: Firebase.fromJson(json["firebase"]),
    );

    Map<String, dynamic> toJson() => {
        "web": web.toJson(),
        "spotlightSearch": spotlightSearch.toJson(),
        "firebase": firebase.toJson(),
    };
}

class Firebase {
    Firebase({
        required this.noindex,
    });

    bool noindex;

    factory Firebase.fromJson(Map<String, dynamic> json) => Firebase(
        noindex: json["noindex"],
    );

    Map<String, dynamic> toJson() => {
        "noindex": noindex,
    };
}

class SpotlightSearch {
    SpotlightSearch({
        required this.keywords,
        required this.noindex,
    });

    List<String> keywords;
    bool noindex;

    factory SpotlightSearch.fromJson(Map<String, dynamic> json) => SpotlightSearch(
        keywords: List<String>.from(json["keywords"].map((x) => x)),
        noindex: json["noindex"],
    );

    Map<String, dynamic> toJson() => {
        "keywords": List<dynamic>.from(keywords.map((x) => x)),
        "noindex": noindex,
    };
}

class Web {
    Web({
        required this.noindex,
        required this.canonicalTerm,
        required this.metaTags,
        required this.linkTags,
        required this.imageUrl,
    });

    bool noindex;
    String canonicalTerm;
    MetaTags metaTags;
    List<LinkTag> linkTags;
    String imageUrl;

    factory Web.fromJson(Map<String, dynamic> json) => Web(
        noindex: json["noindex"],
        canonicalTerm: json["canonical-term"],
        metaTags: MetaTags.fromJson(json["meta-tags"]),
        linkTags: List<LinkTag>.from(json["link-tags"].map((x) => LinkTag.fromJson(x))),
        imageUrl: json["image-url"],
    );

    Map<String, dynamic> toJson() => {
        "noindex": noindex,
        "canonical-term": canonicalTerm,
        "meta-tags": metaTags.toJson(),
        "link-tags": List<dynamic>.from(linkTags.map((x) => x.toJson())),
        "image-url": imageUrl,
    };
}

class LinkTag {
    LinkTag({
        required this.rel,
        required this.href,
        required this.hreflang,
    });

    String rel;
    String href;
    String hreflang;

    factory LinkTag.fromJson(Map<String, dynamic> json) => LinkTag(
        rel: json["rel"],
        href: json["href"],
        hreflang: json["hreflang"] == null ? null : json["hreflang"],
    );

    Map<String, dynamic> toJson() => {
        "rel": rel,
        "href": href,
        "hreflang": hreflang == null ? null : hreflang,
    };
}

class MetaTags {
    MetaTags({
        required this.title,
        required this.description,
    });

    String title;
    String description;

    factory MetaTags.fromJson(Map<String, dynamic> json) => MetaTags(
        title: json["title"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
    };
}

class ListRecipeModelSeo {
    ListRecipeModelSeo({
        required this.web,
        required this.spotlightSearch,
        required this.firebase,
    });

    Firebase web;
    Firebase spotlightSearch;
    Firebase firebase;

    factory ListRecipeModelSeo.fromJson(Map<String, dynamic> json) => ListRecipeModelSeo(
        web: Firebase.fromJson(json["web"]),
        spotlightSearch: Firebase.fromJson(json["spotlightSearch"]),
        firebase: Firebase.fromJson(json["firebase"]),
    );

    Map<String, dynamic> toJson() => {
        "web": web.toJson(),
        "spotlightSearch": spotlightSearch.toJson(),
        "firebase": firebase.toJson(),
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

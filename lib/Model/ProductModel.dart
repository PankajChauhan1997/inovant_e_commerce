// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  int? status;
  String? message;
  Data? data;

  ProductModel({this.status, this.message, this.data});

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  String? id;
  String? sku;
  int? isReturn;
  int? celebrityId;
  String? name;
  String? attributeSetId;
  String? price;
  String? finalPrice;
  String? status;
  String? type;
  String? webUrl;
  String? brandName;
  String? brand;
  int? isFollowingBrand;
  String? brandBannerUrl;
  bool? isSalable;
  int? isNew;
  int? isSale;
  int? isTrending;
  int? isBestSeller;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic weight;
  String? description;
  dynamic shortDescription;
  dynamic howToUse;
  dynamic manufacturer;
  dynamic keyIngredients;
  dynamic returnsAndExchanges;
  dynamic shippingAndDelivery;
  dynamic aboutTheBrand;
  String? metaTitle;
  dynamic metaKeyword;
  String? metaDescription;
  dynamic sizeChart;
  int? wishlistItemId;
  String? hasOptions;
  List<dynamic>? options;
  List<dynamic>? bundleOptions;
  List<ConfigurableOption>? configurableOption;
  int? remainingQty;
  List<String>? images;
  List<dynamic>? upsell;
  List<dynamic>? related;
  Review? review;

  Data({
    this.id,
    this.sku,
    this.isReturn,
    this.celebrityId,
    this.name,
    this.attributeSetId,
    this.price,
    this.finalPrice,
    this.status,
    this.type,
    this.webUrl,
    this.brandName,
    this.brand,
    this.isFollowingBrand,
    this.brandBannerUrl,
    this.isSalable,
    this.isNew,
    this.isSale,
    this.isTrending,
    this.isBestSeller,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.weight,
    this.description,
    this.shortDescription,
    this.howToUse,
    this.manufacturer,
    this.keyIngredients,
    this.returnsAndExchanges,
    this.shippingAndDelivery,
    this.aboutTheBrand,
    this.metaTitle,
    this.metaKeyword,
    this.metaDescription,
    this.sizeChart,
    this.wishlistItemId,
    this.hasOptions,
    this.options,
    this.bundleOptions,
    this.configurableOption,
    this.remainingQty,
    this.images,
    this.upsell,
    this.related,
    this.review,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    sku: json["sku"],
    isReturn: json["is_return"],
    celebrityId: json["celebrity_id"],
    name: json["name"],
    attributeSetId: json["attribute_set_id"],
    price: json["price"],
    finalPrice: json["final_price"],
    status: json["status"],
    type: json["type"],
    webUrl: json["web_url"],
    brandName: json["brand_name"],
    brand: json["brand"],
    isFollowingBrand: json["is_following_brand"],
    brandBannerUrl: json["brand_banner_url"],
    isSalable: json["is_salable"],
    isNew: json["is_new"],
    isSale: json["is_sale"],
    isTrending: json["is_trending"],
    isBestSeller: json["is_best_seller"],
    image: json["image"],
    createdAt: json["created_at"] == null
        ? null
        : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null
        ? null
        : DateTime.parse(json["updated_at"]),
    weight: json["weight"],
    description: json["description"],
    shortDescription: json["short_description"],
    howToUse: json["how_to_use"],
    manufacturer: json["manufacturer"],
    keyIngredients: json["key_ingredients"],
    returnsAndExchanges: json["returns_and_exchanges"],
    shippingAndDelivery: json["shipping_and_delivery"],
    aboutTheBrand: json["about_the_brand"],
    metaTitle: json["meta_title"],
    metaKeyword: json["meta_keyword"],
    metaDescription: json["meta_description"],
    sizeChart: json["size_chart"],
    wishlistItemId: json["wishlist_item_id"],
    hasOptions: json["has_options"],
    options: json["options"] == null
        ? []
        : List<dynamic>.from(json["options"]!.map((x) => x)),
    bundleOptions: json["bundle_options"] == null
        ? []
        : List<dynamic>.from(json["bundle_options"]!.map((x) => x)),
    configurableOption: json["configurable_option"] == null
        ? []
        : List<ConfigurableOption>.from(
            json["configurable_option"]!.map(
              (x) => ConfigurableOption.fromJson(x),
            ),
          ),
    remainingQty: json["remaining_qty"],
    images: json["images"] == null
        ? []
        : List<String>.from(json["images"]!.map((x) => x)),
    upsell: json["upsell"] == null
        ? []
        : List<dynamic>.from(json["upsell"]!.map((x) => x)),
    related: json["related"] == null
        ? []
        : List<dynamic>.from(json["related"]!.map((x) => x)),
    review: json["review"] == null ? null : Review.fromJson(json["review"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sku": sku,
    "is_return": isReturn,
    "celebrity_id": celebrityId,
    "name": name,
    "attribute_set_id": attributeSetId,
    "price": price,
    "final_price": finalPrice,
    "status": status,
    "type": type,
    "web_url": webUrl,
    "brand_name": brandName,
    "brand": brand,
    "is_following_brand": isFollowingBrand,
    "brand_banner_url": brandBannerUrl,
    "is_salable": isSalable,
    "is_new": isNew,
    "is_sale": isSale,
    "is_trending": isTrending,
    "is_best_seller": isBestSeller,
    "image": image,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "weight": weight,
    "description": description,
    "short_description": shortDescription,
    "how_to_use": howToUse,
    "manufacturer": manufacturer,
    "key_ingredients": keyIngredients,
    "returns_and_exchanges": returnsAndExchanges,
    "shipping_and_delivery": shippingAndDelivery,
    "about_the_brand": aboutTheBrand,
    "meta_title": metaTitle,
    "meta_keyword": metaKeyword,
    "meta_description": metaDescription,
    "size_chart": sizeChart,
    "wishlist_item_id": wishlistItemId,
    "has_options": hasOptions,
    "options": options == null
        ? []
        : List<dynamic>.from(options!.map((x) => x)),
    "bundle_options": bundleOptions == null
        ? []
        : List<dynamic>.from(bundleOptions!.map((x) => x)),
    "configurable_option": configurableOption == null
        ? []
        : List<dynamic>.from(configurableOption!.map((x) => x.toJson())),
    "remaining_qty": remainingQty,
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
    "upsell": upsell == null ? [] : List<dynamic>.from(upsell!.map((x) => x)),
    "related": related == null
        ? []
        : List<dynamic>.from(related!.map((x) => x)),
    "review": review?.toJson(),
  };
}

class ConfigurableOption {
  int? attributeId;
  String? type;
  String? attributeCode;
  List<Attribute>? attributes;

  ConfigurableOption({
    this.attributeId,
    this.type,
    this.attributeCode,
    this.attributes,
  });

  factory ConfigurableOption.fromJson(Map<String, dynamic> json) =>
      ConfigurableOption(
        attributeId: json["attribute_id"],
        type: json["type"],
        attributeCode: json["attribute_code"],
        attributes: json["attributes"] == null
            ? []
            : List<Attribute>.from(
                json["attributes"]!.map((x) => Attribute.fromJson(x)),
              ),
      );

  Map<String, dynamic> toJson() => {
    "attribute_id": attributeId,
    "type": type,
    "attribute_code": attributeCode,
    "attributes": attributes == null
        ? []
        : List<dynamic>.from(attributes!.map((x) => x.toJson())),
  };
}

class Attribute {
  String? value;
  String? optionId;
  String? attributeImageUrl;
  String? price;
  List<String>? images;
  dynamic colorCode;
  String? swatchUrl;

  Attribute({
    this.value,
    this.optionId,
    this.attributeImageUrl,
    this.price,
    this.images,
    this.colorCode,
    this.swatchUrl,
  });

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
    value: json["value"],
    optionId: json["option_id"],
    attributeImageUrl: json["attribute_image_url"],
    price: json["price"],
    images: json["images"] == null
        ? []
        : List<String>.from(json["images"]!.map((x) => x)),
    colorCode: json["color_code"],
    swatchUrl: json["swatch_url"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "option_id": optionId,
    "attribute_image_url": attributeImageUrl,
    "price": price,
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
    "color_code": colorCode,
    "swatch_url": swatchUrl,
  };
}

class Review {
  int? totalReview;
  int? ratingCount;

  Review({this.totalReview, this.ratingCount});

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    totalReview: json["total_review"],
    ratingCount: json["rating_count"],
  );

  Map<String, dynamic> toJson() => {
    "total_review": totalReview,
    "rating_count": ratingCount,
  };
}

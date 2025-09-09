class DataProductModel {
  int? limit;
  int? skip;
  int? total;
  List<ProductModel>? products;

  DataProductModel({
    required this.limit,
    required this.skip,
    required this.total,
    required this.products,
  });

  factory DataProductModel.fromJson(Map<String, dynamic> json) {
    List<ProductModel> productList = [];
    for (Map<String, dynamic> each in json["products"]) {
      productList.add(ProductModel.fromJson(each));
    }
    return DataProductModel(
      limit: json["limit"],
      skip: json["skip"],
      total: json["total"],
      products: productList,
    );
  }
}

class ProductModel {
  String? brand;
  String? category;
  double? price;
  String? description;
  String? thumbnail;
  String? title;
  String? returnPolicy;
  String? shippingInformation;
  String? warrantyInformation;
  num? discountPercentage;
  num? rating;
  int? id;
  num? rate;
  int? stock;
  List<dynamic>? images;
//
  ProductModel({
    required this.brand,
    required this.category,
    required this.price,
    required this.description,
    required this.thumbnail,
    required this.title,
    required this.returnPolicy,
    required this.shippingInformation,
    required this.warrantyInformation,
    required this.discountPercentage,
    required this.rating,
    required this.id,
    required this.rate,
    required this.stock,
    required this.images,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      brand: json["brand"],
      category: json["category"],
      price: json["price"],
      description: json["description"],
      thumbnail: json["thumbnail"],
      title: json["title"],
      returnPolicy: json["returnPolicy"],
      shippingInformation: json["shippingInformation"],
      warrantyInformation: json["warrantyInformation"],
      discountPercentage: json["discountPercentage"],
      rating: json["rating"],
      id: json["id"],
      rate: json["rate"],
      stock: json["stock"],
      images: json["images"],
    );
  }
}

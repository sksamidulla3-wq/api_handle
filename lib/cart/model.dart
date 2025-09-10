class CartsModel {
  List<CartsDetailsModel>? carts;
  int? limit;
  int? skip;
  int? total;

  CartsModel({
    required this.carts,
    required this.limit,
    required this.skip,
    required this.total,
  });

  factory CartsModel.fromJson(Map<String, dynamic> json) {
    List<CartsDetailsModel> listCarts = [];
    for (Map<String, dynamic> each in json["carts"]) {
      listCarts.add(CartsDetailsModel.fromJson(each));
    }
    return CartsModel(
      carts: listCarts,
      limit: json["limit"],
      skip: json["skip"],
      total: json["total"],
    );
  }
}

class CartsDetailsModel {
  List<CartsProductModel>? products;
  double? total;
  double? discountedTotal;
  int? userId;
  int? totalProducts;
  int? totalQuantity;

  CartsDetailsModel({
    required this.products,
    required this.total,
    required this.discountedTotal,
    required this.userId,
    required this.totalProducts,
    required this.totalQuantity,
  });

  factory CartsDetailsModel.fromJson(Map<String, dynamic> json) {
    List<CartsProductModel> listProduct = [];
    for (Map<String, dynamic> each in json["products"]) {
      listProduct.add(CartsProductModel.fromJson(each));
    }
    return CartsDetailsModel(
      products: listProduct,
      total: json["total"],
      discountedTotal: json["discountedTotal"],
      userId: json["userId"],
      totalProducts: json["totalProducts"],
      totalQuantity: json["totalQuantity"],
    );
  }
}

class CartsProductModel {
  double? price;
  int? quantity;
  String? title;
  String? thumbnail;
  double? total;
  num? discountPercentage;
  double? discountedTotal;
  int? id;

  CartsProductModel({
    required this.price,
    required this.quantity,
    required this.title,
    required this.thumbnail,
    required this.total,
    required this.discountPercentage,
    required this.discountedTotal,
    required this.id,
  });

  factory CartsProductModel.fromJson(Map<String, dynamic> json) {
    return CartsProductModel(
      price: json["price"],
      quantity: json["quantity"],
      title: json["title"],
      thumbnail: json["thumbnail"],
      total: json["total"],
      discountPercentage: json["discountPercentage"],
      discountedTotal: json["discountedTotal"],
      id: json["id"],
    );
  }
}

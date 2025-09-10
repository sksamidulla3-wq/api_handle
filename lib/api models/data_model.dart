class DataModel {
  int limit;
  int skip;
  int total;
  List<QuotesModel> quotes;

  DataModel({
    required this.limit,
    required this.skip,
    required this.total,
    required this.quotes,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    List<QuotesModel> quotesList =[];

    for (Map<String, dynamic> each in json["quotes"]) {
      var quotesModel = QuotesModel.fromJson(each);
      quotesList.add(quotesModel);
    }
    return DataModel(
      limit: json["limit"],
      skip: json["skip"],
      total: json["total"],
      quotes: quotesList,
    );
  }
}

class QuotesModel {
  int id;
  String quote;
  String author;

  QuotesModel({required this.id, required this.quote, required this.author});

  factory QuotesModel.fromJson(Map<String, dynamic> json) {
    return QuotesModel(
      id: json["id"],
      quote: json["quote"],
      author: json["author"],
    );
  }
}

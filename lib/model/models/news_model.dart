import 'package:api_test/model/models/articles_model.dart';

class NewsModel {
  String? status;
  int? totalResults;
  List<ArticlesModel>? articles;

  NewsModel({this.status, this.totalResults, this.articles});

  NewsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((value) {
        articles!.add(ArticlesModel.fromJson(value));
      });
    }
  }
}

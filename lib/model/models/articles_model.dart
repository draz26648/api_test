class ArticlesModel{
  SourceModel? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  ArticlesModel({this.source, this.author, this.title, this.description, this.url, this.urlToImage, this.publishedAt, this.content});

  ArticlesModel.fromJson(Map<String, dynamic> json) {
    source = json['source'] != null ? SourceModel.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage']??'https://via.placeholder.com/150';
    publishedAt = json['publishedAt'];
    content = json['content'];
  }


}


class SourceModel{
  String? id;
  String? name;

  SourceModel({this.id, this.name});

  SourceModel.fromJson(Map<String, dynamic> json) {
    id = json['id']??'';
    name = json['name']??'';
  }
}
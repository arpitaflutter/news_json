import 'package:news_json/screens/newsScreen/view/news_screen.dart';

class newsModel
{
  String? status;
  int? totalResults;
  List<articleModel>? articleList = [];

  newsModel({this.status,this.totalResults,this.articleList});

  newsModel newsFromJson(Map m1)
  {
    status = m1['status'];
    totalResults = m1['totalResults'];
    List aList = m1['articles'];

    articleList = aList.map((e) => articleModel().artilcleFromJson(e)).toList();

    newsModel n1 = newsModel(articleList: articleList,status: status,totalResults: totalResults);
    return n1;
  }
}

class articleModel {
  String? author, title, description, url, urlToImage, publishedAt, content;
  SourceModel? s1;

  articleModel(
      {this.author,
      this.content,
      this.publishedAt,
      this.urlToImage,
      this.url,
      this.description,
      this.title,
      this.s1});

  articleModel artilcleFromJson(Map m1) {
    author = m1['author'];
    title = m1['title'];
    description = m1['description'];
    url = m1['url'];
    urlToImage = m1['urlToImage'];
    publishedAt = m1['publishedAt'];
    content = m1['content'];
    s1 = SourceModel().sourceFromJson(m1['source']);

    articleModel a1 = articleModel(
        title: title,
        author: author,
        content: content,
        description: description,
        publishedAt: publishedAt,
        s1: s1,
        url: url,
        urlToImage: urlToImage);

    return a1;
  }
}

class SourceModel {
  String? id, name;

  SourceModel({this.id, this.name});

  SourceModel sourceFromJson(Map m1) {
    id = m1['id'];
    name = m1['name'];

    SourceModel s1 = SourceModel(id: id, name: name);

    return s1;
  }
}

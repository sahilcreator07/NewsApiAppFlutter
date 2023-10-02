


import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/content_model.dart';

class TopNewsServices {
  static String baseUrl =
      "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=6362168f13c74fd49249e98844bdd061";

  static Future<List<Article>> getTopNewsArticle() async {
    List<Article> articleList = [];
    var url = Uri.parse(baseUrl);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> articles = jsonDecode(response.body)["articles"];

      for (var article in articles) {
        // print(article);
        // print("====================================");
        articleList.add(Article.fromJson(article));
      }
   
    // print(articleList.length);
    }
    return articleList;
  }
}

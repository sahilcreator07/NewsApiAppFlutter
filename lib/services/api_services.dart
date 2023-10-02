import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/content_model.dart';

class ApiService {
  static String baseUrl =
      "https://newsapi.org/v2/everything?q=apple&from=2023-09-29&to=2023-09-29&sortBy=popularity&apiKey=6362168f13c74fd49249e98844bdd061";

  static Future<List<Article>> getArticle() async {
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

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class WPArticleClient {
  final String url =
      'https://techsmeme.com/index.php/wp-json/wp/v2/posts?_embed';

  Future<List<dynamic>> fetchArticles() async {
    return http.get(Uri.parse(url),
        headers: {'Accept': 'application.json'}).then((http.Response response) {
      if (response.statusCode == 200) {
        final responseContent = jsonDecode(response.body);
        return responseContent;
      } else {
        debugPrint(response.toString());
        throw (response);
      }
    });
  }
}

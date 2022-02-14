import 'package:flutter/material.dart';
import 'package:rest_api_demo/qiita/models/article/article.dart';
import 'package:webview_flutter/webview_flutter.dart';

class QiitaArticleWebPage extends StatelessWidget {
  const QiitaArticleWebPage({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(article.title)),
      body: WebView(
        initialUrl: article.url,
      ),
    );
  }
}

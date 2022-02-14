import 'package:flutter/material.dart';
import 'package:rest_api_demo/word_press/view/components/wp_article_list_view.dart';

class WPArticlesPage extends StatelessWidget {
  const WPArticlesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('WordPress記事一覧')),
      body: const WPArticleListView(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:rest_api_demo/github/view/github_repository_list_page.dart';
import 'package:rest_api_demo/qiita/view/qiita_article_list_page.dart';
import 'package:rest_api_demo/word_press/view/wp_articles_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('REST API demo')),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const QiitaArticleListPage(),
                ),
              ),
              child: const Text('Qiita記事一覧 by Retro fit'),
            ),
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const WPArticlesPage(),
                ),
              ),
              child: const Text('WordPress記事一覧 by http package'),
            ),
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const GithubRepositoryListPage(),
                ),
              ),
              child: const Text('GitHubリポジトリ一覧 with 検索機能'),
            ),
          ],
        ),
      ),
    );
  }
}

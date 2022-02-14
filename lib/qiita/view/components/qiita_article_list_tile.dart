import 'package:flutter/material.dart';
import 'package:rest_api_demo/qiita/models/article/article.dart';
import 'package:rest_api_demo/qiita/view/qiita_article_web_view.dart';

class QiitaArticleListTile extends StatelessWidget {
  const QiitaArticleListTile({Key? key, required this.article})
      : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipOval(
        child: Image.network(
          article.user.profileImageUrl,
          width: 44,
          height: 44,
          errorBuilder: (context, exception, stacktrace) => const Text('Q'),
        ),
      ),
      title: Text(article.title),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QiitaArticleWebPage(article: article),
          ),
        );
      },
    );
  }
}

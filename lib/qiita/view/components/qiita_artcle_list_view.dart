import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rest_api_demo/qiita/models/article/article.dart';
import 'package:rest_api_demo/qiita/view/qiita_article_web_view.dart';
import 'package:rest_api_demo/qiita/view_model/qiita_article_list_model.dart';

class QiitaArticleListView extends ConsumerWidget {
  const QiitaArticleListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _articleList = ref.watch(qiitaArticleListModelProvider);

    return _articleList.isEmpty
        ? const Center(child: Text('記事はありません'))
        : ListView.separated(
            itemBuilder: (context, index) {
              return _articleTile(context, _articleList[index]);
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: _articleList.length,
          );
  }

  Widget _articleTile(BuildContext context, Article article) {
    return ListTile(
      leading: ClipOval(
        child: CachedNetworkImage(
          imageUrl: article.user.profileImageUrl,
          width: 44,
          height: 44,
          errorWidget: (context, url, error) {
            return const CircleAvatar(
              child: Icon(Icons.error),
              backgroundColor: Colors.grey,
            );
          },
        ),
      ),
      title: Text(article.title),
      subtitle: Text(article.user.id),
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

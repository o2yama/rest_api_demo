import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:rest_api_demo/qiita/models/article/article.dart';
import 'package:rest_api_demo/qiita/repository/article_repository.dart';

final qiitaArticleListModelProvider =
    StateNotifierProvider.autoDispose<ArticleListModel, List<Article>>(
  (ref) => ArticleListModel()..fetchArticles(),
);

class ArticleListModel extends StateNotifier<List<Article>> {
  ArticleListModel() : super(<Article>[]);

  Future<void> fetchArticles() async {
    final _repository = GetIt.instance<ArticleRepository>();

    await _repository.fetchArticles().then((result) {
      result.when(
        success: (articles) => state = articles,
        failure: (DioError error) {
          debugPrint(error.message);
          error.response == null ? throw ('インターネット未接続') : throw ('不明のエラー');
        },
      );
    });
  }
}

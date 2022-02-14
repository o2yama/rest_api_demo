import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:rest_api_demo/word_press/client/wp_article_client.dart';
import 'package:rest_api_demo/word_press/models/wp_article/wp_article.dart';

final wpArticleListModelProvider =
    StateNotifierProvider<WPArticleListModel, AsyncValue<List<WPArticle>>>(
  (ref) => WPArticleListModel()..fetchWPArticles(),
);

class WPArticleListModel extends StateNotifier<AsyncValue<List<WPArticle>>> {
  WPArticleListModel() : super(const AsyncValue.loading());

  Future<void> fetchWPArticles() async {
    final _client = GetIt.instance<WPArticleClient>();
    state = const AsyncValue.loading();

    try {
      final jsonList = await _client.fetchArticles();
      final articles =
          jsonList.map((json) => WPArticle.fromJson(json)).toList();
      state = AsyncValue.data(articles);
    } on Exception catch (e) {
      state = AsyncValue.error(e);
    }
  }
}

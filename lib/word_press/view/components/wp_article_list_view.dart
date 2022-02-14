import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rest_api_demo/word_press/view/components/wp_article_list_tile.dart';
import 'package:rest_api_demo/word_press/view_model/wp_article_list_model.dart';

class WPArticleListView extends ConsumerWidget {
  const WPArticleListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _articlesState = ref.watch(wpArticleListModelProvider);

    if (_articlesState is AsyncLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (_articlesState is AsyncError) {
      return Center(
        child: Text((_articlesState as AsyncError).error.toString()),
      );
    } else {
      return ListView.separated(
        itemBuilder: (context, index) {
          return WPArticleListTile(wpArticle: _articlesState.value![index]);
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemCount: _articlesState.value?.length ?? 0,
      );
    }
  }
}

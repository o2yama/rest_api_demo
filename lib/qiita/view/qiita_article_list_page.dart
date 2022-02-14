import 'package:flutter/material.dart';
import 'package:rest_api_demo/qiita/view/components/qiita_artcle_list_view.dart';

class QiitaArticleListPage extends StatelessWidget {
  const QiitaArticleListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Qiita記事一覧')),
      body: const QiitaArticleListView(),
    );
  }
}

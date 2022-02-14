import 'package:get_it/get_it.dart';
import 'package:rest_api_demo/qiita/client/qiita_api_client.dart';
import 'package:rest_api_demo/qiita/models/article/article.dart';
import 'package:rest_api_demo/qiita/models/result/result.dart';

abstract class ArticleRepositoryBase {
  Future<Result<List<Article>>> fetchArticles();
}

class ArticleRepository extends ArticleRepositoryBase {
  @override
  Future<Result<List<Article>>> fetchArticles() async {
    final _client = GetIt.instance<QiitaApiClient>();
    return _client
        .fetchArticles()
        .then((articles) => Result.success(articles))
        .catchError((error) => Result<List<Article>>.failure(error));
  }
}

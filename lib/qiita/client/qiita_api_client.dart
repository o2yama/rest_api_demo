import 'package:dio/dio.dart';
import 'package:rest_api_demo/qiita/models/article/article.dart';
import 'package:retrofit/retrofit.dart';

part 'qiita_api_client.g.dart';

@RestApi(baseUrl: 'https://qiita.com/api/v2')
abstract class QiitaApiClient {
  factory QiitaApiClient(Dio dio, {String baseUrl}) = _QiitaApiClient;

  @GET('/items')
  Future<List<Article>> fetchArticles();
}

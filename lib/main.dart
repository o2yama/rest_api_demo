import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:rest_api_demo/home_page.dart';
import 'package:rest_api_demo/qiita/client/qiita_api_client.dart';
import 'package:rest_api_demo/qiita/repository/article_repository.dart';
import 'package:rest_api_demo/word_press/client/wp_article_client.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

final getIt = GetIt.instance;
void setup() {
  getIt.registerSingleton<QiitaApiClient>(QiitaApiClient(Dio()));
  getIt.registerSingleton<ArticleRepository>(ArticleRepository());
  getIt.registerSingleton<WPArticleClient>(WPArticleClient());
}

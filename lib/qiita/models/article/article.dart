import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rest_api_demo/qiita/models/user/user.dart';

part 'article.freezed.dart';
part 'article.g.dart';

@freezed
abstract class Article with _$Article {
  const factory Article({
    @Default('') String id,
    @Default('') String title,
    @Default('') String url,
    @Default(User()) User user,
  }) = _Article;

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
}

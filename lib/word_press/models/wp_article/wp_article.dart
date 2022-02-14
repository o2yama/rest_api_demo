import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class WPArticle {
  WPArticle(
    this.title,
    this.content,
    this.date,
    this.image,
    this.category,
    this.link,
  );

  String title;
  String content;
  String date;
  String image;
  String category;
  String link;

  factory WPArticle.fromJson(Map<String, dynamic> json) {
    return WPArticle(
      json['title']['rendered'] as String,
      removeHtmlTag(json['content']['rendered'] as String),
      changeDateFormat(json['date'] as String),
      judgeImageUrl(json),
      judgeCategory(json),
      json['link'],
    );
  }
}

//HTMLタグ排除
String removeHtmlTag(String htmlText) {
  final RegExp exp = RegExp(r'<[^>]*>', multiLine: true, caseSensitive: true);

  return htmlText.replaceAll(exp, '');
}

//年月表示
String changeDateFormat(String date) {
  initializeDateFormatting('ja_JP');
  // StringからDate
  final DateTime datetime = DateTime.parse(date);

  final DateFormat formatter = DateFormat('yyyy年MM月dd日', 'ja_JP');
  // DateからString
  final String formatted = formatter.format(datetime);
  return formatted;
}

//アイキャッチがあるか判定
String judgeImageUrl(Map<String, dynamic> article) {
  if (article['_embedded']['wp:featuredmedia'] != null) {
    return article['_embedded']['wp:featuredmedia'][0]['media_details']['sizes']
        ['full']['source_url'] as String;
  } else {
    return '';
  }
}

//カテゴリーがあるか判定
String judgeCategory(Map<String, dynamic> article) {
  if (article['_embedded']['wp:term'] != null) {
    return article['_embedded']['wp:term'][0][0]['name'] as String;
  } else {
    return '';
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rest_api_demo/word_press/models/wp_article/wp_article.dart';
import 'package:url_launcher/url_launcher.dart';

class WPArticleListTile extends StatelessWidget {
  const WPArticleListTile({Key? key, required this.wpArticle})
      : super(key: key);

  final WPArticle wpArticle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () async => onArticleTileTapped(wpArticle),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueGrey),
          ),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  categoryBtn(wpArticle.category),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  wpArticle.title,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Text(wpArticle.date, textAlign: TextAlign.left),
              ),
              articleImage(wpArticle.image),
            ],
          ),
        ),
      ),
    );
  }
}

Widget categoryBtn(String category) {
  return category != ''
      ? Container(
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(50.0),
          ),
          padding: const EdgeInsets.fromLTRB(4, 2, 4, 2),
          child: Text(
            category,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        )
      : Container();
}

Widget articleImage(String imageUrl) {
  return imageUrl != ''
      ? CachedNetworkImage(
          imageUrl: imageUrl,
          placeholder: (BuildContext context, String url) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (BuildContext context, String url, dynamic error) =>
              Center(child: Text(error.toString())),
        )
      : const Center(child: Text('no image'));
}

Future<void> onArticleTileTapped(WPArticle article) async {
  if (await canLaunch(article.link)) {
    await launch(article.link);
  } else {
    throw 'Could not launch ${article.link}';
  }
}

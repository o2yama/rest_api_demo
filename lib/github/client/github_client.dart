import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rest_api_demo/github/models/github_repository.dart';
import 'package:http/http.dart' as http;

final githubClientProvider = Provider.autoDispose((ref) => GithubClient());

class GithubClient {
  Future<List<GithubRepository>> searchRepositories(String searchWord) async {
    final response = await http.get(
      Uri.parse(
        'https://api.github.com/search/repositories?q=$searchWord&sort=stars&order=desc',
      ),
    );

    if (response.statusCode == 200) {
      List<GithubRepository> list = [];
      Map<String, dynamic> jsonContent = json.decode(response.body);
      for (var json in jsonContent['items']) {
        list.add(GithubRepository.fromJson(json));
      }

      return list;
    } else {
      debugPrint(response.toString());
      throw Exception('Fail to search repository');
    }
  }
}

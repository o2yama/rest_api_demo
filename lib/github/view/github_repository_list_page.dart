import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rest_api_demo/github/view/components/repository_list_view.dart';
import 'package:rest_api_demo/github/view/repository_list_view_model.dart';

final _searchController = TextEditingController();

class GithubRepositoryListPage extends ConsumerWidget {
  const GithubRepositoryListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('GitHub リポジトリ一覧')),
      body: GestureDetector(
        onTap: () {
          ref
              .watch(repositoryListViewModelProvider.notifier)
              .searchRepositories(_searchController.text);
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              _searchField(),
              const RepositoryListView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchField() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Consumer(
        builder: (context, ref, child) {
          return TextField(
            controller: _searchController,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Please enter a search repository name.',
              labelText: "search",
            ),
            onSubmitted: (inputString) {
              ref
                  .watch(repositoryListViewModelProvider.notifier)
                  .searchRepositories(inputString);
            },
          );
        },
      ),
    );
  }
}

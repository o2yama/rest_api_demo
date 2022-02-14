import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rest_api_demo/github/client/github_client.dart';
import 'package:rest_api_demo/github/models/github_repository.dart';

final repositoryListViewModelProvider = StateNotifierProvider.autoDispose<
    RepositoryListViewModel, AsyncValue<List<GithubRepository>>>(
  (ref) => RepositoryListViewModel(client: ref.watch(githubClientProvider)),
);

class RepositoryListViewModel
    extends StateNotifier<AsyncValue<List<GithubRepository>>> {
  RepositoryListViewModel({required this.client}) : super(const AsyncData([]));

  final GithubClient client;

  Future<void> searchRepositories(String word) async {
    state = const AsyncLoading();

    try {
      final result = await client.searchRepositories(word);
      state = AsyncData(result);
    } on Exception catch (e) {
      state = AsyncError(e);
    }
  }
}

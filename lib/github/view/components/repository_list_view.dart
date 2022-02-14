import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rest_api_demo/github/view/repository_list_view_model.dart';
import 'package:url_launcher/url_launcher.dart';

class RepositoryListView extends ConsumerWidget {
  const RepositoryListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _repositoriesState = ref.watch(repositoryListViewModelProvider);

    if (_repositoriesState is AsyncLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (_repositoriesState is AsyncError) {
      return Center(
        child: Text((_repositoriesState as AsyncError).error.toString()),
      );
    } else {
      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _repositoriesState.value!.length,
        itemBuilder: (context, index) {
          final repository = _repositoriesState.value![index];

          return GestureDetector(
            onTap: () async {
              await launch(repository.htmlUrl);
            },
            child: Card(
              margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      repository.fullName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  repository.language == null
                      ? Container()
                      : Padding(
                          padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                          child: Text(
                            repository.language!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                  repository.description == null
                      ? Container()
                      : Padding(
                          padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                          child: Text(
                            repository.description!,
                            style: const TextStyle(
                              fontWeight: FontWeight.w200,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      const Icon(Icons.star),
                      SizedBox(
                        width: 50.0,
                        child: Text(repository.stargazersCount.toString()),
                      ),
                      const Icon(Icons.remove_red_eye),
                      SizedBox(
                        width: 50.0,
                        child: Text(repository.watchersCount.toString()),
                      ),
                      const Text("Fork:"),
                      SizedBox(
                        width: 50,
                        child: Text(repository.forksCount.toString()),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16)
                ],
              ),
            ),
          );
        },
      );
    }
  }
}

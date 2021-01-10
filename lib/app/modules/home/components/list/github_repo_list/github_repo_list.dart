import 'package:flutter/material.dart';
import 'package:flutter_github_repositories/app/modules/home/components/list/github_repo_list/item_list_github_repo.dart';
import 'package:flutter_github_repositories/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class GitHubRepoList extends StatelessWidget {
  final HomeController controller = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: Key('list'),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: this.controller.gitHubRepositories.length,
      itemBuilder: (BuildContext context, int i) {
        return ItemListGitHubRepo(
          gitHubRepo: this.controller.gitHubRepositories[i],
          onPress: this.controller.openRepository,
        );
      },
    );
  }
}

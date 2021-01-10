import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:flutter_github_repositories/app/modules/home/infra/repositories/github_repository_interface.dart';
import 'package:flutter_github_repositories/app/modules/home/models/github_repo.dart';
import 'package:flutter_github_repositories/app/shared/errors/errors.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:url_launcher/url_launcher.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  IGitHubRepository gitHubRepository;

  _HomeControllerBase({this.gitHubRepository}) {
    this.loadGitHubRepositories(false);
  }

  @observable
  bool loading = false;

  @observable
  FailureGitHub warning;

  @observable
  ObservableList<GitHubRepo> gitHubRepositories = <GitHubRepo>[].asObservable();

  @action
  void setGitHubRepositories(List<GitHubRepo> list) =>
      this.gitHubRepositories = list.asObservable();

  //Caso refreshing seja true, não irá alterar a variável loading, pois ela é a flag para exibição do shimmer effect, e com pull to refresh isso não faz sentido
  @action
  Future<void> loadGitHubRepositories(bool refreshing) async {
    this.warning = GitHubRepoError();
    if (!refreshing) this.loading = true;

    Either<FailureGitHub, List<GitHubRepo>> res =
        await this.gitHubRepository.getGitHubRepositories();

    if (res.isRight()) {
      //this.warning = null;
      this.gitHubRepositories = res.getOrElse(() => null).asObservable();
    } else {
      this.warning = res.fold(id, null);
      this.gitHubRepositories = [].asObservable();
    }

    this.loading = false;
  }

  Future<void> openRepository(GitHubRepo gitHubRepo) async {
    final String url = gitHubRepo.htmlUrl;

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

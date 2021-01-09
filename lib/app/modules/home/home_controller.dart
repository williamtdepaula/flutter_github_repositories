import 'package:dartz/dartz.dart';
import 'package:flutter_github_repositories/app/modules/home/infra/repositories/github_repository_interface.dart';
import 'package:flutter_github_repositories/app/modules/home/models/github_repo.dart';
import 'package:flutter_github_repositories/app/shared/errors/errors.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  IGitHubRepository gitHubRepository;

  _HomeControllerBase({this.gitHubRepository}) {
    //this.loadGitHubRepositories();
  }

  @observable
  bool loading = false;

  @observable
  FailureGitHub warning;

  @observable
  ObservableList<GitHubRepo> gitHubRepositories = <GitHubRepo>[].asObservable();

  @action
  Future<void> loadGitHubRepositories() async {
    this.loading = true;

    Either<FailureGitHub, List<GitHubRepo>> res =
        await this.gitHubRepository.getGitHubRepositories();

    if (res.isRight()) {
      this.warning = null;
      this.gitHubRepositories = res.getOrElse(() => null).asObservable();
    } else {
      this.warning = res.fold(id, null);
      this.gitHubRepositories = [].asObservable();
    }

    this.loading = false;
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HomeController = BindInject(
  (i) => HomeController(gitHubRepository: i<IGitHubRepository>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$loadingAtom = Atom(name: '_HomeControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$warningAtom = Atom(name: '_HomeControllerBase.warning');

  @override
  FailureGitHub get warning {
    _$warningAtom.reportRead();
    return super.warning;
  }

  @override
  set warning(FailureGitHub value) {
    _$warningAtom.reportWrite(value, super.warning, () {
      super.warning = value;
    });
  }

  final _$gitHubRepositoriesAtom =
      Atom(name: '_HomeControllerBase.gitHubRepositories');

  @override
  ObservableList<GitHubRepo> get gitHubRepositories {
    _$gitHubRepositoriesAtom.reportRead();
    return super.gitHubRepositories;
  }

  @override
  set gitHubRepositories(ObservableList<GitHubRepo> value) {
    _$gitHubRepositoriesAtom.reportWrite(value, super.gitHubRepositories, () {
      super.gitHubRepositories = value;
    });
  }

  final _$loadGitHubRepositoriesAsyncAction =
      AsyncAction('_HomeControllerBase.loadGitHubRepositories');

  @override
  Future<void> loadGitHubRepositories() {
    return _$loadGitHubRepositoriesAsyncAction
        .run(() => super.loadGitHubRepositories());
  }

  @override
  String toString() {
    return '''
loading: ${loading},
warning: ${warning},
gitHubRepositories: ${gitHubRepositories}
    ''';
  }
}

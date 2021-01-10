import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_github_repositories/app/modules/home/infra/datasource/github_datasource_interface.dart';
import 'package:flutter_github_repositories/app/modules/home/infra/repositories/github_repository.dart';
import 'package:flutter_github_repositories/app/shared/errors/errors.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_github_repositories/app/modules/home/home_controller.dart';
import 'package:flutter_github_repositories/app/modules/home/home_module.dart';
import 'package:mockito/mockito.dart';

class GitHubDatasourceMock extends Mock implements IGitHubDatasource {}

void main() {
  GitHubDatasourceMock gitHubDatasourceMock = new GitHubDatasourceMock();
  GitHubRepository gitHubRepository =
      new GitHubRepository(gitHubDataSource: gitHubDatasourceMock);

  initModule(HomeModule(), changeBinds: [
    Bind<HomeController>(
      (i) => HomeController(gitHubRepository: gitHubRepository),
    ),
  ]);

  HomeController homeController = Modular.get<HomeController>();

  test('Load list repositories', () async {
    when(gitHubDatasourceMock.getGitHubRepositories()).thenAnswer(
      (_) async => Response(
        statusCode: 200,
        data: jsonDecode(
          '[{"name": "repositório", "html_url": "linkrepo.com", "owner": { "login": "william", "avatar_url": "link.com" }}]',
        ),
      ),
    );

    await homeController.loadGitHubRepositories(false);

    expect(homeController.gitHubRepositories.isNotEmpty, true);
    expect(homeController.warning == null, true);
  });

  test(
      'Change the warning variable and make the gitHubRepositories variable empty when the repository returns an exception',
      () async {
    when(gitHubDatasourceMock.getGitHubRepositories()).thenThrow(
      (_) async => Exception(),
    );

    await homeController.loadGitHubRepositories(false);

    expect(homeController.gitHubRepositories.isEmpty, true);
    expect(homeController.warning != null, true);
  });
}

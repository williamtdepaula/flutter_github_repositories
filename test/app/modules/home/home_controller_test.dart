import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_github_repositories/app/modules/home/infra/datasource/github_datasource_interface.dart';
import 'package:flutter_github_repositories/app/modules/home/infra/repositories/github_repository.dart';
import 'package:flutter_github_repositories/app/shared/errors/errors.dart';
import 'package:flutter_github_repositories/app/shared/utils/network/network_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_github_repositories/app/modules/home/home_controller.dart';
import 'package:flutter_github_repositories/app/modules/home/home_module.dart';
import 'package:mockito/mockito.dart';

import '../../datamock/github_repositories_api_mock/github_repositories_api_mock.dart';

class GitHubDatasourceMock extends Mock implements IGitHubDatasource {}

class NetworkMock extends Mock implements INetwork {}

void main() {
  NetworkMock networkMock = new NetworkMock();
  GitHubDatasourceMock gitHubDatasourceMock = new GitHubDatasourceMock();
  GitHubRepository gitHubRepository = new GitHubRepository(
      gitHubDataSource: gitHubDatasourceMock, network: networkMock);

  initModule(HomeModule(), changeBinds: [
    Bind<HomeController>(
      (i) => HomeController(
          gitHubRepository: gitHubRepository, network: networkMock),
    ),
  ]);

  HomeController homeController = Modular.get<HomeController>();

  test('Should load the list of repositories', () async {
    when(gitHubDatasourceMock.getGitHubRepositories()).thenAnswer(
      (_) async => gitHubRepositoriesListApiResponse,
    );

    when(networkMock.isConnected()).thenAnswer((_) async => true);

    await homeController.loadGitHubRepositories(false);

    expect(homeController.gitHubRepositories.isNotEmpty, true);
    expect(homeController.warning == null, true);
  });

  test(
      'Should change the warning variable and make the gitHubRepositories variable empty when the repository returns an exception',
      () async {
    when(gitHubDatasourceMock.getGitHubRepositories()).thenThrow(
      (_) async => Exception(),
    );

    when(networkMock.isConnected()).thenAnswer((_) async => true);

    await homeController.loadGitHubRepositories(false);

    expect(homeController.gitHubRepositories.isEmpty, true);
    expect(homeController.warning != null, true);
  });

  test(
      'Should change the warning variable and make the gitHubRepositories variable empty when make request and app is without connection with internet',
      () async {
    when(gitHubDatasourceMock.getGitHubRepositories()).thenAnswer(
      (_) async => gitHubRepositoriesListApiResponse,
    );

    when(networkMock.isConnected()).thenAnswer((_) async => false);

    await homeController.loadGitHubRepositories(false);

    expect(homeController.gitHubRepositories.isEmpty, true);
    expect(homeController.warning is ConnectionError, true);
  });
}

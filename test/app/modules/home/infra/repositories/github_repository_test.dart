import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_github_repositories/app/modules/home/infra/datasource/github_datasource_interface.dart';
import 'package:flutter_github_repositories/app/modules/home/infra/repositories/github_repository.dart';
import 'package:flutter_github_repositories/app/modules/home/models/github_repo.dart';
import 'package:flutter_github_repositories/app/shared/errors/errors.dart';
import 'package:flutter_github_repositories/app/shared/utils/network/network_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../datamock/github_repositories_api_mock/github_repositories_api_mock.dart';

class GitHubDatasourceMock extends Mock implements IGitHubDatasource {}

class NetworkMock extends Mock implements INetwork {}

main() {
  GitHubDatasourceMock gitHubDatasourceMock = new GitHubDatasourceMock();
  NetworkMock networkMock = new NetworkMock();
  GitHubRepository gitHubRepository = new GitHubRepository(
      gitHubDataSource: gitHubDatasourceMock, network: networkMock);

  group('API GitHub repositories', () {
    test('Should return a list of repositories from github', () async {
      when(gitHubDatasourceMock.getGitHubRepositories()).thenAnswer(
        (_) async => gitHubRepositoriesListApiResponse,
      );

      when(networkMock.isConnected()).thenAnswer((_) async => true);

      final result = await gitHubRepository.getGitHubRepositories();

      expect(result.fold(id, id), isA<List<GitHubRepo>>());
    });

    test(
        'Should return a error when the status code from request is different from 200',
        () async {
      when(gitHubDatasourceMock.getGitHubRepositories()).thenAnswer(
        (_) async => Response(
          statusCode: 304,
          data: jsonDecode(''),
        ),
      );

      when(networkMock.isConnected()).thenAnswer((_) async => true);

      final result = await gitHubRepository.getGitHubRepositories();

      expect(result.fold(id, id), isA<GitHubRepoError>());
    });

    test('Should return a error when a exception occurs', () async {
      when(gitHubDatasourceMock.getGitHubRepositories()).thenThrow(
        (_) async => Exception(),
      );

      when(networkMock.isConnected()).thenAnswer((_) async => true);

      final result = await gitHubRepository.getGitHubRepositories();

      expect(result.fold(id, id), isA<GitHubRepoError>());
    });

    test('Should return a ConnectionError when app dont have connection',
        () async {
      when(gitHubDatasourceMock.getGitHubRepositories()).thenThrow(
        (_) async => Exception(),
      );

      when(networkMock.isConnected()).thenAnswer((_) async => false);

      final result = await gitHubRepository.getGitHubRepositories();

      expect(result.fold(id, id), isA<ConnectionError>());
    });
  });
}

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_github_repositories/app/modules/home/infra/datasource/github_datasource_interface.dart';
import 'package:flutter_github_repositories/app/modules/home/infra/repositories/github_repository.dart';
import 'package:flutter_github_repositories/app/modules/home/models/github_repo.dart';
import 'package:flutter_github_repositories/app/shared/errors/errors.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class GitHubDatasourceMock extends Mock implements IGitHubDatasource {}

main() {
  GitHubDatasourceMock gitHubDatasourceMock = new GitHubDatasourceMock();
  GitHubRepository gitHubRepository =
      new GitHubRepository(gitHubDataSource: gitHubDatasourceMock);

  group('API GitHub repositories', () {
    test('return a list of repositories from github', () async {
      when(gitHubDatasourceMock.getGitHubRepositories()).thenAnswer(
        (_) async => Response(
          data: jsonDecode(
              '[{"name": "repositório", "html_url": "linkrepo.com", "owner": { "login": "william", "avatar_url": "link.com" }}]'),
          statusCode: 200,
        ),
      );

      final result = await gitHubRepository.getGitHubRepositories();

      expect(result.fold(id, id), isA<List<GitHubRepo>>());
    });

    test(
        'return a error when the status code from request is different from 200',
        () async {
      when(gitHubDatasourceMock.getGitHubRepositories()).thenAnswer(
        (_) async => Response(
          data: jsonDecode(''),
          statusCode: 304,
        ),
      );

      final result = await gitHubRepository.getGitHubRepositories();

      expect(result.fold(id, id), isA<GitHubRepoError>());
    });

    test('return a error when a exception occurs', () async {
      when(gitHubDatasourceMock.getGitHubRepositories()).thenThrow(
        (_) async => Exception(),
      );

      final result = await gitHubRepository.getGitHubRepositories();

      expect(result.fold(id, id), isA<GitHubRepoError>());
    });
  });
}

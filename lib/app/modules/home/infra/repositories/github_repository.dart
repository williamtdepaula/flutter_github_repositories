import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_github_repositories/app/modules/home/infra/datasource/github_datasource_interface.dart';
import 'package:flutter_github_repositories/app/modules/home/infra/repositories/github_repository_interface.dart';
import 'package:flutter_github_repositories/app/modules/home/models/github_repo.dart';
import 'package:flutter_github_repositories/app/modules/home/models/owner.dart';
import 'package:flutter_github_repositories/app/shared/errors/errors.dart';

class GitHubRepository implements IGitHubRepository {
  IGitHubDatasource gitHubDataSource;

  GitHubRepository({this.gitHubDataSource});

  @override
  Future<Either<FailureGitHub, List<GitHubRepo>>>
      getGitHubRepositories() async {
    try {
      Response resRepositories = await gitHubDataSource.getGitHubRepositories();
      print('testeee ${resRepositories.statusCode}');

      if (resRepositories.statusCode == 200) {
        List<GitHubRepo> gitHubRepositories = [];

        resRepositories.data.forEach((value) {
          Owner ownerRepo = new Owner(
              login: value['owner']['login'],
              avatarUrl: value['owner']['avatar_url']);

          GitHubRepo gitHubRepo = new GitHubRepo(
            name: value['name'],
            htmlUrl: value['html_url'],
            owner: ownerRepo,
          );

          gitHubRepositories.add(gitHubRepo);
        });

        return Right(gitHubRepositories);
      } else {
        return Left(GitHubRepoError());
      }
    } catch (e) {
      print('im here');
      return Left(GitHubRepoError());
    }
  }
}

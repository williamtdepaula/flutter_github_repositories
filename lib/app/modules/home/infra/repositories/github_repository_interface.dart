import 'package:dartz/dartz.dart';
import 'package:flutter_github_repositories/app/modules/home/models/github_repo.dart';
import 'package:flutter_github_repositories/app/shared/errors/errors.dart';

abstract class IGitHubRepository {
  Future<Either<FailureGitHub, List<GitHubRepo>>> getGitHubRepositories();
}

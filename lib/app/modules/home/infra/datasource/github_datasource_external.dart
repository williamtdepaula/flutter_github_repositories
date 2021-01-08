import 'package:dio/dio.dart';
import 'package:flutter_github_repositories/app/modules/home/infra/datasource/github_datasource_interface.dart';

class GitHubDataSource implements IGitHubDatasource {
  Dio dio;

  GitHubDataSource({this.dio});

  @override
  Future<Response> getGitHubRepositories() async {
    Response res = await dio.get('/repositories');

    return res;
  }
}

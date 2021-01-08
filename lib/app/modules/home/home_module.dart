import 'package:dio/dio.dart';
import 'package:flutter_github_repositories/app/modules/home/infra/datasource/github_datasource_external.dart';
import 'package:flutter_github_repositories/app/modules/home/infra/repositories/github_repository.dart';

import 'home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => GitHubRepository(
            gitHubDataSource: GitHubDataSource(dio: i.get<Dio>()),
          ),
        ),
        Bind<HomeController>(
            (i) => HomeController(gitHubRepository: i.get<GitHubRepository>()))
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}

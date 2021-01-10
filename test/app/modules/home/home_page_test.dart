import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github_repositories/app/modules/home/home_controller.dart';
import 'package:flutter_github_repositories/app/modules/home/home_module.dart';
import 'package:flutter_github_repositories/app/modules/home/infra/datasource/github_datasource_interface.dart';
import 'package:flutter_github_repositories/app/modules/home/infra/repositories/github_repository.dart';
import 'package:flutter_github_repositories/app/modules/home/models/github_repo.dart';
import 'package:flutter_github_repositories/app/modules/home/models/owner.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:flutter_github_repositories/app/modules/home/home_page.dart';
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

  testWidgets('HomePage show one item on list', (tester) async {
    /*when(gitHubDatasourceMock.getGitHubRepositories()).thenAnswer(
      (_) async => Response(
        statusCode: 200,
        data: jsonDecode(
          '[{"name": "repositório", "html_url": "linkrepo.com", "owner": { "login": "william", "avatar_url": "link.com" }}]',
        ),
      ),
    );

    final listWidget = find.byKey(ValueKey('list'));*/

    await tester.pumpWidget(HomePage());

    homeController.setGitHubRepositories(
      [
        GitHubRepo(
          htmlUrl: 'teste.com',
          name: 'teste',
          owner: new Owner(avatarUrl: 'url.com', login: 'testeA'),
        )
      ],
    );

    await tester.pump();

    print('123 ${find.text("aavasdfas213213")}');

    expect(find.text("william123123123123213123213213123312312313"),
        findsOneWidget);

    //  await tester.pumpWidget(buildTestableWidget(HomePage(title: 'Home')));
    //  final titleFinder = find.text('Home');
    //  expect(titleFinder, findsOneWidget);
  });
}

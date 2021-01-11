import 'package:dio/dio.dart';
import 'package:flutter_github_repositories/app/shared/utils/constants.dart';
import 'package:flutter_github_repositories/app/shared/utils/network/network.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github_repositories/app/app_widget.dart';
import 'package:flutter_github_repositories/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => Dio(
            BaseOptions(baseUrl: BASE_URL),
          ),
        ),
        Bind((i) => Network()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}

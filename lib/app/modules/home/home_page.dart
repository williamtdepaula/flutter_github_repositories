import 'package:flutter/material.dart';
import 'package:flutter_github_repositories/app/modules/home/components/list/github_repo_list/github_repo_list.dart';
import 'package:flutter_github_repositories/app/modules/home/components/shimmer/shimmer_effect_repositories.dart';
import 'package:flutter_github_repositories/app/modules/home/components/warning/warning_default.dart';
import 'package:flutter_github_repositories/app/modules/home/components/welcome/welcome.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _handlerRenderBody(),
    );
  }

  Widget _handlerRenderBody() {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () => this.controller.loadGitHubRepositories(true),
        child: Observer(
          builder: (_) => Center(
            child: this.controller.warning != null
                ? WarningDefault(
                    text: this.controller.warning.message,
                    imageWarning: Image.asset(
                      this.controller.warning.pathImage,
                    ),
                    onPress: () =>
                        this.controller.loadGitHubRepositories(false),
                  )
                : SingleChildScrollView(
                    key: Key('scroll'),
                    child: Stack(
                      children: <Widget>[
                        _handlerRenderBackground(),
                        _handlerRenderListRepositories(),
                        Welcome(),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  Widget _handlerRenderBackground() {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      color: Color(0xFF4D45B3),
    );
  }

  Widget _handlerRenderListRepositories() {
    return Container(
      padding: EdgeInsets.only(top: 50),
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.15,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Observer(
        builder: (_) => this.controller.loading
            ? ShimmerEffectRepositories()
            : GitHubRepoList(),
      ),
    );
  }
}

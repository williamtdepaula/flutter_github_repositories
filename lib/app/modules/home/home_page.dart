import 'package:flutter/material.dart';
import 'package:flutter_github_repositories/app/modules/home/components/welcome.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

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
      child: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            _handlerRenderListRepositories(),
            Welcome(),
          ],
        ),
      ),
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
    );
  }
}

import 'package:flutter_github_repositories/app/modules/home/models/owner.dart';

class GitHubRepo {
  String name;
  String htmlUrl;
  Owner owner;

  GitHubRepo({this.name, this.htmlUrl, this.owner});

  //Para evitar que na view fique muito extenso para selecionar a propriedade
  get getOwnerName => this.owner.login;

  get getOwnerAvatarUrl => this.owner.avatarUrl;
}

import 'package:flutter_github_repositories/app/modules/home/models/owner.dart';

class GitHubRepo {
  String name;
  String htmlUrl;
  Owner owner;

  GitHubRepo({this.name, this.htmlUrl, this.owner});
}

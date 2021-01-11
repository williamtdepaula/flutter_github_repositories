import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github_repositories/app/modules/home/models/github_repo.dart';

class ItemListGitHubRepo extends StatelessWidget {
  final GitHubRepo gitHubRepo;
  final Function onPress;

  ItemListGitHubRepo({@required this.gitHubRepo, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Color(0xFFF5F5F5),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: ListTile(
        onTap: () => this.onPress(this.gitHubRepo),
        leading: Container(
          width: 60,
          height: 60,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: CachedNetworkImage(
              imageUrl: this.gitHubRepo.getOwnerAvatarUrl,
              placeholder: (BuildContext context, String url) {
                return Container(
                  color: Colors.white,
                );
              },
            ),
          ),
        ),
        title: Text(
          this.gitHubRepo.name,
          style: TextStyle(
            color: Color(0xFF4D45B3),
            fontWeight: FontWeight.bold,
            fontSize: 22.0,
          ),
        ),
        subtitle: Text(
          this.gitHubRepo.getOwnerName,
          style: TextStyle(
            color: Colors.black45,
            fontWeight: FontWeight.w400,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}

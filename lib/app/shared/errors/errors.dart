import 'package:flutter_github_repositories/app/shared/utils/constants.dart';

abstract class FailureGitHub implements Exception {
  String message;
  String pathImage;
}

class GitHubRepoError implements FailureGitHub {
  @override
  String message = 'Houve um problema, tente novamente!';

  @override
  String pathImage = '$BASE_IMAGES_ASSETS_PATH/warning.png';
}

class ConnectionError implements FailureGitHub {
  @override
  String message = 'Você não está conectado com a internet';

  @override
  String pathImage = '$BASE_IMAGES_ASSETS_PATH/connection.png';
}

import 'dart:convert';

import 'package:dio/dio.dart';

final Response gitHubRepositoriesListApiResponse = Response(
  statusCode: 200,
  data: jsonDecode(
    '[{"name": "repositório", "html_url": "linkrepo.com", "owner": { "login": "william", "avatar_url": "link.com" }}]',
  ),
);

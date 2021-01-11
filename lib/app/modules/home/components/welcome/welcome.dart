import 'package:flutter/material.dart';
import 'package:flutter_github_repositories/app/shared/utils/constants.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key('welcomeContainer'),
      margin: EdgeInsets.all(25.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            offset: Offset(0.0, 1.0),
            blurRadius: 10.0,
          ),
        ],
      ),
      padding: EdgeInsets.all(4.0),
      child: Row(
        children: [
          Expanded(
            child: Image.asset(
              '$BASE_IMAGES_ASSETS_PATH/development.png',
              fit: BoxFit.contain,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Ei! Dê uma olhada!',
                  style: TextStyle(
                    color: Color(0xFF6161A1),
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'Você pode encontrar uns projetos bem legais aqui.',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

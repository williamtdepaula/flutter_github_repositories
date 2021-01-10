import 'package:flutter/material.dart';
import 'package:flutter_github_repositories/app/modules/home/components/button/button_default.dart';

class WarningDefault extends StatelessWidget {
  final String text;
  final Image imageWarning;
  final Function onPress;

  WarningDefault({@required this.text, this.imageWarning, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Column(
      key: Key('warning'),
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          this.text,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        Image(
          image: this.imageWarning.image,
          height: 200,
          width: 200,
          fit: this.imageWarning.fit,
        ),
        ButtonDefault(
          key: Key('buttonWarning'),
          text: 'Tentar novamente',
          onPress: this.onPress,
        ),
      ],
    );
  }
}

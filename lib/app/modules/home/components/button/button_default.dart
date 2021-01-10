import 'package:flutter/material.dart';

class ButtonDefault extends StatelessWidget {
  final String text;
  final Function onPress;
  final Key key;

  ButtonDefault({@required this.text, @required this.onPress, this.key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      child: RawMaterialButton(
        padding: EdgeInsets.all(10.0),
        fillColor: Color(0xFF4D45B3),
        onPressed: this.onPress,
        child: Center(
          child: Text(
            this.text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

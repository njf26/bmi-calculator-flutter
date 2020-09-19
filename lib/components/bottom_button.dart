import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  final String text;
  final Function tapped;

  const BottomButton({@required this.text, @required this.tapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapped,
      child: Container(
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
        padding: EdgeInsets.only(bottom: 10.0),
        child: Center(
          child: Text(
            text,
            style: kPinkButtonText,
          ),
        ),
      ),
    );
  }
}

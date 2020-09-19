import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  //removed automatic constructor with key
  //made my own constructor
  //stateless widgets are immutable, variables must be final

  ReusableCard({@required this.colour, this.cardChild, this.onPress});

  final Color colour;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        child: cardChild,
        onTap: onPress,
      ),
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}

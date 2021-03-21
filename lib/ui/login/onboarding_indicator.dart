import 'package:flutter/material.dart';
import 'package:waz3ly/global.dart';

class Indicator extends StatelessWidget {
  final int positionIndex, currentIndex;
  const Indicator({this.currentIndex, this.positionIndex});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
          color:
              positionIndex == currentIndex ? ForegroundColor : Colors.black54,
          borderRadius: BorderRadius.circular(150)),
    );
  }
}

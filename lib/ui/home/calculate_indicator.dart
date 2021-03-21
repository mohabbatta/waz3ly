import 'package:flutter/material.dart';

class CalculateIndicator extends StatelessWidget {
  final int currentIndex;

  const CalculateIndicator({Key key, this.currentIndex}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Container(
        height: 5,
        width: 5,
        decoration: BoxDecoration(
            color: Colors.black45, borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}

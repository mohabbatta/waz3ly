import 'package:flutter/material.dart';
import 'package:waz3ly/global.dart';

class ReusableRaisedButton extends StatelessWidget {
  final String buttonText;
  final Function pressedFunction;

  const ReusableRaisedButton({Key key, this.buttonText, this.pressedFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: pressedFunction,
      child: Text(
        buttonText,
        style: BTextStyle,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: ForegroundColor,
    );
  }
}

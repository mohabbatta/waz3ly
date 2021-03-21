import 'dart:ui';
import 'package:flutter/material.dart';

const BlackColor = const Color(0xff000000);
const LightBlackColor = const Color(0xf000000);
const WhiteColor = Colors.white;
const ForegroundColor = Color(0xffFFde00);
const DarkForegroundColor = Color(0xfff1a615);
const DarkColor = Color(0xff272A33);
const BottomItemTextStyle = TextStyle(
  color: ForegroundColor,
  fontFamily: 'Hanimation',
);

const UnSelectedBottomItemTextStyle = TextStyle(
  color: Colors.white,
  fontFamily: 'Hanimation',
);

const WTextStyle = TextStyle(
  fontSize: 18,
  color: Colors.black87,
  fontFamily: 'Hanimation',
);
const YTextStyle = TextStyle(
  fontSize: 24,
  color: ForegroundColor,
  fontFamily: 'Hanimation',
  fontWeight: FontWeight.bold,
);

const BTextStyle = TextStyle(
  fontSize: 24,
  color: BlackColor,
  fontFamily: 'Hanimation',
  fontWeight: FontWeight.bold,
);
const BSTextStyle = TextStyle(
  color: BlackColor,
  fontFamily: 'Hanimation',
  fontSize: 18,
);

var kTextFieldDecoration = InputDecoration(
  border: OutlineInputBorder(
    borderRadius: const BorderRadius.all(
      Radius.circular(10.0),
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.black87,
    ),
    borderRadius: BorderRadius.circular(10.0),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.black45,
    ),
    borderRadius: BorderRadius.circular(10.0),
  ),
  disabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey,
    ),
    borderRadius: BorderRadius.circular(10.0),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Color.fromRGBO(255, 222, 0, 100),
    ),
    borderRadius: BorderRadius.circular(10.0),
  ),
  //hintText: "مدينة",
  // errorText: "Ooops, something is not right!",
  errorStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
);

var yTextFieldDecoration = InputDecoration(
  border: OutlineInputBorder(
    borderRadius: const BorderRadius.all(
      Radius.circular(10.0),
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.black87,
    ),
    borderRadius: BorderRadius.circular(10.0),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.black45,
    ),
    borderRadius: BorderRadius.circular(10.0),
  ),
  disabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey,
    ),
    borderRadius: BorderRadius.circular(10.0),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Color.fromRGBO(255, 222, 0, 100),
    ),
    borderRadius: BorderRadius.circular(10.0),
  ),
  //hintText: "مدينة",
  // errorText: "Ooops, something is not right!",
  errorStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
);

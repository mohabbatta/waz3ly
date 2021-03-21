import 'package:flutter/material.dart';
import 'package:waz3ly/global.dart';

class Addresses extends StatefulWidget {
  @override
  _AddressesState createState() => _AddressesState();
}

class _AddressesState extends State<Addresses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: WhiteColor,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        centerTitle: true,
        title: Text("عنوني", style: BSTextStyle),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}

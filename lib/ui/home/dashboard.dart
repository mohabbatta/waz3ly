import 'package:flutter/material.dart';
import 'package:waz3ly/ui/home/account/account_page.dart';
import 'package:waz3ly/ui/home/calculation/calculate_page.dart';
import 'package:waz3ly/ui/home/offices_page.dart';
import 'package:waz3ly/app_localizations.dart';
import 'package:waz3ly/global.dart';
import 'package:waz3ly/ui/home/shipments/home_page.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    CalculatePage(),
    OfficesPages(),
    AccountPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ForegroundColor,
        child: Image.asset(
          'images/package.png',
          color: Colors.black87,
        ),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              "images/HomeIcons.png",
              width: 40,
              height: 40,
              color: WhiteColor,
            ),
            label: localization.translate('Home'),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "images/calculate.png",
              width: 40,
              height: 40,
              color: WhiteColor,
            ),
            label: localization.translate('Calculate'),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "images/offices.png",
              width: 40,
              height: 40,
              color: WhiteColor,
            ),
            label: localization.translate('Offices'),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "images/account.png",
              width: 40,
              height: 40,
              color: WhiteColor,
            ),
            label: localization.translate('My Account'),
          )
        ],
        selectedLabelStyle: BottomItemTextStyle,
        //unselectedLabelStyle: TextStyle(color: Colors.white),
        currentIndex: _selectedIndex,
        selectedItemColor: ForegroundColor,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        backgroundColor: DarkColor,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waz3ly/app_localizations.dart';
import 'package:waz3ly/global.dart';
import 'package:waz3ly/services/app_language.dart';

class ChooseLanguage extends StatefulWidget {
  @override
  _ChooseLanguageState createState() => _ChooseLanguageState();
}

class _ChooseLanguageState extends State<ChooseLanguage> {
  var index = 1;

  @override
  Widget build(BuildContext context) {
    var appLanguage = Provider.of<AppLanguage>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: WhiteColor,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        centerTitle: true,
        title: Text(AppLocalizations.of(context).translate('choose language'),
            style: BSTextStyle),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              index = 0;
              appLanguage.changeLanguage(Locale("en"));
              setState(() {
                // appLanguage.changeLanguage(Locale("en"));
              });
            },
            child: Container(
              height: 90,
              decoration: BoxDecoration(
                color: appLanguage.appLocal.languageCode == "en"
                    ? ForegroundColor
                    : Colors.white,
                border: Border(
                  bottom: BorderSide(width: 2.0, color: Colors.black12),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "images/english.png",
                          height: 70,
                          width: 70,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text("English"),
                        ),
                      ],
                    ),
                    appLanguage.appLocal.languageCode == "en"
                        ? Icon(Icons.check)
                        : SizedBox(),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              index = 1;
              appLanguage.changeLanguage(Locale("ar"));
              setState(() {
                // appLanguage.changeLanguage(Locale("ar"));
              });
            },
            child: Container(
              height: 90,
              decoration: BoxDecoration(
                color: appLanguage.appLocal.languageCode == "ar"
                    ? ForegroundColor
                    : Colors.white,
                border: Border(
                  bottom: BorderSide(width: 2.0, color: Colors.black12),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "images/egypt.png",
                          height: 70,
                          width: 70,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text("عربي"),
                        ),
                      ],
                    ),
                    appLanguage.appLocal.languageCode == "ar"
                        ? Icon(Icons.check)
                        : SizedBox(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

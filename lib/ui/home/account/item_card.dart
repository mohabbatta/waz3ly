import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waz3ly/app_localizations.dart';
import 'package:waz3ly/global.dart';
import 'package:waz3ly/services/app_language.dart';

class ItemCard extends StatelessWidget {
  final String cardImage;
  final String cardText;
  final Function function;

  const ItemCard({Key key, this.cardImage, this.cardText, this.function})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var appLanguage = Provider.of<AppLanguage>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: GestureDetector(
        onTap: function,
        child: Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      cardImage,
                      width: 40,
                      height: 40,
                      color: ForegroundColor,
                    ),
                    SizedBox(width: 12),
                    Text(AppLocalizations.of(context).translate(cardText)),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    appLanguage.appLocal.languageCode == "ar"
                        ? Icon(
                            Icons.arrow_back_ios_outlined,
                            size: 20,
                          )
                        : Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 20,
                          ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:waz3ly/app_localizations.dart';
import 'package:waz3ly/global.dart';

class NoShipmentsPage extends StatelessWidget {
  final String noShipmentText;

  const NoShipmentsPage({Key key, this.noShipmentText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            localization.translate(noShipmentText),
            style: BTextStyle,
          ),
          Icon(
            Icons.remove_shopping_cart,
            size: 30,
          )
        ],
      ),
    );
  }
}

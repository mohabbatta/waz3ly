import 'package:flutter/material.dart';
import 'package:waz3ly/app_localizations.dart';
import 'package:waz3ly/global.dart';
import 'package:waz3ly/ui/home/shipments/no_shipments_page.dart';

class ShippingPage extends StatefulWidget {
  @override
  _ShippingPageState createState() => _ShippingPageState();
}

class _ShippingPageState extends State<ShippingPage> {
  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    localization.translate('In'),
                    style: BTextStyle,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Icon(
                    Icons.file_download,
                    size: 30,
                  )
                ],
              )),
              Tab(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    localization.translate('Out'),
                    style: BTextStyle,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Icon(
                    Icons.file_upload,
                    size: 30,
                  )
                ],
              )),
            ],
            unselectedLabelColor: Colors.black45,
            labelColor: ForegroundColor,
          ),
          centerTitle: true,
          title: Text(
            localization.translate('Shipments'),
            style: BottomItemTextStyle,
          ),
        ),
        body: TabBarView(
          children: [
            NoShipmentsPage(noShipmentText: 'No ingoing shipments'),
            NoShipmentsPage(noShipmentText: 'No outgoing shipments'),
          ],
        ),
      ),
    );
  }
}

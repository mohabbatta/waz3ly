import 'package:flutter/material.dart';
import 'package:waz3ly/app_localizations.dart';
import 'package:waz3ly/global.dart';
import 'package:waz3ly/ui/home/shipments/shipping_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Container(
              decoration: BoxDecoration(
                borderRadius: new BorderRadius.circular(25),
                border: Border.all(color: BlackColor),
              ),
              child: IconButton(
                iconSize: 25,
                icon: Image.asset(
                  "images/2.png",
                  fit: BoxFit.cover,
                ),
                onPressed: () {},
              ),
            ),
          ],
          backgroundColor: Colors.white,
          title: Container(
            width: 150,
            child: Image.asset(
              "images/logo.png",
              fit: BoxFit.cover,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: size.height / 5,
              width: size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/goodmorning.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      localization.translate('Good Afternoon'),
                      style: WTextStyle,
                    ),
                    Text(
                      localization.translate('Mohab'),
                      style: WTextStyle,
                    ),
                    Text(
                      localization.translate('You have 0 active shipments'),
                      style: WTextStyle,
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ShippingPage()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 4,
                        blurRadius: 7,
                        //offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  height: 200,
                  width: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset(
                        'images/Shipper.png',
                        color: Colors.black,
                        height: 100,
                      ),
                      Expanded(
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  localization.translate('Shipment list'),
                                  style: TextStyle(
                                    fontSize: 24,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          color: DarkForegroundColor,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: ForegroundColor,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              )),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    localization
                                        .translate('View Your Shipments'),
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black)),
                                localization.locale.languageCode == 'en'
                                    ? Icon(
                                        Icons.arrow_forward_ios_sharp,
                                        color: Colors.black,
                                        size: 16,
                                      )
                                    : Icon(
                                        Icons.arrow_back_ios_outlined,
                                        color: Colors.black,
                                        size: 16,
                                      )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

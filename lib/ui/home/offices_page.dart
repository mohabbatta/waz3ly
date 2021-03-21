import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:waz3ly/app_localizations.dart';
import 'package:waz3ly/global.dart';

class OfficesPages extends StatefulWidget {
  @override
  _OfficesPagesState createState() => _OfficesPagesState();
}

class _OfficesPagesState extends State<OfficesPages> {
  GoogleMapController mapController;
  List<bool> isSelected = [true, false];

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  int x = 0;
  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Stack(
            fit: StackFit.expand,
            children: [
              x == 0
                  ? GoogleMap(
                      onMapCreated: _onMapCreated,
                      initialCameraPosition: CameraPosition(
                        target: _center,
                        zoom: 11.0,
                      ),
                    )
                  : Scaffold(
                      appBar: AppBar(
                        backgroundColor: Colors.white,
                        title: Text(
                          "الفروع",
                          style: BSTextStyle,
                        ),
                        centerTitle: true,
                      ),
                      body: Column(
                        children: [
                          SizedBox(
                            height: 150,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    "images/offices.png",
                                    color: ForegroundColor,
                                    height: 50,
                                    width: 50,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text("القاهره"),
                                      Text("21 شارع عامر الدقي القاهره"),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Container(
                    color: Colors.white,
                    child: ToggleButtons(
                      children: [
                        toggleItem(
                            toggleName: "الخريطه",
                            //localization.translate("Documents"),
                            imageName: 'images/document.png'),
                        toggleItem(
                            toggleName: "القائمه",
                            //localization.translate("Packages"),
                            imageName: 'images/parcel.png'),
                      ],
                      isSelected: isSelected,
                      selectedColor: BlackColor,
                      fillColor: ForegroundColor,
                      onPressed: (int newIndex) {
                        setState(() {
                          x = newIndex;
                          for (int index = 0;
                              index < isSelected.length;
                              index++) {
                            if (index == newIndex) {
                              isSelected[index] = true;
                            } else {
                              isSelected[index] = false;
                            }
                          }
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      color: Colors.white,
                      child: TextField(
                        decoration: kTextFieldDecoration,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget toggleItem({String toggleName, String imageName}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        child: Row(
          children: [
            Text(toggleName, style: TextStyle(fontSize: 18)),
            SizedBox(width: 10),
            Image.asset(
              imageName,
              width: 30,
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}

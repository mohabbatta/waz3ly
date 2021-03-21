import 'package:flutter/material.dart';
import 'package:waz3ly/app_localizations.dart';
import 'package:waz3ly/global.dart';
import 'package:waz3ly/ui/home/account/add_email.dart';
import 'package:waz3ly/ui/home/account/choose_language.dart';
import 'package:waz3ly/ui/home/account/item_card.dart';
import 'package:waz3ly/ui/home/account/update_profile.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  List<bool> isSelected = [true, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: WhiteColor,
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context).translate('My Account'),
          style: BSTextStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          child: Column(
            children: [
              ItemCard(
                cardImage: "images/account1.png",
                cardText: 'My Profile',
                function: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UpdateProfile()),
                  );
                },
              ),
              ItemCard(
                cardImage: "images/mail.png",
                cardText: "Edit Email",
                function: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddEmail()),
                  );
                },
              ),
              ItemCard(
                cardImage: "images/findlocation.png",
                cardText: "Addresses",
                function: null,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
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
                              "images/bell.png",
                              width: 40,
                              height: 40,
                              color: ForegroundColor,
                            ),
                            SizedBox(width: 12),
                            Text(AppLocalizations.of(context)
                                .translate("Notification")),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ToggleButtons(
                              children: [
                                toggleItem(toggleName: "Yes"),
                                toggleItem(toggleName: "No"),
                              ],
                              isSelected: isSelected,
                              selectedColor: BlackColor,
                              fillColor: ForegroundColor,
                              onPressed: (int newIndex) {
                                setState(() {
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
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              ItemCard(
                cardImage: "images/language.png",
                cardText: "Language",
                function: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChooseLanguage()),
                  );
                },
              ),
              ItemCard(
                cardImage: "images/credit-card.png",
                cardText: "Manage my cards",
                function: null,
              ),
              ItemCard(
                cardImage: "images/customer-support.png",
                cardText: "Help and support",
                function: null,
              ),
              ItemCard(
                cardImage: "images/logout.png",
                cardText: "Logout",
                function: null,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget toggleItem({String toggleName, String imageName}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Text(AppLocalizations.of(context).translate(toggleName),
              style: TextStyle(fontSize: 18)),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}

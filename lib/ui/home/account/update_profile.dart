import 'package:flutter/material.dart';
import 'package:waz3ly/app_localizations.dart';
import 'package:waz3ly/components/reusable_raised_button.dart';
import 'package:waz3ly/global.dart';

class UpdateProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: WhiteColor,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        centerTitle: true,
        title: Text(AppLocalizations.of(context).translate("Edit Profile"),
            style: BSTextStyle),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height - 100,
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppLocalizations.of(context).translate("First name")),
                    Container(
                      height: 50,
                      child: TextField(
                        decoration: kTextFieldDecoration,
                      ),
                    ),
                    Text(AppLocalizations.of(context).translate("Last name")),
                    Container(
                      height: 50,
                      child: TextField(
                        decoration: kTextFieldDecoration,
                      ),
                    ),
                    Text(
                        AppLocalizations.of(context).translate("Phone number")),
                    Container(
                      height: 50,
                      child: TextField(
                        decoration: kTextFieldDecoration,
                      ),
                    ),
                    Text(AppLocalizations.of(context).translate(
                        "your Shipments are linked to the phone number listed above")),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        AppLocalizations.of(context)
                            .translate("Contact customer support"),
                        style: TextStyle(color: Colors.red, fontSize: 18),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ReusableRaisedButton(
                      buttonText:
                          AppLocalizations.of(context).translate("Save"),
                      pressedFunction: () {},
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

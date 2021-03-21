import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:waz3ly/app_localizations.dart';
import 'package:waz3ly/global.dart';
import 'package:waz3ly/ui/login/verification_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(localization.translate('Welcome To'),
                        style: BTextStyle),
                    Container(
                      height: 100,
                      width: 150,
                      child: Image.asset(
                        'images/logo.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      localization.translate('Sign in to manage you shipment'
                          ' and enjoy waz3ly mobile services'),
                      style: BSTextStyle,
                    ),
                    Text(
                      localization.translate('Waz3ly'),
                      style: YTextStyle,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              letterSpacing: 2,
                              fontSize: 18,
                            ),
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                letterSpacing: 2,
                                fontSize: 18,
                              ),
                              // prefix: Container(
                              //   child: SizedBox(
                              //     width: 100,
                              //     child: CurrencyPickerDropdown(
                              //       initialValue: 'INR',
                              //       itemBuilder: _buildCurrencyDropdownItem,
                              //       onValuePicked: (Country country) {
                              //         print("${country.name}");
                              //       },
                              //     ),
                              //   ),
                              // ),,
                              suffixIcon: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Image.asset(
                                  'images/egypt.png',
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                              suffixText: "20",
                              border: new OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(10.0),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black87,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black45,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(255, 222, 0, 100),
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              hintText: "123456789",
                              // errorText: "Ooops, something is not right!",
                              errorStyle: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VerificationPage()),
                              );
                            },
                            child: Text(
                              localization.translate('Go'),
                              style: BTextStyle,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            color: ForegroundColor,
                          ),
                        ),
                        Text(
                          localization.translate(
                              'we will send you an SMS verification code'),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget _buildCurrencyDropdownItem(Country country) => Container(
  //       child: Row(
  //         children: <Widget>[
  //           CountryPickerUtils.getDefaultFlagImage(country),
  //           SizedBox(
  //             width: 8.0,
  //           ),
  //           Text("${country.currencyCode}"),
  //         ],
  //       ),
  //     );
}

import 'package:flutter/material.dart';
import 'package:waz3ly/app_localizations.dart';
import 'package:waz3ly/global.dart';
import 'package:waz3ly/ui/home/dashboard.dart';

class VerificationPage extends StatefulWidget {
  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();
  @override
  void dispose() {
    super.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          localization.translate('Welcome To'),
                          style: BTextStyle,
                        ),
                        Container(
                          height: 100,
                          width: 150,
                          child: Image.asset(
                            'images/logo.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(localization.translate('Enter Verification Code')),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: boxText(),
                            ),
                            Expanded(
                              child: boxText(),
                            ),
                            Expanded(
                              child: boxText(),
                            ),
                            Expanded(
                              child: boxText(),
                            )
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DashBoard()),
                          );
                        },
                        child: Text(
                          localization.translate('Verify'),
                          style: TextStyle(fontSize: 24, color: Colors.black54),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        disabledColor: Color.fromRGBO(255, 222, 0, 0.6),
                        color: Color.fromRGBO(255, 222, 0, 1),
                      ),
                    ),
                    Text(
                      localization.translate(
                          'we will send you an SMS verification code'),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      localization
                          .translate('Did not receive the verification code ?'),
                      textAlign: TextAlign.center,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        localization.translate('Resend SMS'),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget boxText() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
          style: TextStyle(
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
          decoration: InputDecoration(
              focusedBorder: new OutlineInputBorder(
                borderSide: BorderSide(color: ForegroundColor),
                borderRadius: const BorderRadius.all(
                  const Radius.circular(10.0),
                ),
              ),
              border: new OutlineInputBorder(
                borderSide: BorderSide(color: ForegroundColor),
                borderRadius: const BorderRadius.all(
                  const Radius.circular(10.0),
                ),
              ))),
    );
  }
}

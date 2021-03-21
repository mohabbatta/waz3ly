import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waz3ly/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:waz3ly/services/app_language.dart';
import 'package:waz3ly/ui/home/dashboard.dart';
import 'package:waz3ly/ui/login/on_boarding_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppLanguage appLanguage = AppLanguage();
  await appLanguage.fetchLocale();
  runApp(MyApp(
    appLanguage: appLanguage,
  ));
}

class MyApp extends StatelessWidget {
  final AppLanguage appLanguage;
  MyApp({this.appLanguage});
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   supportedLocales: [
    //     Locale('en', 'US'),
    //     Locale('ar', ''),
    //   ],
    //   localizationsDelegates: [
    //     AppLocalizations.delegate,
    //     GlobalMaterialLocalizations.delegate,
    //     GlobalWidgetsLocalizations.delegate,
    //   ],
    //   theme: ThemeData(
    //     //primaryColor: WhiteColor,
    //     iconTheme: IconThemeData(
    //       color: Colors.black, //change your color here
    //     ),
    //     fontFamily: 'Hanimation',
    //   ),
    //   home: DashBoard(),
    // );

    return ChangeNotifierProvider(
      create: (_) => appLanguage,
      child: Consumer<AppLanguage>(
        builder: (context, model, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            locale: model.appLocal,
            supportedLocales: [
              Locale('en', 'US'),
              Locale('ar', ''),
            ],
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            theme: ThemeData(
              //primaryColor: WhiteColor,
              iconTheme: IconThemeData(
                color: Colors.black, //change your color here
              ),
              fontFamily: 'Hanimation',
            ),
            home: OnBoardingPage(),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:waz3ly/app_localizations.dart';
import 'package:waz3ly/global.dart';
import 'package:waz3ly/ui/login/login_page.dart';
import 'package:waz3ly/ui/login/onboarding_indicator.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;
  nextFunction() {
    _pageController.nextPage(duration: _kDuration, curve: _kCurve);
  }

  previousFunction() {
    _pageController.previousPage(duration: _kDuration, curve: _kCurve);
  }

  onChangedFunction(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: onChangedFunction,
            children: <Widget>[
              onBoardingScreen(
                  imageName: 'images/Slide1.png',
                  mainText: "شحن لاي مكان",
                  secondText: "اشحن في اي وقت ولاي مكان باقصي درجات الامان"),
              onBoardingScreen(
                  imageName: 'images/Slide2.png',
                  mainText: "متابعة الشحنات",
                  secondText:
                      "افضل نظام متابعة لشحناتك من اي مكان علي مدار الساعه"),
              onBoardingScreen(
                  imageName: 'images/Slide3.png',
                  mainText: "افضل مندوبين توصيل",
                  secondText: "لانك تستحق الافضل لدينا افضل مندوبين شحن"),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(100.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Indicator(
                      positionIndex: 0,
                      currentIndex: currentIndex,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Indicator(
                      positionIndex: 1,
                      currentIndex: currentIndex,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Indicator(
                      positionIndex: 2,
                      currentIndex: currentIndex,
                    ),
                  ],
                ),
              )
            ],
          ),
          currentIndex == 2
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            RaisedButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()),
                                );
                              },
                              child: Text(localization.translate('Finish')),
                              color: ForegroundColor,
                            ),
                            // SizedBox(
                            //   width: 50,
                            // ),
                            // RaisedButton(
                            //   onPressed: previousFunction,
                            //   child: Text(localization.translate('Previous')),
                            //   color: WhiteColor,
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            RaisedButton(
                              onPressed: nextFunction,
                              child: Text(localization.translate('Next')),
                              color: ForegroundColor,
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            RaisedButton(
                              onPressed: previousFunction,
                              child: Text(localization.translate('Previous')),
                              color: WhiteColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
        ],
      ),
    );
  }

  Widget onBoardingScreen(
      {String imageName, String mainText, String secondText}) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imageName,
          height: 300,
          width: 350,
        ),
        Container(
            child: Center(
                child: Text(mainText,
                    style: TextStyle(
                      fontSize: 20,
                    )))),
        Container(child: Center(child: Text(secondText))),
      ],
    ));
  }
}

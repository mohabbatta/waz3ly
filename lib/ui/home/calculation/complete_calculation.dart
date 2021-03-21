import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waz3ly/components/reusable_raised_button.dart';
import 'package:waz3ly/global.dart';

class CompleteCalculation extends StatefulWidget {
  @override
  _CompleteCalculationState createState() => _CompleteCalculationState();
}

class _CompleteCalculationState extends State<CompleteCalculation> {
  Widget imageIcon({@required String imageName}) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: ForegroundColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Image.asset(imageName),
      ),
    );
  }

  Widget reusableCalcCard(
      {String imageName,
      String mainText,
      String secondText,
      String buttonText}) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              imageIcon(imageName: imageName),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mainText,
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(secondText)
                ],
              ),
            ],
          ),
          ReusableRaisedButton(
            pressedFunction: () {},
            buttonText: buttonText,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: WhiteColor,
        centerTitle: true,
        title: Text(
          'احسب شحنتك',
          style: TextStyle(color: Colors.black87),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                reusableCalcCard(
                  imageName: "images/2.png",
                  mainText: "الشحن من",
                  secondText: "القاهره الجديده",
                  buttonText: "تعديل",
                ),
                reusableCalcCard(
                  imageName: "images/location.png",
                  mainText: "الشحن الي",
                  secondText: "الاسكندريه - سان ستيفانو",
                  buttonText: "تعديل",
                ),
                reusableCalcCard(
                  imageName: "images/box.png",
                  mainText: "نوع الشحن و الوزن",
                  secondText: "طرد -10 Kg",
                  buttonText: "تعديل",
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Container(
                    width: 200,
                    // height: 250,
                    decoration: BoxDecoration(
                      color: ForegroundColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          "images/express-delivery.png",
                          height: 100,
                          width: 100,
                        ),
                        Text(
                          "3-4 ايام",
                          style: BTextStyle,
                        ),
                        Text(
                          "180",
                          style: BTextStyle,
                        ),
                        Text(
                          "جنيه مصرا",
                          style: BTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ReusableRaisedButton(
                        buttonText: "اتمام الشحن",
                        pressedFunction: () {},
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
}

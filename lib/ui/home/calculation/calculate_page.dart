import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waz3ly/app_localizations.dart';
import 'package:waz3ly/components/reusable_raised_button.dart';
import 'package:waz3ly/global.dart';
import 'package:waz3ly/model/list_item.dart';
import 'package:waz3ly/ui/home/calculation/complete_calculation.dart';

class CalculatePage extends StatefulWidget {
  @override
  _CalculatePageState createState() => _CalculatePageState();
}

class _CalculatePageState extends State<CalculatePage> {
  int ind = 0;
  PageController _pageController;
  List<bool> isSelected = [true, false];
  List<ListItem> _dropdownItems = [
    ListItem(1, "مصر", "images/egypt.png"),
  ];
  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  ListItem _selectedItem;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedItem = _dropdownMenuItems[0].value;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = List();
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Image.asset(listItem.flag, width: 50, height: 50),
                SizedBox(width: 12),
                Text(listItem.name),
              ],
            ),
          ),
          value: listItem,
        ),
      );
    }
    return items;
  }

  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;
  nextFunction1() {
    ind = 1;
    setState(() {});
    _pageController.nextPage(
      duration: _kDuration,
      curve: _kCurve,
    );
  }

  nextFunction2() {
    ind = 2;
    setState(() {});
    _pageController.nextPage(
      duration: _kDuration,
      curve: _kCurve,
    );
  }

  Widget imageIcon({@required String imageName, int index}) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(30),
      ),
      child: IconButton(
        icon: Image.asset(imageName),
        onPressed: () {
          _pageController.animateToPage(
            index,
            duration: _kDuration,
            curve: _kCurve,
          );
        },
      ),
    );
  }

  Widget firstStep() {
    var localization = AppLocalizations.of(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(localization.translate('From*')),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                  color: Colors.black45, style: BorderStyle.solid, width: 0.80),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<ListItem>(
                  value: _selectedItem,
                  items: _dropdownMenuItems,
                  onChanged: (value) {
                    setState(() {
                      _selectedItem = value;
                    });
                  }),
            ),
          ),
          Text(localization.translate('City*')),
          Container(
            height: 50,
            child: TextField(
              decoration: kTextFieldDecoration,
            ),
          ),
          SizedBox(height: 30),
          ReusableRaisedButton(
            buttonText: localization.translate('Go'),
            pressedFunction: nextFunction1,
          )
        ],
      ),
    );
  }

  Widget secondStep() {
    var localization = AppLocalizations.of(context);
    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(localization.translate('To*')),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                    color: Colors.black45,
                    style: BorderStyle.solid,
                    width: 0.80),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<ListItem>(
                    value: _selectedItem,
                    items: _dropdownMenuItems,
                    onChanged: (value) {
                      setState(() {
                        _selectedItem = value;
                      });
                    }),
              ),
            ),
            Text(localization.translate("City*")),
            Container(
              height: 50,
              child: TextField(
                decoration: kTextFieldDecoration,
              ),
            ),
            SizedBox(height: 30),
            RaisedButton(
              onPressed: nextFunction2,
              child: Text(
                localization.translate('Go'),
                style: BTextStyle,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              color: ForegroundColor,
            )
          ],
        ),
      ),
    );
  }

  Widget lastStep() {
    var localization = AppLocalizations.of(context);
    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ToggleButtons(
                  children: [
                    toggleItem(
                        toggleName: localization.translate("Documents"),
                        imageName: 'images/document.png'),
                    toggleItem(
                        toggleName: localization.translate("Packages"),
                        imageName: 'images/parcel.png'),
                  ],
                  isSelected: isSelected,
                  selectedColor: BlackColor,
                  fillColor: ForegroundColor,
                  onPressed: (int newIndex) {
                    setState(() {
                      for (int index = 0; index < isSelected.length; index++) {
                        if (index == newIndex) {
                          isSelected[index] = true;
                        } else {
                          isSelected[index] = false;
                        }
                      }
                    });
                  },
                ),
              ],
            ),
            Text("ادخل الطول*"),
            // Container(
            //   height: 50,
            //   child: TextField(
            //     decoration: InputDecoration(
            //       suffix: DropdownButtonHideUnderline(
            //         child: DropdownButton<ListItem>(
            //             focusColor: Colors.white10,
            //             value: _selectedItem,
            //             items: _dropdownMenuItems,
            //             onChanged: (value) {
            //               setState(() {
            //                 _selectedItem = value;
            //               });
            //             }),
            //       ),
            //       border: OutlineInputBorder(
            //         borderRadius: const BorderRadius.all(
            //           Radius.circular(10.0),
            //         ),
            //       ),
            //       focusedBorder: OutlineInputBorder(
            //         borderSide: BorderSide(
            //           color: Colors.black87,
            //         ),
            //         borderRadius: BorderRadius.circular(10.0),
            //       ),
            //     ),
            //   ),
            // ),
            Wrap(
              children: <Widget>[
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [BoxShadow()],
                  ),
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        child: TextFormField(
                          decoration: new InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      PopupMenuButton(
                        onSelected: (c) {},
                        child: Container(
                          height: 50,
                          color: ForegroundColor,
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Cm",
                                style: TextStyle(fontSize: 22),
                              ),
                              Icon(Icons.arrow_drop_down)
                            ],
                          ),
                        ),
                        itemBuilder: (context) => _dropdownItems
                            .map((c) => PopupMenuItem(
                                value: c.name, child: Text(c.name)))
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Text("ادخل العرض*"),
            Wrap(
              children: <Widget>[
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [BoxShadow()],
                  ),
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        child: TextFormField(
                          decoration: new InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      PopupMenuButton(
                        onSelected: (c) {},
                        child: Container(
                          height: 50,
                          color: ForegroundColor,
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Cm",
                                style: TextStyle(fontSize: 22),
                              ),
                              Icon(Icons.arrow_drop_down)
                            ],
                          ),
                        ),
                        itemBuilder: (context) => _dropdownItems
                            .map((c) => PopupMenuItem(
                                value: c.name, child: Text(c.name)))
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Text("ادخل الوزن*"),
            Wrap(
              children: <Widget>[
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [BoxShadow()],
                  ),
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        child: TextFormField(
                          decoration: new InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      PopupMenuButton(
                        onSelected: (c) {},
                        child: Container(
                          height: 50,
                          color: ForegroundColor,
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Kg",
                                style: TextStyle(fontSize: 22),
                              ),
                              Icon(Icons.arrow_drop_down)
                            ],
                          ),
                        ),
                        itemBuilder: (context) => _dropdownItems
                            .map((c) => PopupMenuItem(
                                value: c.name, child: Text(c.name)))
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CompleteCalculation()),
                  );
                },
                child: Text(
                  'Go',
                  style: BTextStyle,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                color: ForegroundColor,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget toggleItem({String toggleName, String imageName}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    //  print(_pageController.page);
    return Scaffold(
      //resizeToAvoidBottomPadding: true,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: size.height / 3.5,
              color: Colors.white70,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('حاسبه السعر'),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: ForegroundColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: IconButton(
                              icon: Image.asset("images/map.png"),
                              onPressed: () {
                                ind = 0;
                                setState(() {});
                                _pageController.animateToPage(
                                  0,
                                  duration: _kDuration,
                                  curve: _kCurve,
                                );
                              },
                            ),
                          ),
                          Container(
                            height: 5,
                            width: 5,
                            decoration: BoxDecoration(
                                color:
                                    ind > 0 ? ForegroundColor : Colors.black45,
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          Container(
                            height: 5,
                            width: 5,
                            decoration: BoxDecoration(
                                color:
                                    ind > 0 ? ForegroundColor : Colors.black45,
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          Container(
                            height: 5,
                            width: 5,
                            decoration: BoxDecoration(
                                color:
                                    ind > 0 ? ForegroundColor : Colors.black45,
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          Container(
                            height: 5,
                            width: 5,
                            decoration: BoxDecoration(
                                color:
                                    ind > 0 ? ForegroundColor : Colors.black45,
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          Container(
                            height: 5,
                            width: 5,
                            decoration: BoxDecoration(
                                color:
                                    ind > 0 ? ForegroundColor : Colors.black45,
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          Container(
                            height: 5,
                            width: 5,
                            decoration: BoxDecoration(
                                color:
                                    ind > 0 ? ForegroundColor : Colors.black45,
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: ind > 0 ? ForegroundColor : Colors.black12,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: IconButton(
                              icon: Image.asset("images/location.png"),
                              onPressed: () {
                                ind = 1;
                                setState(() {});
                                _pageController.animateToPage(
                                  1,
                                  duration: _kDuration,
                                  curve: _kCurve,
                                );
                              },
                            ),
                          ),
                          Container(
                            height: 5,
                            width: 5,
                            decoration: BoxDecoration(
                                color:
                                    ind == 2 ? ForegroundColor : Colors.black45,
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          Container(
                            height: 5,
                            width: 5,
                            decoration: BoxDecoration(
                                color:
                                    ind == 2 ? ForegroundColor : Colors.black45,
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          Container(
                            height: 5,
                            width: 5,
                            decoration: BoxDecoration(
                                color:
                                    ind == 2 ? ForegroundColor : Colors.black45,
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          Container(
                            height: 5,
                            width: 5,
                            decoration: BoxDecoration(
                                color:
                                    ind == 2 ? ForegroundColor : Colors.black45,
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          Container(
                            height: 5,
                            width: 5,
                            decoration: BoxDecoration(
                                color:
                                    ind == 2 ? ForegroundColor : Colors.black45,
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          Container(
                            height: 5,
                            width: 5,
                            decoration: BoxDecoration(
                                color:
                                    ind == 2 ? ForegroundColor : Colors.black45,
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color:
                                  ind == 2 ? ForegroundColor : Colors.black12,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: IconButton(
                              icon: Image.asset("images/box.png"),
                              onPressed: () {
                                ind = 2;
                                setState(() {});
                                _pageController.animateToPage(
                                  2,
                                  duration: _kDuration,
                                  curve: _kCurve,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text('حاسبه السعر'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                color: Colors.white70,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: PageView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: _pageController,
                    children: <Widget>[
                      firstStep(),
                      secondStep(),
                      lastStep(),
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

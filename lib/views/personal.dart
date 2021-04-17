import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

import 'business.dart';
import 'common.dart';

class PersonalAccountPage extends StatefulWidget {

  @override
  _PersonalAccountPageState createState() => _PersonalAccountPageState();
}

class _PersonalAccountPageState extends State<PersonalAccountPage> {
  String type = "Personal Account";
  String accountNo = "9989786554";
  String accNoTxt = "Account Number";
  String availableBal = "14,651.00";
  bool _toggleState = true;
  bool _isBusinessAcc = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(16, 32, 16, 8),
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("images/background.png"),
                        repeat: ImageRepeat.repeat
                    ),
                  ),
                ),
                Positioned(
                    top: 30,
                    left: 10,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          // child: fadeAnimation(
                          //     delay: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.arrow_back_outlined,
                                  color: Colors.white,
                                ),
                              )
                          // ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: IconButton(
                            icon: Icon(
                              Icons.notification_important_rounded,
                              color: Colors.white,
                            ),
                            onPressed: () { },
                          ),
                        ),
                      ],
                    )
                ),
                Container(
                  margin: EdgeInsets.only(top: 60),
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: 150.0,
                            margin: EdgeInsets.only(top: 30),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                color: Colors.white,
                                boxShadow: [BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 8.0
                                )]
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _buildAccountToggle(type),
                                _buildAvailableBalance(),
                                _buildAccountName()
                              ],
                            ),
                          )
                        ],
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.58,
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
                          color: Colors.white,
                        ),
                        child: ListView(
                          children: [
                            businessActions(),
                            customSizeBox(10),
                            businessBody(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ]
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: navBarItems(),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black54,
      ),
    );
  }

  List<BottomNavigationBarItem> navBarItems() {
    return const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.account_balance_outlined),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.send),
        label: 'Fund Transfer',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.phone_android_sharp),
        label: 'Airtime & Bills',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.receipt_long_sharp),
        label: 'Statement',
      )
    ];
  }

  // Widget fadeAnimation({int? delay, Widget? child}) {
  //   final tween = TimelineTween()
  //     ..addScene(begin: Duration(milliseconds: 0), duration: Duration(milliseconds: 500))
  //         .animate(Prop.opacity, tween: Tween(begin: 0.0, end: 1.0))
  //     ..addScene(begin: Duration(milliseconds: 0), end: Duration(milliseconds: 500))
  //         .animate(Prop.translateX, tween: Tween(begin: 120.0, end: 0.0), curve: Curves.easeOut);
  //
  //   return PlayAnimation(
  //       delay: Duration(milliseconds: (500 * delay!).round()),
  //       duration: tween.duration,
  //       child: child,
  //       builder: (context, child, value) => Transform.translate(
  //         offset: Offset(value!.get(Prop.translateX), 0),
  //         child: Opacity(opacity: value.get(Prop.opacity), child: child),
  //       ),
  //       tween: tween
  //   );
  //
  //
  // }

  Widget businessActions() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          customTextButton(
            text: "Personal",
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.deepOrangeAccent),
                foregroundColor: MaterialStateProperty.all(Colors.white)
              // textStyle: TextStyle(fontWeight: FontWeight.bold)
            ),
          ),
          customTextButton(text: 'Overview'),
          customTextButton(text: 'Payment'),
          customTextButton(text: 'Business')
        ],
      )
    );
  }

  Widget businessBody() {
    return Column(
      children: [
        actionListItem(
          context,
          image: "images/moneybag.png",
          mainTitle: "Budget",
          subTitle: "Set a limit to your spending",
        ),
        customSizeBox(10),
        actionListItem(
          context,
          image: "images/piggybag.png",
          mainTitle: "Savings",
          subTitle: "Put away money for small and large\n projects or goals"
        ),
        customSizeBox(10),
        actionListItem(
          context,
          image: "images/business.png",
          mainTitle: "Fund Personal Account",
          subTitle: "Fund your account with just a click",
        ),
      ],
    );
  }

  Widget _buildAccountToggle(String type) {
    return Container(
      width: 150,
      height: 20,
      margin: EdgeInsets.only(bottom: 7.0),
      padding: EdgeInsets.fromLTRB(6, 2, 0, 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.elliptical(30.0, 30.0)),
        color: Colors.deepOrangeAccent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            type,
            style: TextStyle(
                fontSize: 10,
                color: Colors.white,
                fontWeight: FontWeight.w400
            ),
          ),
          Container(
              width: 50,
              child: Switch(value: _isBusinessAcc, onChanged: _onToggle)
          )
        ],
      ),
    );
  }

  Widget _buildAvailableBalance() {
    if (_toggleState) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.only(right: 3),
                child: Text(
                  "NGN",
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700
                  ),
                ),
              ),
              Text(
                availableBal,
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
              )
            ],
          ),
          Container(
            child: Text(
              "Available Balance",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );
    } else {
      return Column(
        children: [
          Text(
            accountNo,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
          ),
          Container(
            child: Text(
              accNoTxt,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );
    }
  }

  Widget _buildAccountName() {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Account Name",
                style: TextStyle(
                    color: Colors.deepOrangeAccent,
                    fontSize: 11,
                    fontWeight: FontWeight.w600
                ),
              ),
              Text(
                "Some Cool Guy",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey
                ),
              )
            ],
          ),
          InkWell(
            onTap: _togglerItemTapped,
            child: Image.asset("images/toggler.png"),
          )
        ],
      ),
    );
  }

  void _onToggle(bool value) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext content) => BusinessAccountPage()));
  }

  void _togglerItemTapped() {
    setState(() {
      _toggleState = !_toggleState;
    });
  }
}


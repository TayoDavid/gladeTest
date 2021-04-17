import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:glade/views/personal.dart';
import 'package:glade/views/transfer.dart';

import 'common.dart';
import 'info.dart';

class BusinessAccountPage extends StatefulWidget {

  @override
  _BusinessAccountPageState createState() => _BusinessAccountPageState();
}

class _BusinessAccountPageState extends State<BusinessAccountPage> {
  bool isPersonalAccount = false;
  bool switchPersonal = false;

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
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext content) => ProfileInfoPage())),
                        // child: fadeAnimation(
                        //     delay: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.list,
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
                                _buildAccountToggle(),
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
        label: 'Transfer',
      ),
      BottomNavigationBarItem(
        icon: ImageIcon(AssetImage('images/moneybag.png')),
        label: 'Loan',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.receipt_long),
        label: 'Invoice',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.credit_card),
        label: 'Cards',
      )
    ];
  }

  // Widget fadeAnimation({required int delay, required Widget child}) {
  //   final tween = TimelineTween()
  //     ..addScene(begin: Duration(milliseconds: 0), duration: Duration(milliseconds: 500))
  //         .animate(Prop.opacity, tween: Tween(begin: 0.0, end: 1.0))
  //     ..addScene(begin: Duration(milliseconds: 0), end: Duration(milliseconds: 500))
  //         .animate(Prop.translateX, tween: Tween(begin: 120.0, end: 0.0), curve: Curves.easeOut);
  //
  //   return PlayAnimation(
  //       delay: Duration(milliseconds: (500 * delay).round()),
  //       duration: tween.duration,
  //       child: child,
  //       builder: (context, child, value) => Transform.translate(
  //         offset: Offset(value!.get(Prop.translateX), 0),
  //         child: Opacity(opacity: value.get(Prop.opacity), child: child),
  //       ),
  //       tween: tween
  //   );
  // }

  Widget businessActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        customTextButton(text: 'Overview'),
        customTextButton(
            text: "Seller's Tool",
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.deepOrangeAccent),
              foregroundColor: MaterialStateProperty.all(Colors.white)
            ),
        ),
        customTextButton(text: 'Payment'),
        customTextButton(text: 'Business')
      ],
    );
  }

  Widget businessBody() {
    return Column(
      children: [
        actionListItem(
          context,
          image: "images/business.png",
          mainTitle: "Fund Transfer",
          subTitle: "Sell Items And Ticket With Ease",
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext content) => FundTransferPage()))
        ),
        customSizeBox(10),
        actionListItem(
          context,
          image: "images/marketing.png",
          mainTitle: "Customers",
          subTitle: "See Your Customers Details"
        ),
        customSizeBox(10),
        actionListItem(
          context,
          image: "images/Payment.png",
          mainTitle: "Invoices",
          subTitle: "Send Invoices To Customers And\n Get Paid",
        ),
        customSizeBox(10),
        actionListItem(
          context,
          image: "images/Payment.png",
          mainTitle: "POS",
          subTitle: "Access Point of Sale With Ease",
        ),
      ],
    );
  }

  Widget _buildAccountToggle() {
    return Container(
      width: 150,
      height: 20,
      margin: EdgeInsets.only(bottom: 7.0),
      padding: EdgeInsets.fromLTRB(6, 2, 0, 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.elliptical(30.0, 30.0)),
        color: Colors.blue,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            "Business Account",
            style: TextStyle(
              fontSize: 10,
              color: Colors.white,
              fontWeight: FontWeight.w400
            ),
          ),
          Container(
            width: 50,
            child: Switch(value: switchPersonal, onChanged: _onToggle)
          )
        ],
      ),
    );
  }

  Widget _buildAvailableBalance() {
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
              "600,651.00",
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
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext content) => PersonalAccountPage()));
  }

  void _togglerItemTapped() {
    setState(() {
      isPersonalAccount = !isPersonalAccount;
    });
  }
}


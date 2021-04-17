import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:glade/views/common.dart';

class FundTransferPage extends StatefulWidget {
  @override
  _FundTransferPageState createState() => _FundTransferPageState();
}

class _FundTransferPageState extends State<FundTransferPage> {
  final List<String> banks = ["Access Bank", "Guaranty Trust Bank", "Ecobank"];
  String _dropdownValue = "Access Bank";
  bool _isGlade = true;
  bool _showIconGlade = false;
  bool _showIconOther = false;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          expandedHeight: MediaQuery.of(context).size.height * 0.1,
          title: Text(
            "Fund Transfer",
            style: TextStyle(
              color: Colors.blueAccent,
            ),
          ),
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_sharp,
              color: Colors.blueAccent,
            )
          ),
        ),
        SliverList(delegate: SliverChildListDelegate(
          [
            Container(
              height: MediaQuery.of(context).size.height * .9,
              color: Colors.white,
              child: Scaffold(
                body: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    _buildActionButtons(),
                    _buildTransferMode(),
                    _buildTextFields(),
                    _buildBottomActionButtons()
                  ],
                ),
              )
            )
          ]
        )),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          customTextButton(
            text: "Transfer",
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
                foregroundColor: MaterialStateProperty.all(Colors.white)
            ),
          ),
          customSizeBoxWidth(5),
          customTextButton(
              text: "Bulk Transfer",
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xfff1f1f6)),
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                  elevation: MaterialStateProperty.all(1.0),
              ),
          ),
          customSizeBoxWidth(5),
          customTextButton(
              text: "History",
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xfff1f1f6)),
                  foregroundColor: MaterialStateProperty.all(Colors.black)
              ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransferMode() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
            child: Text(
              "Transfer Mode",
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w800,
                color: Colors.black
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customHeaderContainer(context,
                  text: "Glade Bank",
                  src: "images/glade.png",
                  displayIcon: _showIconGlade,
                  onPress: () {
                    setState(() {
                      _isGlade = true;
                      _showIconGlade = true;
                      _showIconOther = false;
                    });
                  }),
              customSizeBoxWidth(30),
              customHeaderContainer(context,
                  text: "Other Banks",
                  src: "images/others.png",
                  displayIcon: _showIconOther,
                  onPress: () {
                    setState(() {
                      _isGlade = false;
                      _showIconOther = true;
                      _showIconGlade = false;
                    });
                  })
            ],
          ),
        ],
      ),
    );
  }

  Widget customHeaderContainer(BuildContext context, {required String text, VoidCallback? onPress, required String src, bool? displayIcon}) {
    bool showIcon = displayIcon!;
    return GestureDetector(
      onTap: onPress,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            width: MediaQuery.of(context).size.width * .38,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Color(0xfff1f1f6),
            ),
            child: Column(
              children: [
                Container(
                  child: Image.asset(src, width: 30, height: 30, fit: BoxFit.contain,),
                ),
                Padding(padding: EdgeInsets.only(top: 5),
                  child: Text(
                    text,
                    softWrap: false,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                )
              ],
            ),
          ),
          (showIcon) ? Positioned(child: Icon(Icons.check_circle, color: Colors.blueAccent), top: 5, right: 5,) : SizedBox()
        ],
      ),
    );
  }

  Widget _buildTextFields() {
    return Padding(padding: EdgeInsets.fromLTRB(30, 25, 30, 10),
      child: Column(
        children: [
          if (!_isGlade) customDropDown(items: banks),
          customTextField(text: "Account Number", placeholder: "0011223344"),
          customTextField(text: "Account Name", placeholder: "John Doe"),
          customTextField(text: "Amount", placeholder: "NGN 20,000"),
          customTextField(text: "Narration", placeholder: "Hi Boss, enjoy the small token.", maxLines: 3),
        ]
      )
    );
  }

  Widget _buildBottomActionButtons() {
    return Padding(padding: EdgeInsets.fromLTRB(30, 0, 30, 40),
      child: Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            customTextButton(
              text: "Select Beneficiary".toUpperCase(),
              style: ButtonStyle(
                  // backgroundColor: MaterialStateProperty.all(Colors.white),
                  foregroundColor: MaterialStateProperty.all(Colors.blueAccent)
              )
            ),
            customSizeBox(5),
            customTextButton(
              text: "Send money".toUpperCase(),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
                foregroundColor: MaterialStateProperty.all(Colors.white),
              )
            )
          ],
        ),
      ),
    );
  }

  Widget customDropDown({required List<String> items, String? value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Select Your Bank",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600
          ),
        ),
        customSizeBox(5),
        Container(
          margin: EdgeInsets.only(bottom: 10),
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Color(0xfff1f1f6),
              border: Border.all(color: Color(0xfff1f1f6), width: 1),
              borderRadius: BorderRadius.all(Radius.circular(5))
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              isExpanded: true,
              items: items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem(child: Text(value), value: value,);
              }).toList(),
              value: _dropdownValue,
              onChanged: (String? newValue) {
                setState(() {
                  _dropdownValue = newValue!;
                });
              },
              elevation: 1,
            ),
          ),
        ),
      ]
    );
  }
}
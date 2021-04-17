import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:glade/views/common.dart';

class ProfileInfoPage extends StatefulWidget {
  @override
  _ProfileInfoPageState createState() => _ProfileInfoPageState();
}

class _ProfileInfoPageState extends State<ProfileInfoPage> {

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          expandedHeight: MediaQuery.of(context).size.height * 0.1,
          title: Text(
            "Profile",
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
                        _buildProfilePic(),
                        Divider(thickness: 1),
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
            text: "Personal Info",
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
                foregroundColor: MaterialStateProperty.all(Colors.white)
            ),
          ),
          customSizeBoxWidth(5),
          customTextButton(
            text: "Business Info",
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(0xfff1f1f6)),
              foregroundColor: MaterialStateProperty.all(Colors.black),
              elevation: MaterialStateProperty.all(1.0),
            ),
          ),
          customSizeBoxWidth(5),
          customTextButton(
            text: "Security",
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xfff1f1f6)),
                foregroundColor: MaterialStateProperty.all(Colors.black)
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfilePic() {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      width: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Positioned(
                child: Image.asset("images/profile_pic.png"),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child:   Icon(Icons.add_a_photo_outlined, size: 24,))
            ],
          ),
          Text(
            "John Doe",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            "Virtues Inc.",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black87,
              fontWeight: FontWeight.w800
            ),
            textAlign: TextAlign.center,
          ),

        ],
      ),
    );
  }

  Widget _buildTextFields() {
    return Padding(padding: EdgeInsets.fromLTRB(30, 25, 30, 10),
        child: Column(
            children: [
              customTextField(text: "Full Name", placeholder: "John Doe"),
              customTextField(text: "Phone Number", placeholder: "0123457689"),
              customTextField(text: "BVN ID", placeholder: "1234567898"),
              customTextField(text: "Email Address", placeholder: "omotayo4david@gmail.com"),
              customTextField(text: "Referral Code", placeholder: "00110011244558788", hasCopy: true),
            ]
        )
    );
  }

  Widget _buildBottomActionButtons() {
    return Container( 
      height: 100,
      padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
      margin: EdgeInsets.only(bottom: 40),
      child: Row(
        children: [
          customTextButton(
              text: "Save changes".toUpperCase(),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 15))
              )
          )
        ],
      ),
    );
  }
}
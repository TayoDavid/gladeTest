import 'package:flutter/material.dart';

Widget customTextButton({String? text, VoidCallback? whenPressed, ButtonStyle? style}) {
  return Expanded(
    child: TextButton(
      child: Text(text!, softWrap: false),
      onPressed: whenPressed,
      style: style,
    )
  );
}

Widget actionListItem(BuildContext context, {required String image, required String mainTitle, required String subTitle, VoidCallback? onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: MediaQuery.of(context).size.width * 0.9,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: Color(0xfff0f0f5),
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(12, 8, 24, 8),
              child: Image.asset(image),
            ),
            Container(
              // width: MediaQuery.of(context).size.width * 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mainTitle,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    subTitle,
                    softWrap: true,
                    style: TextStyle(
                        fontSize: 11
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.all(8),
              child: Icon(Icons.arrow_forward_ios),
            )
          ]
      ),
    ),
  );
}

Widget customSizeBox(double height) {
  return SizedBox(height: height);
}

Widget customSizeBoxWidth(double width) {
  return SizedBox(width: width);
}

Widget customTextField({required String text, required String placeholder, String? label, TextEditingController? controller, int? maxLines, bool? hasCopy}) {
  return Container(
    margin: EdgeInsets.only(bottom: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600
          ),
        ),
        Container(
          // height: 40,
          margin: EdgeInsets.only(top: 5),
          decoration: BoxDecoration(
            color: Color(0xfff1f1f6),
            borderRadius: BorderRadius.all(Radius.circular(5))
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child:
              TextField(
                controller: controller,
                maxLines: maxLines,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  // fillColor: Colors.black,
                  hintText: placeholder,
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                  enabledBorder: InputBorder.none,
                ),
              )),
              if (hasCopy != null) Icon(Icons.file_copy_sharp, color: Colors.blueAccent,)
            ],
          ),
        ),
      ],
    ),
  );
}

Widget customTextWidget({required String labelText, required String mainText, bool? hasCopy}) {
  return Container(
    margin: EdgeInsets.only(bottom: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600
          ),
        ),
        Container(
          // height: 40,
          margin: EdgeInsets.only(top: 5),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Color(0xfff1f1f6),
              borderRadius: BorderRadius.all(Radius.circular(7))
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                mainText,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                ),
              ),
              if (hasCopy != null) Icon(Icons.file_copy_sharp, color: Colors.blueAccent,)
            ],
          )
        ),
      ],
    ),
  );
}


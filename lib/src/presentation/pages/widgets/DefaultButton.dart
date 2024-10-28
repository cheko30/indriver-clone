import 'package:flutter/material.dart';

class Defaultbutton extends StatelessWidget {
  String text;
  Color color;
  Color textColor;
  Defaultbutton(
      {super.key,
      required this.text,
      this.color = Colors.white,
      this.textColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(bottom: 15, left: 20, right: 20),
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(backgroundColor: color),
          child: Text(
            text,
            style: TextStyle(
                color: textColor, fontSize: 18, fontWeight: FontWeight.bold),
          )),
    );
  }
}

import 'package:flutter/material.dart';

class Defaultbutton extends StatelessWidget {
  String text;
  Color color;
  Color textColor;
  EdgeInsetsGeometry margin;

  Defaultbutton(
      {super.key,
      required this.text,
      this.color = Colors.white,
      this.textColor = Colors.black,
      this.margin = const EdgeInsets.only(bottom: 20, left: 40, right: 40)});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: MediaQuery.of(context).size.width,
      margin: margin,
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

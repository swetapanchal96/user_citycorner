import 'package:flutter/material.dart';

class CustomRoundButton extends StatelessWidget {
  CustomRoundButton({required this.onTap, required this.backcolor,required this.text,required this.textcolor});
  final Function onTap;
  final Color backcolor;
  final String text;
  final Color textcolor;
  // final double width;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(

        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: backcolor),
        child: Padding(
            padding: EdgeInsets.all(8),
            child: Text(text,style: TextStyle(color: textcolor,fontWeight: FontWeight.normal,fontSize: 14),)),
      ),
    );
  }
}

class CustomborderButton extends StatelessWidget {
  CustomborderButton({required this.onTap, required this.backcolor,required this.text,required this.textcolor,required this.width});
  final Function onTap;
  final Color backcolor;
  final String text;
  final Color textcolor;
  final double width;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          border: Border.all(color: backcolor,width: 1),
        ),
        child: Padding(
            padding: EdgeInsets.only(top: 3.0,bottom: 3.0),
            child: Text(text,style: TextStyle(color: textcolor,fontWeight: FontWeight.normal,fontSize: 14),)),
      ),
    );
  }
}

class CustomSquareButton extends StatelessWidget {
  CustomSquareButton({required this.onTap, required this.backcolor,required this.text,required this.textcolor});
  final Function onTap;
  final Color backcolor;
  final String text;
  final Color textcolor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: backcolor),
        child: Padding(
            padding: EdgeInsets.only(left: 8,right: 8,top: 12,bottom: 12),
            child: Text(text,textAlign:TextAlign.center,style: TextStyle(color: textcolor,fontWeight: FontWeight.normal,fontSize: 16),)),
      ),
    );
  }
}


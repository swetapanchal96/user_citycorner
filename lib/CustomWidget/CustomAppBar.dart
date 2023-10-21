import 'package:flutter/material.dart';
import 'package:user_citycorner/CustomWidget/CustomColors.dart';
import 'package:user_citycorner/CustomWidget/CustomTextStyle.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({required this.ontap, required this.icon, required this.titlename,required this.actionontap, required this.actionicon, required this.visible});
  final Function ontap;
  final Function actionontap;
  final String icon;
  final bool visible;
  final String actionicon;
  final String titlename;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: ColorName.logocolor,

      leading: visible ? IconButton(

          onPressed: () {
            ontap();
          },
          icon: Image.asset(
            icon,height: 30,width: 30,
            fit: BoxFit.cover,color: ColorName.white,
          )):SizedBox(),
      title: Text(titlename,style: CustextStyle.appbarTextStyle),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: IconButton(
              onPressed: () {
                actionontap();
              },
              icon: Image.asset(
                actionicon,height: 25,width: 25,
                fit: BoxFit.cover,color: ColorName.white,
              )),
        ),
      ],
    );
  }
}

class CustomAppIconBar extends StatelessWidget {
  CustomAppIconBar({required this.ontap, required this.icon, required this.titlename, required this.actionontap, required this.actionicon});
  final Function ontap;
  final Function actionontap;
  final Icon icon;
  final String actionicon;
  final String titlename;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: ColorName.logocolor,
      leading: IconButton(
        onPressed: () {
          ontap();
        },
        icon: icon,color: ColorName.white,
      ),
      title: Text(titlename,style: CustextStyle.appbarTextStyle),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: IconButton(
            onPressed: () {
              actionontap();
            },
            icon: Image.asset(
              actionicon,height: 25,width: 25,
              fit: BoxFit.cover,color: ColorName.white,
            )
          ),
        ),
      ],
    );
  }
}

class CustomAppwithoutactionBar extends StatelessWidget {
  CustomAppwithoutactionBar({required this.ontap, required this.icon, required this.titlename});
  final Function ontap;
  final Icon icon;
  final String titlename;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: ColorName.logocolor,
      leading: IconButton(
        onPressed: () {
          ontap();
        },
        icon: icon,color: ColorName.white,
      ),
      title: Text(titlename,style: CustextStyle.appbarTextStyle),
    );
  }
}

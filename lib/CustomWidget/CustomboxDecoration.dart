import 'package:flutter/material.dart';
import 'package:user_citycorner/CustomWidget/CustomColors.dart';

class CusboxDecoration{
  static BoxDecoration loginbox = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(30)),
      boxShadow: [
        BoxShadow(
          blurRadius: 3,
          offset: Offset(2, 3),
          color: ColorName.black26,
        ),
      ]
  );
}
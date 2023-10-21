import 'package:flutter/material.dart';
import 'package:user_citycorner/CustomWidget/CustomAppBar.dart';

class Order_Complete_Screen extends StatefulWidget {
  const Order_Complete_Screen({super.key});

  @override
  State<Order_Complete_Screen> createState() => _Order_Complete_ScreenState();
}

class _Order_Complete_ScreenState extends State<Order_Complete_Screen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CustomAppBar(
            ontap: () {
              scaffoldKey.currentState?.openDrawer();
            },
            icon: 'assets/Menu_Icon/menu_icon.png',
            titlename: 'Menu',actionontap: (){},actionicon: 'assets/Menu_Icon/shop_shopping.png', visible: false,)),

    );
  }
}

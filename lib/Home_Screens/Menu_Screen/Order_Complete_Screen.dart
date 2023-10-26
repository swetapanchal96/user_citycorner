import 'package:flutter/material.dart';
import 'package:user_citycorner/CustomWidget/CustomAppBar.dart';
import 'package:user_citycorner/CustomWidget/CustomColors.dart';
import 'package:user_citycorner/CustomWidget/CustomRoundButton.dart';
import 'package:user_citycorner/Home_Screens/Menu_Screen/Categories_Screen.dart';
import 'package:user_citycorner/My_Orders/My_Orders_Screen.dart';

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
            titlename: 'Order Complete',actionontap: (){Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Categories_Screen()));},actionicon: 'assets/Menu_Icon/home_house.png', visible: false,)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: ColorName.gray2,width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0,right: 15.0,top: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(image: AssetImage('assets/Menu_Icon/completed_checkmark.png'),color: ColorName.logocolor,height: 60,width: 60),
                    Text('Payment Completed',style: TextStyle(color: ColorName.black,fontSize: 18,fontWeight: FontWeight.bold),),
                    SizedBox(height: 5,),
                    Text('We\'ve sent you an email with all the details of your order & remember you can track your order using this app!',textAlign: TextAlign.center,style: TextStyle(color: ColorName.black,),),
                    SizedBox(height: 12,),
                    Text('Your Order Number:',style: TextStyle(color: ColorName.black,fontSize: 16,fontWeight: FontWeight.w600),),
                    SizedBox(height: 5,),
                    Divider(color: ColorName.gray2,),

                    Text('160420001',style: TextStyle(color: ColorName.black,fontSize: 18,fontWeight: FontWeight.bold),),
                    SizedBox(height: 5,),
                  ],
                ),
              ),
            ),
          ),
          Expanded(child: SizedBox()),
          Image(image: AssetImage('assets/Menu_Icon/Happy_emoji.png'),color: ColorName.logocolor,height: 50,width: 50),
          SizedBox(height: 3,),
          Text('Thank you!',textAlign: TextAlign.center,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: ColorName.logocolor),),
          Expanded(child: SizedBox()),
          Container(
            margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 20),
            alignment: Alignment.bottomCenter,
            child: CustomSquareButton(onTap: (){Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => My_Orders_Screen()));},
              backcolor: ColorName.logocolor, text: 'Go to My Orders', textcolor: ColorName.white,
            ),
          ),
        ],
      ),

    );
  }
}

import 'package:flutter/material.dart';
import 'package:user_citycorner/CustomWidget/CustomAppBar.dart';
import 'package:user_citycorner/CustomWidget/CustomColors.dart';
import 'package:user_citycorner/CustomWidget/CustomRoundButton.dart';
import 'package:user_citycorner/Home_Screens/Menu_Screen/DrawerScreen.dart';

class My_Orders_Screen extends StatefulWidget {
  const My_Orders_Screen({super.key});

  @override
  State<My_Orders_Screen> createState() => _My_Orders_ScreenState();
}

class _My_Orders_ScreenState extends State<My_Orders_Screen> with SingleTickerProviderStateMixin {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  late AnimationController _drawerSlideController;
  @override
  void initState() {
    _drawerSlideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 10),
    );
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _drawerSlideController.dispose();
    super.dispose();
  }

  void openDrawer() {
    _drawerSlideController.forward();
  }

  void closeDrawer() {
    _drawerSlideController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: scaffoldKey,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: CustomAppBar(
              ontap: () {
                scaffoldKey.currentState?.openDrawer();
              },
              icon: 'assets/Menu_Icon/menu_icon.png',
              titlename: 'My Order\'s',actionontap: (){},actionicon: 'assets/Menu_Icon/home_house.png', visible: true,)),
        drawer: DrawerScreen(),
        body: Column(
          children: [
            TabBar(
              indicatorColor: ColorName.logocolor,
              labelColor: ColorName.logocolor,
              unselectedLabelColor: Colors.black,
              onTap: (value) {
                if (value == 0) {
                } else if (value == 1) {
                } else if (value == 2) {
                } else {}
              },
              tabs: [
                Tab(
                  child: Text(
                    'Ongoing Orders',
                    style: TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                Tab(
                  child: Text(
                    'Past Orders',
                    style: TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Ongoing_Orders_ListUI(),
                  // Past_Orders_ListUI(),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
  Widget Ongoing_Orders_ListUI() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: () {

                showDialog(
                    context: context,
                    builder: (context) {
                      return StatefulBuilder(builder:
                          (BuildContext context,
                          StateSetter setState) {
                        return Padding(
                          padding:
                          const EdgeInsets.all(15.0),
                          child: Dialog(
                            insetPadding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(
                                  5.0),
                            ),
                            elevation: 0.0,
                            backgroundColor: Colors.white,
                            child: Column(
                              mainAxisSize:
                              MainAxisSize.min,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: ColorName.white,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(width: 1,color: ColorName.gray2),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Image(image: AssetImage('assets/Menu_Icon/food_delivery.png'),color: ColorName.black,width: 35,height: 35),
                                        SizedBox(width: 12,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Order No - 110040717',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                                            SizedBox(height: 3,),
                                            Text('Order Shipped',style: TextStyle(color: ColorName.logocolor),),
                                          ],
                                        ),
                                        Expanded(child: SizedBox()),
                                        Text('\u{20B9} 500.00',style: TextStyle(color: ColorName.logocolor,fontWeight: FontWeight.w600,fontSize: 16),)

                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 60,
                                          height: 60,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            image: DecorationImage(image: NetworkImage('data:image/jpeg;base64,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',),fit: BoxFit.cover),
                                          ),
                                        ),
                                        SizedBox(width: 10,),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('2 * Deluxe Thali-Veg',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                                              SizedBox(height: 5,),
                                              Text('2 * \u{20B9} 150.00 = \u{20B9} 300.00',style: TextStyle(color: ColorName.Circlecolor,fontSize: 14),),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 60,
                                          height: 60,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            image: DecorationImage(image: NetworkImage('data:image/jpeg;base64,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',),fit: BoxFit.cover),
                                          ),
                                        ),
                                        SizedBox(width: 10,),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('2 * Deluxe Thali-Veg',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                                              SizedBox(height: 5,),
                                              Text('2 * \u{20B9} 150.00 = \u{20B9} 300.00',style: TextStyle(color: ColorName.Circlecolor,fontSize: 14),),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Divider(color: ColorName.gray2),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CustomborderButton(onTap: (){
                                      },backcolor: ColorName.black,text: 'Cancel Order',textcolor: ColorName.black,width: 120),
                                      CustomborderButton(onTap: (){
                                      },backcolor: ColorName.black,text: 'Track Order',textcolor: ColorName.black,width: 120),

                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      });
                    });

              },
              child: Container(
                decoration: BoxDecoration(
                  color: ColorName.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 1,color: ColorName.gray2),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image(image: AssetImage('assets/Menu_Icon/food_delivery.png'),color: ColorName.black,width: 35,height: 35),
                      SizedBox(width: 12,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text('Order No - 110040717',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                        SizedBox(height: 3,),
                        Text('Order Shipped',style: TextStyle(color: ColorName.logocolor),),
                        ],
                      ),
                      Expanded(child: SizedBox()),
                      Text('\u{20B9} 500.00',style: TextStyle(color: ColorName.logocolor,fontWeight: FontWeight.w600,fontSize: 16),)

                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 3,),
            Container(
              decoration: BoxDecoration(
                color: ColorName.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1,color: ColorName.gray2),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(

                  children: [
                    Row(
                      children: [
                        Expanded(child: Text('\u2022  Deluxe Thali - Veg',textAlign: TextAlign.start),flex: 2),
                        Expanded(child: Text('Qty: 2',textAlign: TextAlign.center)),
                        Expanded(child: Text('\u{20B9} 200.00',textAlign: TextAlign.end,)),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: Text('\u2022  Deluxe Thali - Veg',textAlign: TextAlign.start),flex: 2),
                        Expanded(child: Text('Qty: 2',textAlign: TextAlign.center)),
                        Expanded(child: Text('\u{20B9} 200.00',textAlign: TextAlign.end)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 3,),
            Container(
              decoration: BoxDecoration(
                color: ColorName.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1,color: ColorName.gray2),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomborderButton(onTap: (){
                    },backcolor: ColorName.black,text: 'Cancel Order',textcolor: ColorName.black,width: 120),
                    CustomborderButton(onTap: (){
                    },backcolor: ColorName.black,text: 'Track Order',textcolor: ColorName.black,width: 120),
                  ],
                ),
              ),
            ),
            SizedBox(height: 3,),
            Container(
              decoration: BoxDecoration(
                color: ColorName.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1,color: ColorName.gray2),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Image(image: AssetImage('assets/Menu_Icon/Food_bag.png'),color: ColorName.black,width: 35,height: 35),
                    SizedBox(width: 12,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Order No - 110040712',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                        SizedBox(height: 3,),
                        Text('Order Prepairing',style: TextStyle(color: ColorName.logocolor),),
                      ],
                    ),
                    Expanded(child: SizedBox()),
                    Text('\u{20B9} 850.00',style: TextStyle(color: ColorName.logocolor,fontWeight: FontWeight.w600,fontSize: 16),)

                  ],
                ),
              ),
            ),
            SizedBox(height: 3,),
            Container(
              decoration: BoxDecoration(
                color: ColorName.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1,color: ColorName.gray2),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(child: Text('\u2022  Deluxe Thali - Veg',textAlign: TextAlign.start),flex: 2),
                        Expanded(child: Text('Qty: 2',textAlign: TextAlign.center)),
                        Expanded(child: Text('\u{20B9} 250.00',textAlign: TextAlign.end,)),
                      ],
                    ),
                    SizedBox(height: 3,),
                    Row(
                      children: [
                        Expanded(child: Text('\u2022  Deluxe Thali - Veg',textAlign: TextAlign.start),flex: 2),
                        Expanded(child: Text('Qty: 3',textAlign: TextAlign.center)),
                        Expanded(child: Text('\u{20B9} 100.00',textAlign: TextAlign.end)),
                      ],
                    ),
                    SizedBox(height: 3,),
                    Row(
                      children: [
                        Expanded(child: Text('\u2022  Deluxe Thali - Veg',textAlign: TextAlign.start),flex: 2),
                        Expanded(child: Text('Qty: 2',textAlign: TextAlign.center)),
                        Expanded(child: Text('\u{20B9} 850.00',textAlign: TextAlign.end,)),
                      ],
                    ),
                    SizedBox(height: 3,),
                    Row(
                      children: [
                        Expanded(child: Text('\u2022  Deluxe Thali - Veg',textAlign: TextAlign.start),flex: 2),
                        Expanded(child: Text('Qty: 4',textAlign: TextAlign.center)),
                        Expanded(child: Text('\u{20B9} 200.00',textAlign: TextAlign.end)),
                      ],
                    ),
                    SizedBox(height: 3,),
                    Row(
                      children: [
                        Expanded(child: Text('\u2022  Deluxe Thali - Veg',textAlign: TextAlign.start),flex: 2),
                        Expanded(child: Text('Qty: 1',textAlign: TextAlign.center)),
                        Expanded(child: Text('\u{20B9} 1000.00',textAlign: TextAlign.end,)),
                      ],
                    ),
                    SizedBox(height: 3,),
                    Row(
                      children: [
                        Expanded(child: Text('\u2022  Deluxe Thali - Veg',textAlign: TextAlign.start),flex: 2),
                        Expanded(child: Text('Qty: 3',textAlign: TextAlign.center)),
                        Expanded(child: Text('\u{20B9} 80.00',textAlign: TextAlign.end)),
                      ],
                    ),
                    SizedBox(height: 3,),
                  ],
                ),
              ),
            ),
            SizedBox(height: 3,),
            Container(
              decoration: BoxDecoration(
                color: ColorName.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1,color: ColorName.gray2),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    CustomborderButton(onTap: (){
                    },backcolor: ColorName.black,text: 'Cancel Order',textcolor: ColorName.black,width: 120),
                  ],
                ),
              ),
            )


          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:user_citycorner/CustomWidget/CustomAppBar.dart';
import 'package:user_citycorner/CustomWidget/CustomColors.dart';
import 'package:user_citycorner/Home_Screens/Menu_Screen/DrawerScreen.dart';

class Profile_Screen extends StatefulWidget {
  const Profile_Screen({super.key});

  @override
  State<Profile_Screen> createState() => _Profile_ScreenState();
}

class _Profile_ScreenState extends State<Profile_Screen>
    with SingleTickerProviderStateMixin {
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
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CustomAppBar(
            ontap: () {
              scaffoldKey.currentState?.openDrawer();
            },
            icon: 'assets/Menu_Icon/menu_icon.png',
            titlename: 'Profile',
            actionontap: () {},
            actionicon: 'assets/Menu_Icon/home_house.png', visible: true,
          )),
      drawer: DrawerScreen(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(height: 20,),
            Container(
              height: 140,
              width: 140,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('assets/person.png')),
                  border: Border.all(
                      width: 2,
                      color: ColorName.graybox,
                      style: BorderStyle.solid)),
            ),
            SizedBox(height: 50,),
            Container(
              decoration: BoxDecoration(
                  color: ColorName.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 5,
                        color: ColorName.gray2,
                        offset: Offset(1, 2))
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Icon(Icons.person,color: ColorName.logocolor,),
                    SizedBox(width: 20,),
                    Text(
                      'John Doe',
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 25,),
            Container(
              decoration: BoxDecoration(
                  color: ColorName.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 5,
                        color: ColorName.gray2,
                        offset: Offset(1, 2))
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Icon(Icons.call,color: ColorName.logocolor,),
                    SizedBox(width: 20,),
                    Text(
                      '+91 9904500629',
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 25,),
            Container(
              decoration: BoxDecoration(
                  color: ColorName.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 5,
                        color: ColorName.gray2,
                        offset: Offset(1, 2))
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Icon(Icons.location_on,color: ColorName.logocolor,),
                    SizedBox(width: 20,),
                    Expanded(
                      child: Text(
                        'E-216, App innovation, Sector 74, Industrial Area Phase 8b, Mohali, Punjab, india, 160062',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

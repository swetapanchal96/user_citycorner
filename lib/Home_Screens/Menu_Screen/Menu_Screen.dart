import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:user_citycorner/CustomWidget/CustomAppBar.dart';
import 'package:user_citycorner/CustomWidget/CustomColors.dart';
import 'package:user_citycorner/Home_Screens/Menu_Screen/DrawerScreen.dart';
import 'package:user_citycorner/Home_Screens/Menu_Screen/Special_Meals_Screen.dart';
import 'package:user_citycorner/Login/Login_Screen.dart';

class Menu_Screen extends StatefulWidget {
  const Menu_Screen({super.key});

  @override
  State<Menu_Screen> createState() => _Menu_ScreenState();
}

class _Menu_ScreenState extends State<Menu_Screen>
    with SingleTickerProviderStateMixin {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  late AnimationController _drawerSlideController;

  late String user_id,full_name,email,mobile_number,role_id,token,status,strIP;

  @override
  void initState() {
    user_id = GetStorage().read("user_id").toString();
    full_name = GetStorage().read("full_name").toString();
    email = GetStorage().read("email").toString();
    mobile_number = GetStorage().read("mobile_number").toString();
    role_id = GetStorage().read("role_id").toString();
    token = GetStorage().read("token").toString();
    status = GetStorage().read("status").toString();
    strIP = GetStorage().read("strIP").toString();

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
    return WillPopScope(
      onWillPop: () async {
        moveTolastScreen();
        return false;
      },
      child: Scaffold(
        key: scaffoldKey,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: CustomAppBar(
                ontap: () {
                  scaffoldKey.currentState?.openDrawer();
                },
                icon: 'assets/Menu_Icon/menu_icon.png',
                titlename: 'Menu',actionontap: (){},actionicon: 'assets/Menu_Icon/shop_shopping.png', visible: true,)),
        drawer: DrawerScreen(),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [

                Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Special_Meals_Screen()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: ColorName.white,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 3,
                                      color: ColorName.gray2,
                                      offset: Offset(1, 2))
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image:
                                            AssetImage("assets/Menu_Icon/food.jpg"),
                                            fit: BoxFit.fill,
                                          ),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Text(
                                        'Snacks',
                                        style: TextStyle(
                                            color: ColorName.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    ],
                                  ),
                                  Image.asset(
                                    "assets/Menu_Icon/arrow_circle.png",
                                    color: ColorName.logocolor,
                                    width: 40,
                                    height: 40,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPopupDialog(BuildContext context) {
    return new AlertDialog(
      title: Container(
        width: MediaQuery.of(context).size.width,
        child: Text(
          'Confirmation',
          style: TextStyle(fontWeight: FontWeight.w800,color: ColorName.logocolor),
        ),
      ),
      content: Text("Are you sure you want to logout ?"),
      actions: [
        TextButton(onPressed: (){Navigator.of(context).pop();},
            child: Text("No", style: TextStyle(color: ColorName.logocolor),)),
        TextButton(
            onPressed: () async {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context)=> Login_Screen()));
            },
            child: Text("Yes",style: TextStyle(color: ColorName.logocolor),)),
      ],
    );
  }

  void moveTolastScreen(){

    showDialog(
      context: context,
      builder: (BuildContext context) =>
          _buildPopupDialog(context),
    );

  }
}

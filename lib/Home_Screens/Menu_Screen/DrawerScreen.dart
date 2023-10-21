import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:user_citycorner/CustomWidget/CustomColors.dart';
import 'package:user_citycorner/Home_Screens/Menu_Screen/ChangePassword_Screen.dart';
import 'package:user_citycorner/Home_Screens/Menu_Screen/Reports_Screen.dart';
import 'package:user_citycorner/Home_Screens/Profile_Screen.dart';
import 'package:user_citycorner/Login/Login_Screen.dart';
import 'package:user_citycorner/My_Orders/My_Orders_Screen.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {

  late AnimationController _drawerSlideController;

  List<String> DrawerItem = ["Menu", "My Orders","Support","Settings","Log Out"];
  List<String> DrawerIcons = ["assets/DrawerIcon/Food_Menu.png", "assets/DrawerIcon/My_Order.png","assets/DrawerIcon/Support_Icon.png","assets/DrawerIcon/Setting_Icon.png","assets/DrawerIcon/logout_icon.png"];
  late String user_id,full_name,email,mobile_number,role_id,token,status,strIP;
  int _selectedIndex = -1;


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
    print("$user_id,\n$full_name,\n$email,\n$mobile_number,\n$role_id,\n$token,\n$status,\n$strIP");
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _drawerSlideController.dispose();
  }

  void openDrawer() {
    _drawerSlideController.forward();
  }

  void closeDrawer() {
    _drawerSlideController.reverse();
  }


  void _onItemTapped(int index) {
    _selectedIndex = index;
    print("_selectedIndex :"+_selectedIndex.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery
          .of(context)
          .size
          .width / 1.5,
      // shape: OutlineInputBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(50),bottomRight: Radius.circular(50))),
      child: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        color: ColorName.white,
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25.0, bottom: 15),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>Profile_Screen()));
                  },
                  child: Container(
                      height: 120,
                      width: 120,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(image: AssetImage('assets/person.png'),fit: BoxFit.cover),
                          border: Border.all(width: 2,
                              color: ColorName.graybox,
                              style: BorderStyle.solid)
                      ),
                  ),
                ),
              ),
              Text(full_name, style: TextStyle(color: ColorName.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              Divider(color: ColorName.graybox, thickness: 1,),
              Expanded(
                child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: DrawerItem.length,
                    separatorBuilder: (context, index) {
                      return Divider(
                        height: 1, // Height of the divider
                        color: ColorName.graybox, // Color of the divider
                      );
                    },
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          _onItemTapped(index);
                          Navigator.pop(context);
                        },
                        child: InkResponse(
                          containedInkWell: true,
                          highlightColor: Colors.blue,
                          // Change this to the desired highlight color
                          splashColor: Colors.red,
                          // Change this to the desired splash color
                          child: Padding(
                            padding: EdgeInsets.only(top: 15,bottom: 15),
                            child: ListTile(
                              onTap: (){
                                if(index == 0){
                                  Navigator.pop(context);
                                }
                                else if(index == 1){
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => My_Orders_Screen()));
                                }
                                else if(index == 2){
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Reports_Screen()));
                                }
                                else if(index == 3){
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ChangePassword_Screen()));
                                } else if(index == 4){
                                  Navigator.pop(context);
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        _buildPopupDialog(context),
                                  );
                                }
                              },
                              leading:
                              _selectedIndex == index?

                              Image.asset(
                                DrawerIcons[index].toString(), width: 30,color: ColorName.logocolor,
                                height: 30,):
                              Image.asset(
                                DrawerIcons[index].toString(), width: 30,color: ColorName.black,
                                height: 30,),
                              title: Text(
                                DrawerItem[index],
                                style: TextStyle(
                                    color: _selectedIndex == index
                                        ? ColorName.logocolor
                                        : ColorName.black,
                                    fontWeight: FontWeight.w600
                                  // Change the selected text color to green, and default text color to black
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              // ListTile(
              //   selectedColor: Colors.orange,
              //   selectedTileColor: Colors.orange,
              //   leading: Image.asset("assets/Menu_Icon/all_order.png",width: 140,height: 40,),
              //   // minLeadingWidth: 5,
              //   title: const Text('Dashboard',
              //     style: TextStyle(
              //       color: Colors.black,
              //       fontSize: 16.0,
              //       fontFamily: 'Metropolis',
              //       fontWeight: FontWeight.w600
              //     ),
              //   ),
              //   onTap: () {
              //     // Navigator.of(context).push(MaterialPageRoute(
              //     //     builder: (context) => Dashboard_List()));
              //   },
              // ),
              // Divider(color: ColorName.graybox,thickness: 2,),
              // ListTile(
              //   leading: Image.asset("assets/Menu_Icon/all_order.png",width: 140,height: 40),
              //   // minLeadingWidth: 200,
              //   title: const Text('All Orders',style: TextStyle(
              //       color: Colors.black,
              //       fontSize: 16.0,
              //       fontFamily: 'Metropolis',
              //       fontWeight: FontWeight.w600
              //   ),),
              //   onTap: () {
              //     // Navigator.of(context).push(MaterialPageRoute(
              //     //     builder: (context) => Dashboard_List()));
              //   },
              // ),
            ],
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
}









//
// import 'package:flutter/material.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:user_citycorner/CustomWidget/CustomColors.dart';
// import 'package:user_citycorner/Home_Screens/Menu_Screen/ChangePassword_Screen.dart';
// import 'package:user_citycorner/Home_Screens/Menu_Screen/Reports_Screen.dart';
// import 'package:user_citycorner/Home_Screens/Profile_Screen.dart';
// import 'package:user_citycorner/Login/Login_Screen.dart';
// import 'package:user_citycorner/My_Orders/My_Orders_Screen.dart';
//
//
// class DrawerScreen extends StatelessWidget {
//
//   late AnimationController _drawerSlideController;
//
//   List<String> DrawerItem = ["Menu", "My Orders","Support","Settings","Log Out"];
//   List<String> DrawerIcons = ["assets/DrawerIcon/Food_Menu.png", "assets/DrawerIcon/My_Order.png","assets/DrawerIcon/Support_Icon.png","assets/DrawerIcon/Setting_Icon.png","assets/DrawerIcon/logout_icon.png"];
//   late String user_id,full_name,email,mobile_number,role_id,token,status,strIP;
//   int _selectedIndex = -1;
//
//   DrawerScreen({super.key});
//
//   @override
//   void initState() {
//     user_id = GetStorage().read("user_id").toString();
//     full_name = GetStorage().read("full_name").toString();
//     email = GetStorage().read("email").toString();
//     mobile_number = GetStorage().read("mobile_number").toString();
//     role_id = GetStorage().read("role_id").toString();
//     token = GetStorage().read("token").toString();
//     status = GetStorage().read("status").toString();
//     strIP = GetStorage().read("strIP").toString();
//     print("$user_id,\n$full_name,\n$email,\n$mobile_number,\n$role_id,\n$token,\n$status,\n$strIP");
//     // TODO: implement initState
//   }
//
//   @override
//   void dispose() {
//     _drawerSlideController.dispose();
//   }
//
//   void openDrawer() {
//     _drawerSlideController.forward();
//   }
//
//   void closeDrawer() {
//     _drawerSlideController.reverse();
//   }
//
//
//   void _onItemTapped(int index) {
//     _selectedIndex = index;
//     print("_selectedIndex :"+_selectedIndex.toString());
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       width: MediaQuery
//           .of(context)
//           .size
//           .width / 1.5,
//       // shape: OutlineInputBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(50),bottomRight: Radius.circular(50))),
//       child: Container(
//         width: MediaQuery
//             .of(context)
//             .size
//             .width,
//         color: ColorName.white,
//         child: SafeArea(
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 25.0, bottom: 15),
//                 child: GestureDetector(
//                   onTap: (){
//                     Navigator.push(context,MaterialPageRoute(builder: (context)=>Profile_Screen()));
//                   },
//                   child: Container(
//                       height: 120,
//                       width: 120,
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           image: DecorationImage(image: AssetImage('assets/person.png')),
//                           border: Border.all(width: 2,
//                               color: ColorName.graybox,
//                               style: BorderStyle.solid)
//                       ),
//                       // child: Padding(
//                       //   padding: const EdgeInsets.all(8.0),
//                       //   child: Image.asset("assets/person.png",
//                       //       height: 80, width: 80),
//                       // )
//                   ),
//                 ),
//               ),
//               Text(full_name, style: TextStyle(color: ColorName.black,
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold),),
//               SizedBox(height: 20,),
//               Divider(color: ColorName.graybox, thickness: 1,),
//               Expanded(
//                 child: ListView.separated(
//                     scrollDirection: Axis.vertical,
//                     shrinkWrap: true,
//                     itemCount: DrawerItem.length,
//                     separatorBuilder: (context, index) {
//                       return Divider(
//                         height: 1, // Height of the divider
//                         color: ColorName.graybox, // Color of the divider
//                       );
//                     },
//                     itemBuilder: (context, index) {
//                       return InkWell(
//                         onTap: () {
//                           _onItemTapped(index);
//                           Navigator.pop(context);
//                         },
//                         child: InkResponse(
//                           containedInkWell: true,
//                           highlightColor: Colors.blue,
//                           // Change this to the desired highlight color
//                           splashColor: Colors.red,
//                           // Change this to the desired splash color
//                           child: Padding(
//                             padding: EdgeInsets.only(top: 15,bottom: 15),
//                             child: ListTile(
//                               onTap: (){
//                                 if(index == 0){
//                                   Navigator.pop(context);
//                                 }
//                                 else if(index == 1){
//                                   Navigator.of(context).push(MaterialPageRoute(
//                                       builder: (context) => My_Orders_Screen()));
//                                 }
//                                 else if(index == 2){
//                                   Navigator.of(context).push(MaterialPageRoute(
//                                       builder: (context) => Reports_Screen()));
//                                 }
//                                 else if(index == 3){
//                                   Navigator.of(context).push(MaterialPageRoute(
//                                       builder: (context) => ChangePassword_Screen()));
//                                 } else if(index == 4){
//                                   Navigator.pop(context);
//                                   showDialog(
//                                     context: context,
//                                     builder: (BuildContext context) =>
//                                         _buildPopupDialog(context),
//                                   );
//                                 }
//                               },
//                               leading:
//                               _selectedIndex == index?
//
//                               Image.asset(
//                                 DrawerIcons[index].toString(), width: 30,color: ColorName.logocolor,
//                                 height: 30,):
//                               Image.asset(
//                                 DrawerIcons[index].toString(), width: 30,color: ColorName.black,
//                                 height: 30,),
//                               title: Text(
//                                 DrawerItem[index],
//                                 style: TextStyle(
//                                     color: _selectedIndex == index
//                                         ? ColorName.logocolor
//                                         : ColorName.black,
//                                     fontWeight: FontWeight.w600
//                                   // Change the selected text color to green, and default text color to black
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       );
//                     }),
//               ),
//               // ListTile(
//               //   selectedColor: Colors.orange,
//               //   selectedTileColor: Colors.orange,
//               //   leading: Image.asset("assets/Menu_Icon/all_order.png",width: 140,height: 40,),
//               //   // minLeadingWidth: 5,
//               //   title: const Text('Dashboard',
//               //     style: TextStyle(
//               //       color: Colors.black,
//               //       fontSize: 16.0,
//               //       fontFamily: 'Metropolis',
//               //       fontWeight: FontWeight.w600
//               //     ),
//               //   ),
//               //   onTap: () {
//               //     // Navigator.of(context).push(MaterialPageRoute(
//               //     //     builder: (context) => Dashboard_List()));
//               //   },
//               // ),
//               // Divider(color: ColorName.graybox,thickness: 2,),
//               // ListTile(
//               //   leading: Image.asset("assets/Menu_Icon/all_order.png",width: 140,height: 40),
//               //   // minLeadingWidth: 200,
//               //   title: const Text('All Orders',style: TextStyle(
//               //       color: Colors.black,
//               //       fontSize: 16.0,
//               //       fontFamily: 'Metropolis',
//               //       fontWeight: FontWeight.w600
//               //   ),),
//               //   onTap: () {
//               //     // Navigator.of(context).push(MaterialPageRoute(
//               //     //     builder: (context) => Dashboard_List()));
//               //   },
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//   Widget _buildPopupDialog(BuildContext context) {
//     return new AlertDialog(
//       title: Container(
//         width: MediaQuery.of(context).size.width,
//         child: Text(
//           'Confirmation',
//           style: TextStyle(fontWeight: FontWeight.w800,color: ColorName.logocolor),
//         ),
//       ),
//       content: Text("Are you sure you want to logout ?"),
//       actions: [
//         TextButton(onPressed: (){Navigator.of(context).pop();},
//             child: Text("No", style: TextStyle(color: ColorName.logocolor),)),
//         TextButton(
//             onPressed: () async {
//               Navigator.pushReplacement(context,
//                   MaterialPageRoute(builder: (context)=> Login_Screen()));
//             },
//             child: Text("Yes",style: TextStyle(color: ColorName.logocolor),)),
//       ],
//     );
//   }
// }

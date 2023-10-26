import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:user_citycorner/ApiServices/ApiServices.dart';
import 'package:user_citycorner/CustomWidget/CustomAppBar.dart';
import 'package:user_citycorner/CustomWidget/CustomColors.dart';
import 'package:user_citycorner/CustomWidget/CustomRoundButton.dart';
import 'package:user_citycorner/Home_Screens/Menu_Screen/Order_Complete_Screen.dart';
import 'package:user_citycorner/Home_Screens/Menu_Screen/Special_Meals_Screen.dart';

class Your_Cart_Screen extends StatefulWidget {
  const Your_Cart_Screen({super.key});

  @override
  State<Your_Cart_Screen> createState() => _Your_Cart_ScreenState();
}

class _Your_Cart_ScreenState extends State<Your_Cart_Screen> {
  var YourCartListRes;
  List YourCartList = [];
  bool isloader = false;
  late String role_id,
      token,
      status,
      strIP,
      CustomerName,
      TotalAmount = "0",
      mobile_number;

  @override
  void initState() {
    role_id = GetStorage().read("role_id").toString();
    token = GetStorage().read("token").toString();
    status = GetStorage().read("status").toString();
    strIP = GetStorage().read("strIP").toString();
    mobile_number = GetStorage().read("mobile_number").toString();
    YourCartListApi();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CustomAppIconBar(
            ontap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Special_Meals_Screen()));
            },
            icon: Icon(Icons.arrow_back_ios),
            titlename: 'Your Cart',
            actionontap: () {},
            actionicon: 'assets/Menu_Icon/home_house.png',
          )),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: isloader == false
              ? Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                        color: ColorName.logocolor,
                      )))
              : Column(
                  children: [
                    if (YourCartList.length != 0) ...[
                      Expanded(
                        child: Container(
                          height: MediaQuery.of(context).size.height / 2,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border:
                                  Border.all(width: 1, color: ColorName.gray2)),
                          child: ListView.builder(
                            itemCount: YourCartList.length,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: InkWell(
                                  onTap: () {
                                    // Navigator.of(context).push(MaterialPageRoute(
                                    //     builder: (context) => Special_Meals_Screen()));
                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  YourCartList[index]
                                                          ['Product Image']
                                                      .toString()),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${YourCartList[index]['Quantity'].toString()} * ${YourCartList[index]['Product Name'].toString()}',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              '${YourCartList[index]['Quantity'].toString()} * \u{20B9} ${YourCartList[index]['Rate'].toString()} = \u{20B9} ${int.parse(YourCartList[index]['Quantity'].toString()) * int.parse(YourCartList[index]['Rate'].toString())}',
                                              style: TextStyle(
                                                  color: ColorName.Circlecolor,
                                                  fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.edit)),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.delete)),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                    SizedBox(
                      height: 3,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(width: 1, color: ColorName.gray2)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomborderButton(
                                onTap: () {},
                                backcolor: ColorName.logocolor,
                                text: 'Add more items',
                                textcolor: ColorName.logocolor,
                                width: 120),
                            Text(
                              'Total: \u{20B9} $TotalAmount',
                              style: TextStyle(
                                  color: ColorName.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    Container(
                      margin: EdgeInsets.only(
                          left: 10, right: 10, top: 10, bottom: 10),
                      alignment: Alignment.bottomCenter,
                      child: CustomSquareButton(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Order_Complete_Screen()));
                        },
                        backcolor: ColorName.logocolor,
                        text: 'Click To Confirm Order',
                        textcolor: ColorName.white,
                      ),
                    ),

                    // if (YourCartList.length != 0) ...[
                    //   Container(
                    //     margin: EdgeInsets.only(
                    //         left: 10, right: 10, top: 10, bottom: 10),
                    //     alignment: Alignment.bottomCenter,
                    //     child: CustomSquareButton(
                    //       onTap: () {
                    //         Navigator.of(context).push(MaterialPageRoute(
                    //             builder: (context) => Order_Complete_Screen()));
                    //       },
                    //       backcolor: ColorName.logocolor,
                    //       text: 'Click To Confirm Order',
                    //       textcolor: ColorName.white,
                    //     ),
                    //   ),
                    // ]
                  ],
                ),
        ),
      ),
    );
  }

  Future<void> YourCartListApi() async {
    Map<String, Object> jsonparam = Map();

    setState(() {
      jsonparam = {"mobile_number": mobile_number};
    });
    print("token ::> " + token);
    print(jsonparam);
    ApiService apiService = new ApiService();

    apiService.callYourCartListApi(jsonparam, token).then((value) => {
          setState(() {
            print("Your Cart Responce : " + value.toString());
            YourCartListRes = value;
            // YourCartListRes = json.decode(value);
            if (YourCartListRes['status'].toString() == "success") {
              setState(() {
                YourCartList = YourCartListRes["Your Cart"]["Products"];
                CustomerName =
                    YourCartListRes["Your Cart"]["Customer Name"].toString();
                TotalAmount =
                    YourCartListRes["Your Cart"]["Total Amount"].toString();
                print("Your Cart List : " + YourCartList.toString());
                print("Customer Name : " + CustomerName.toString());
                print("Total Amount : " + TotalAmount.toString());
              });
              isloader = true;
              Fluttertoast.showToast(
                  msg: YourCartListRes['message'].toString(),
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: ColorName.black,
                  textColor: ColorName.white,
                  fontSize: 16.0);
            } else {
              isloader = true;
              YourCartList = [];
              Fluttertoast.showToast(
                  msg: YourCartListRes['message'].toString(),
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: ColorName.black,
                  textColor: ColorName.white,
                  fontSize: 16.0);
            }
          }),
        });
  }

}

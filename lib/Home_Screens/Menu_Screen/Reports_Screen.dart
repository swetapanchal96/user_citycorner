import 'package:flutter/material.dart';
import 'package:user_citycorner/CustomWidget/CustomAppBar.dart';
import 'package:user_citycorner/CustomWidget/CustomColors.dart';
import 'package:user_citycorner/CustomWidget/CustomTextStyle.dart';
import 'package:user_citycorner/Home_Screens/Menu_Screen/Menu_Screen.dart';
import 'package:intl/intl.dart';


class Reports_Screen extends StatefulWidget {
  const Reports_Screen({super.key});

  @override
  State<Reports_Screen> createState() => _Reports_ScreenState();
}

class _Reports_ScreenState extends State<Reports_Screen> {
  var startdate_controller = new TextEditingController();
  var enddate_controller = new TextEditingController();
  var searchcontroller = new TextEditingController();
String formDate ="",toDate="";
bool isloader = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CustomAppIconBar(
            ontap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Menu_Screen()));
            },
            icon: Icon(Icons.arrow_back_ios),
            titlename: 'Reports',
            actionontap: () {},
            actionicon: 'assets/Menu_Icon/home_house.png',
          )),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 130,
                    height: 40,
                    alignment: Alignment.center,
                    child: TextFormField(
                      textAlignVertical: TextAlignVertical.center,
                      controller: startdate_controller,
                      // enabled: false,
                      decoration: InputDecoration(
                        fillColor: ColorName.logolightcolog,
                        filled: true,
                        isDense: true,
                        counterText: "",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide.none),
                        hintText: 'Form Date',
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2101));

                        if (pickedDate != null) {
                          print(
                              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                          formDate =
                              DateFormat('dd/MM/yyyy').format(pickedDate);
                          print(formDate); //formatted date output using intl package =>  2021-03-16
                          //you can implement different kind of Date Format here according to your requirement

                          setState(() {
                            startdate_controller.text =
                                formDate;
                            formDate =DateFormat('MM/dd/yyyy').format(pickedDate);
                          });
                        } else {
                          print("Date is not selected");
                        }
                      },
                      readOnly: true,
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                          fontFamily: 'Barlow',
                          color: ColorName.black,
                          fontSize: 17,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  Container(
                    width: 130,
                    height: 40,
                    alignment: Alignment.center,
                    child: TextFormField(
                      textAlignVertical: TextAlignVertical.center,
                      controller: enddate_controller,
                      // enabled: false,
                      decoration: InputDecoration(
                        fillColor: ColorName.logolightcolog,
                        filled: true,
                        isDense: true,
                        counterText: "",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide.none),
                        hintText: 'To Date',
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2101));

                        if (pickedDate != null) {
                          print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                          toDate = DateFormat('dd/MM/yyyy').format(pickedDate);
                          print(
                              toDate); //formatted date output using intl package =>  2021-03-16
                          //you can implement different kind of Date Format here according to your requirement

                          setState(() {
                            enddate_controller.text =
                                toDate;
                            toDate = DateFormat('MM/dd/yyyy').format(pickedDate);
                          });
                        } else {
                          print("Date is not selected");
                        }
                      },
                      readOnly: true,
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                          fontFamily: 'Barlow',
                          color: ColorName.black,
                          fontSize: 17,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0,bottom: 20.0),
                    child: Center(
                      child: Material(
                        color: ColorName.logocolor,
                        borderRadius: BorderRadius.circular(20),
                        child: InkWell(
                          borderRadius:BorderRadius.circular(20),
                          onTap: (){


                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                                vertical: 8,horizontal: 25),

                            decoration: new BoxDecoration(
                              borderRadius: (BorderRadius.circular(8)),
                            ),
                            child: Text(
                              'Search',
                              style: CustextStyle.loginbtntextsty,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Row(mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //
            //   ],
            // ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top: 10, bottom: 10),
                decoration: BoxDecoration(
                  color: ColorName.logolightcolog,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Container(

                          child: Text('Date',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: ColorName.Circlecolor)),
                          alignment: Alignment.center,
                        )),
                    Expanded(
                        child: Container(
                            alignment: Alignment.center,
                            child: Text('No. Of Order',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: ColorName.Circlecolor)))),
                    Expanded(
                        child: Container(
                            alignment: Alignment.center,
                            child: Text('Amount',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: ColorName.Circlecolor)))),
                  ],
                ),
              ),
            ),
            isloader == false
                ? Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(strokeWidth: 3)))
                : ReportList(),

          ],
        ),
      ),
    );
  }
  Widget ReportList() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0,bottom: 10.0),
        child: Container(
          height: EdgeInsetsGeometry.infinity.vertical,
          child: ListView.builder(
              itemCount: 50,
              itemBuilder: (context, index) {
                return Card(
                  child: InkWell(
                    onTap: (){

                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: ColorName.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                                color: ColorName.gray2,
                                offset: Offset(1, 2),
                                blurRadius: 5)
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Container(
                                  // alignment: Alignment.centerLeft,
                                    child: Text(
                                      '21-10-2023',
                                      textAlign: TextAlign.center,
                                      style:
                                      TextStyle(color: ColorName.black, fontSize: 14),
                                    ))),
                            Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Container(
                                    // alignment: Alignment.centerLeft,
                                      child: Text(
                                       '10',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: ColorName.black, fontSize: 14),
                                      )),
                                )),
                            Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Container(
                                    // alignment: Alignment.centerLeft,
                                      child: Text(
                                        '2000',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: ColorName.black, fontSize: 14),
                                      )),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}

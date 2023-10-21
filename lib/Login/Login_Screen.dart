import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_citycorner/ApiServices/ApiServices.dart';
import 'package:user_citycorner/CustomWidget/CustomColors.dart';
import 'package:user_citycorner/CustomWidget/CustomTextName.dart';
import 'package:user_citycorner/CustomWidget/CustomTextStyle.dart';
import 'package:user_citycorner/CustomWidget/CustomboxDecoration.dart';
import 'package:user_citycorner/Home_Screens/Menu_Screen/Menu_Screen.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController MobilenoController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  bool passwordVisible = true;
  var loginres;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0,right: 20.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: CusboxDecoration.loginbox,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Center(
                              child: Text(
                                CustextName.login,
                                style: CustextStyle.logintextsty,
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: MobilenoController,
                            cursorColor: Colors.blue,
                            maxLines: 1,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            keyboardType: TextInputType.number,
                            maxLength: 10,

                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              labelText: CustextName.mobileno,
                            ),
                            style: TextStyle(color: Colors.black),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter ${CustextName.mobileno}";
                              }
                              if(value.length != 10){
                                return "Please Enter valid ${CustextName.mobileno}";
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            controller: PasswordController,
                            cursorColor: Colors.blue,
                            obscureText: passwordVisible,
                            maxLines: 1,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              labelText: CustextName.password,
                              suffixIcon: IconButton(
                                icon: Icon(passwordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    passwordVisible = !passwordVisible;
                                  });
                                },
                              ),
                              alignLabelWithHint: false,
                            ),
                            style: TextStyle(color: Colors.black),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter ${CustextName.password}";
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30.0,bottom: 30.0),
                            child: Center(
                              child: Material(
                                color: ColorName.logocolor,
                                borderRadius: BorderRadius.circular(20),
                                child: InkWell(
                                  borderRadius:BorderRadius.circular(20),
                                  onTap: (){
                                    if (_formkey.currentState!.validate()) {
                                      setState(() {
                                        showLoaderDialog(context);
                                        login(MobilenoController.text.toString(),
                                            PasswordController.text.toString());
                                      });
                                    } else {
                                      return null;
                                    }
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    width: MediaQuery.of(context).size.width,
                                    decoration: new BoxDecoration(
                                      borderRadius: (BorderRadius.circular(8)),
                                    ),
                                    child: Text(
                                      CustextName.login,
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
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<void> login(String mobileno, String password) async {
    Map<String, Object> jsonparam = Map();

    setState(() {

      jsonparam = {"mobile_number": mobileno, "password": password};

      GetStorage().write("mobile_number", mobileno.toString());
      GetStorage().write("password", password.toString());
    });

    print(jsonparam);

    ApiService apiService = new ApiService();

    apiService.callloginApi(jsonparam).then((value) => {
      setState(() async {
        print("Res" + value.toString());
        loginres = value;
        if (loginres['status'] == "1") {
          Navigator.pop(context);
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setBool('isLogin', true);
          GetStorage().write("user_id", loginres['user']['id'].toString());
          GetStorage().write("full_name", loginres['user']['full_name'].toString());
          GetStorage().write("email", loginres['user']['email'].toString());
          GetStorage().write("mobile_number", loginres['user']['mobile_number'].toString());
          GetStorage().write("role_id", loginres['user']['role_id'].toString());
          GetStorage().write("token", loginres['authorisation']['token'].toString());
          GetStorage().write("status", loginres['user']['status'].toString());
          GetStorage().write("strIP", loginres['strIP'].toString());

            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Menu_Screen()));

        } else {
          Navigator.pop(context);
          Fluttertoast.showToast(
              msg: loginres['message'].toString(),
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

  showLoaderDialog(context) {
    AlertDialog alert = AlertDialog(alignment: Alignment.center,
      content: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          Container(margin: EdgeInsets.only(left:8), child: Text("Loading...",textAlign: TextAlign.center,)),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}

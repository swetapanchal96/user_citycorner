import 'package:flutter/material.dart';
import 'package:user_citycorner/CustomWidget/CustomAppBar.dart';
import 'package:user_citycorner/CustomWidget/CustomColors.dart';
import 'package:user_citycorner/CustomWidget/CustomTextStyle.dart';
import 'package:user_citycorner/Home_Screens/Menu_Screen/Categories_Screen.dart';

class ChangePassword_Screen extends StatefulWidget {
  const ChangePassword_Screen({super.key});

  @override
  State<ChangePassword_Screen> createState() => _ChangePassword_ScreenState();
}

class _ChangePassword_ScreenState extends State<ChangePassword_Screen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final OldPasswordController = new TextEditingController();
  final NewPasswordController = new TextEditingController();
  final ConfirmPasswordController = new TextEditingController();
  FocusNode OldPasswordFocus = FocusNode();
  FocusNode NewPasswordFocus = FocusNode();
  FocusNode ConfirmPasswordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CustomAppwithoutactionBar(
            ontap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Categories_Screen()));
            },
            icon: Icon(Icons.arrow_back_ios),
            titlename: 'Change Password',
          )),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  cursorColor: ColorName.logocolor,
                  focusNode: OldPasswordFocus,
                  controller: OldPasswordController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      fillColor: ColorName.logocolor.withOpacity(0.1),
                      filled: true,
                      isDense: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              BorderSide(width: 1, color: ColorName.logocolor)),
                      hintText: 'Old Password',
                      label: Text('Old Password'),
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                      prefixIcon: Container(
                        // padding: EdgeInsets.all(5),
                        child: Icon(
                          Icons.lock,
                          color: ColorName.logocolor,
                        ),
                        width: 18,
                      )),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Old Password";
                    }
                  },
                  onChanged: (value) {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  cursorColor: ColorName.logocolor,
                  controller: NewPasswordController,
                  focusNode: NewPasswordFocus,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      fillColor: ColorName.logocolor.withOpacity(0.1),
                      filled: true,
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      hintText: 'New Password',
                      label: Text('New Password'),
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                      prefixIcon: Container(
                        // padding: EdgeInsets.all(5),
                        child: Icon(
                          Icons.lock,
                          color: ColorName.logocolor,
                        ),
                        width: 18,
                      )),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter New Password";
                    }
                  },
                  onChanged: (value) {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  cursorColor: ColorName.logocolor,
                  controller: ConfirmPasswordController,
                  focusNode: ConfirmPasswordFocus,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      fillColor: ColorName.logocolor.withOpacity(0.1),
                      filled: true,
                      isDense: true,
                      focusColor: ColorName.logolightcolog,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      hintText: 'Confirm Password',
                      label: Text('Confirm Password'),
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                      prefixIcon: Container(
                        // padding: EdgeInsets.all(5),
                        child: Icon(
                          Icons.lock,
                          color: ColorName.logocolor,
                        ),
                        width: 18,
                      )),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Confirm Password";
                    }

                    if (NewPasswordController.text.toString() != value) {
                      return "Please Enter Valid Password";
                    }
                  },
                  onChanged: (value) {},
                ),
              ),
              Expanded(child: SizedBox()),
              Padding(
                padding: const EdgeInsets.only(
                    top: 30.0, bottom: 20.0, left: 12, right: 12),
                child: Center(
                  child: Material(
                    color: ColorName.logocolor,
                    borderRadius: BorderRadius.circular(20),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        if (_formkey.currentState!.validate()) {

                        }else{
                          return null;
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        width: MediaQuery.of(context).size.width,
                        decoration: new BoxDecoration(
                          borderRadius: (BorderRadius.circular(8)),
                        ),
                        child: Text(
                          'Save Password',
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
    );
  }
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:self_love/blocs/components/common_form.dart';
import 'package:self_love/blocs/components/constants.dart';
import 'package:self_love/blocs/components/profile_list_item.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var _fullNameController= TextEditingController();
  var _emailController= TextEditingController();
  var _mobileNumberController= TextEditingController();
  var _passwordController= TextEditingController();
  var _confirmPasswordController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(gradient: kPrimaryGradiantColor),
        child: Column(
          children: [
            SizedBox(height: kSpacingUnit.w *6),
            Text('Sign Up', style:TextStyle(fontWeight: FontWeight.w800, fontSize: 30)),
            SizedBox(height: kSpacingUnit.w *3),
            Flexible(
              child: Column(
                children: [
                  Container(
                    height: kSpacingUnit.w *8,
                    width: kSpacingUnit.w *8,
                    // margin: EdgeInsets.only(top: kSpacingUnit.w *1),
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: kSpacingUnit.w *4,
                          backgroundImage: AssetImage('assets/images/avatar.png'),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child:InkWell(
                            child: Container(
                              height: kSpacingUnit.w *2.5,
                              width: kSpacingUnit.w *2.5,
                              decoration: BoxDecoration(
                                  color: Colors.green.shade800,
                                  shape: BoxShape.circle
                              ),
                              child: Icon(Icons.open_in_new,
                                color: kBackgroundColor,
                                size: ScreenUtil().setSp(kSpacingUnit.w *1.5),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Flexible(

                    child: ListView(
                      padding: EdgeInsets.fromLTRB(
                        50, MediaQuery.of(context).size.height * 0.07, 60, 0),
                      children: [

                        SizedBox(
                            height: 40,
                            child: reUsableTextField('Enter Full Name', Icons.person,
                                false, _fullNameController)),
                        SizedBox(height: 15),
                        SizedBox(
                            height: 40,
                            child: reUsableTextField('Enter Contact Number', Icons.phone_android,
                                false, _mobileNumberController)),
                        SizedBox(height: 15),
                        SizedBox(
                            height: 40,
                            child: reUsableTextField('Enter Valid Email', Icons.email,
                                false, _emailController)),
                        SizedBox(height: 15),
                        SizedBox(
                            height: 40,
                            child: reUsableTextField('Enter Password', Icons.lock,
                                true, _passwordController)),
                        SizedBox(height: 15),
                        SizedBox(
                            height: 40,
                            child: reUsableTextField('Confirm Password', Icons.lock,
                                true, _confirmPasswordController)),
                        SizedBox(height: 55),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .05,
                          width: MediaQuery.of(context).size.width * .5,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14.0),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                            ),
                            child: Text('Sign Up',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            onPressed: () {
                              print(_fullNameController.text.toString());
                              Fluttertoast.showToast(
                                  msg: 'Upcoming',
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 4,
                                  backgroundColor: Colors.green.shade200,
                                  textColor: Colors.black,
                                  fontSize: 16.0
                              );
                              // FirebaseAuth.instance
                              //     .createUserWithEmailAndPassword(
                              //     email: _emailController.text,
                              //     password: _passController.text)
                              //     .then((value) {
                              //   Navigator.pushNamed(context, '/dashboard_categories');
                              // }).onError((error, stackTrace) {
                              //   print(error);
                              // });
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Already a member?',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, color:kTextBaseColor),
                                textAlign: TextAlign.center),
                            TextButton(onPressed: (){
                              Navigator.pushNamed(context, '/sign_in_screen');
                            }, child: Text('Sign In',  style: TextStyle(
                                fontWeight: FontWeight.bold, color:kPrimaryColor),))
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}

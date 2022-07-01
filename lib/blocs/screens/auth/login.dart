import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:self_love/blocs/components/common_button_arguments.dart';
import 'package:self_love/blocs/components/common_form.dart';

import '../../components/constants.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  var _emailController = TextEditingController();
  var _passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(gradient: kPrimaryGradiantColor),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                30, MediaQuery.of(context).size.height * 0.16, 50, 0),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/dove.png',
                  fit: BoxFit.cover,
                  width: 140,
                  height: 140,
                  color: Colors.white,
                ),
                SizedBox(height: 25),
                SizedBox(
                    height: 45,
                    child: reUsableTextField('Enter Your Email', Icons.email,
                        false, _emailController)),
                SizedBox(height: 25),
                SizedBox(
                    height: 45,
                    child: reUsableTextField('Enter Your Password', Icons.lock,
                        true, _passController)),
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
                    child: Text('Sign In',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    onPressed: () {
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: _emailController.text,
                              password: _passController.text)
                          .then((value) {
                            Navigator.pushNamed(context, '/dashboard_categories');
                      }).onError((error, stackTrace) {
                        print(error);
                      });
                    },
                  ),
                ),
                // CommonButtonArguments(
                //     buttontext: 'Sign In', argumentData: [], screenName: '')
              ],
            ),
          ),
        ),
      ),
    );
  }
}

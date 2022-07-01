import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:self_love/blocs/components/common_button_arguments.dart';
import 'package:self_love/blocs/components/constants.dart';
import 'package:self_love/blocs/components/size_config.dart';

class InitialOne extends StatelessWidget {
  final nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        // appBar: AppBar(),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:   [
                SizedBox(
                  height: 150,
                ),
                // /image in a circle shaped
                SizedBox(
                  height: 110,
                  child: Image.asset(
                    "assets/images/dove.png",
                  ),
                ),
                SizedBox(
                  height: 50,
                ),

                Text(
                  "Hi! beautiful conscious you!",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kTextColor),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 300,
                  child: TextField(
                    textAlign: TextAlign.center,
                    cursorColor: kPrimaryColor,
                    controller: nameController,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor),
                      ),
                        hintText: 'What\'s your name? ',
                        hintStyle: TextStyle(fontSize: 15, color: kTextColor),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                CommonButtonArguments(buttontext: 'Submit', argumentData: [nameController.text], screenName: '/initial_two'),
                SizedBox(height: 10),
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
               //  SizedBox(
               //    width: 220,
               //    child: FlatButton(
               //      textColor: kTextColor,
               // color: kPrimaryLightColor,
               // child: Text('Next'),
               //      onPressed: (){
               //      Navigator.pushNamed(context, '/initial_two', arguments: nameController.text);
               //      },
               //    ),
               //  ),
                // SizedBox(
                //   height: SizeConfig.screenHeight * 0.06,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

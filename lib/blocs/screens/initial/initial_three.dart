import 'package:flutter/material.dart';
import 'package:self_love/blocs/components/common_button_arguments.dart';
import 'package:self_love/blocs/components/constants.dart';

class InitialThreeScreen extends StatefulWidget {
  const InitialThreeScreen({Key? key}) : super(key: key);
  @override
  State<InitialThreeScreen> createState() => _InitialThreeScreenState();
}

class _InitialThreeScreenState extends State<InitialThreeScreen> {
  int genderValue = 0;
  String nameValue = '';
  final descController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)!.settings.arguments != null) {
      final args = ModalRoute.of(context)!.settings.arguments as List;
      genderValue = args[0];
      nameValue = args[1].toString();
    }
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     nameValue,
      //     style: TextStyle(color: Colors.black),
      //   ),
      //   backgroundColor: Colors.white,
      // ),
      backgroundColor: kBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Will you share what you want to make it happen faster?',
            style: TextStyle(color: kTextColor, fontSize: 20),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          SizedBox(
            width: 320,
            child: TextField(
              textAlign: TextAlign.center,
              cursorColor: kPrimaryColor,
              controller: descController,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor),
                ),
                  hintText: 'What do you really really want in life?',
                  hintStyle: TextStyle(fontSize: 15, color: kTextColor),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          CommonButtonArguments(buttontext: 'Next', argumentData: [descController.text, nameValue, genderValue], screenName: '/initial_four')

        ],
      ),
    );
  }
}

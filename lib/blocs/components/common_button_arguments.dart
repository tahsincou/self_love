import 'package:flutter/material.dart';
import 'package:self_love/blocs/components/constants.dart';

class CommonButtonArguments extends StatelessWidget {
  CommonButtonArguments(
      {Key? key,
      required this.buttontext,
      required this.argumentData,
      required this.screenName})
      : super(key: key);
  String buttontext;
  String screenName;
  List argumentData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 220,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(Colors.green.shade200),
        ),
        child: Text(
          buttontext,
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        onPressed: () {
          Navigator.pushNamed(context, screenName, arguments: argumentData);
        },
      ),
    );
  }
}

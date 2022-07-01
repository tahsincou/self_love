import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:self_love/blocs/components/common_button_arguments.dart';
import 'package:self_love/blocs/components/constants.dart';

class SubscriptionOfferScreen extends StatefulWidget {
  const SubscriptionOfferScreen({Key? key}) : super(key: key);

  @override
  State<SubscriptionOfferScreen> createState() =>
      _SubscriptionOfferScreenState();
}

class _SubscriptionOfferScreenState extends State<SubscriptionOfferScreen> {
  int genderValue = 0;
  String nameValue = '';
  String descriptionValue = '';
  List<String> _selected_box = [];
  String myStringWithLinebreaks = "Line 1\nLine 2\nLine 3";
  List<String> packagesName = [
    'Enjoy your first 3 days. It\'s free',
    'Cancel anytime from the app',
    'Affirmations that resonate with you',
    'Categories for any situations',
    '3 days FREE trial!',
    'Only \$1.66/month, billed annually'
  ];
  @override
  Widget build(BuildContext context) {
    // if (ModalRoute.of(context)!.settings.arguments != null) {
    //   final args = ModalRoute.of(context)!.settings.arguments as List;
    //   descriptionValue = args[0].toString();
    //   nameValue = args[1].toString();
    //   genderValue = args[2];
    // }
    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: Column(
          children: [
            SizedBox(height: 80),
            ListView.builder(
              shrinkWrap: true,
              itemCount: packagesName.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.check_circle),
                  title: Text(
                    '${packagesName[index]}',
                    style: TextStyle(color: kTextColor),
                  ),
                );
              },
            ),
            SizedBox(height: 50),
            Text('3 days free, then just \$19.99/year',
                textAlign: TextAlign.center),
            const SizedBox(height: 15),
            CommonButtonArguments(
                buttontext: 'Continue',
                argumentData: [],
                screenName: '/sign_up_screen'),
            SizedBox(height: 10),
            // InkWell(
            //   onTap: () {},
            //   child:const Text('Already a member?',
            //       style: TextStyle(
            //           fontWeight: FontWeight.bold, color:kTextBaseColor),
            //       textAlign: TextAlign.center),
            // ),
          ],
        ));
  }
}

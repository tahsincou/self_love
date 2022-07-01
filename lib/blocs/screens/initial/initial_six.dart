import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:self_love/blocs/components/common_button_arguments.dart';
import 'package:self_love/blocs/components/constants.dart';

class InitialSixScreen extends StatefulWidget {
  const InitialSixScreen({Key? key}) : super(key: key);

  @override
  State<InitialSixScreen> createState() => _InitialSixScreenState();
}

class _InitialSixScreenState extends State<InitialSixScreen> {
  int genderValue = 0;
  String nameValue = '';
  String descriptionValue = '';
  List<String> _selected_box = [];
  double opacity = 1.0;
  @override
  void initState() {
    super.initState();
    changeOpacity();
  }

  changeOpacity() {
    Future.delayed(Duration(seconds: 4), () {
      setState(() {
        opacity = opacity == 0.0 ? 1.0 : 0.0;
        changeOpacity();
      });
    });
  }
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Thank you for sharing',
            style: TextStyle(color: kTextBaseColor, fontSize: 16),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Center(
            child: SizedBox(
              width: 250.0,
              height: 60,
              child:
              Stack(children: <Widget>[
                AnimatedOpacity(
                  opacity: opacity,
                  duration: Duration(seconds: 5),
                  child:  Text(
                    'Like to receive our best offer to help you with this',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)
                    ,
                  ),
                )
              ]),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 300,
            child: TextField(
              textAlign: TextAlign.center,
              // controller: nameController,
              decoration: InputDecoration(
                  hoverColor: kPrimaryColor,
                  hintText: 'Fill in your email',
                  hintStyle: TextStyle(fontSize: 15)),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          CommonButtonArguments(
              buttontext: 'Explore Your Own Way',
              argumentData: [
                descriptionValue,
                nameValue,
                genderValue,
              ],
              screenName: '/subscription_offer')

        ],
      ),
    );
  }
}

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_limited_checkbox/flutter_limited_checkbox.dart';
import 'package:self_love/blocs/components/common_button_arguments.dart';
import 'package:self_love/blocs/components/constants.dart';

class InitialFourScreen extends StatefulWidget {
  const InitialFourScreen({Key? key}) : super(key: key);

  @override
  State<InitialFourScreen> createState() => _InitialFourScreenState();
}

class _InitialFourScreenState extends State<InitialFourScreen> {
  int genderValue = 0;
  String nameValue = '';
  String descriptionValue = '';
  // bool _checked = false;

  List<String> goalWIthinMonthList = [
    'More peace within',
    'Inner child love healing',
    'Intimacy and security in a relationship ease',
    'Education (financially, personally)',
    'A dream house',
    'More money'
  ];

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

  List<String> _selectedGoalWithinMonth = [];
  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)!.settings.arguments != null) {
      final args = ModalRoute.of(context)!.settings.arguments as List;
      descriptionValue = args[0].toString();
      nameValue = args[1].toString();
      genderValue = args[2];
    }
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(children: <Widget>[
            AnimatedOpacity(
              opacity: opacity,
              duration: Duration(seconds: 5),
              child: Text(
                'Almost at the last question...\nWhat would you love to reach in a month?',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            )
          ]),
          SizedBox(height: 15),
          ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(5),
            children: goalWIthinMonthList
                .map((element) => CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    value: _selectedGoalWithinMonth.contains(element),
                    title: Row(
                      children: [
                        Flexible(
                          child: Text(
                            element,
                            textAlign: TextAlign.start,
                            style: TextStyle(color: kTextColor, fontSize: 16),
                          ),
                        ),
                      ],
                    ),

                    // subtitle: Text('test'),
                    activeColor: kBackgroundColor,
                    checkColor: Colors.green,
                    onChanged: (val) {
                      setState(() {
                        if (_selectedGoalWithinMonth.contains(element))
                          _selectedGoalWithinMonth.remove(element);
                        else
                          _selectedGoalWithinMonth.add(element);
                        // print(element);
                        // print(_selectedGoalWithinMonth);
                        // _checked = val!;
                      });
                    }))
                .toList(),
          ),
          SizedBox(height: 20),
          CommonButtonArguments(
              buttontext: 'Next',
              argumentData: [
                descriptionValue,
                nameValue,
                genderValue,
                _selectedGoalWithinMonth
              ],
              screenName: '/initial_five')

          // CheckboxListTile(
          //   value: _checked,
          //   title: Text(fruits[0].toString()),
          //   subtitle: Text('test'),
          //   secondary: Icon(Icons.apple, color: kTextWhiteColor),
          //   controlAffinity: ListTileControlAffinity.leading,
          //   onChanged: (value) {
          //     setState(() {
          //       _checked = value!;
          //     });
          //   },
          //   activeColor: Colors.green,
          //   checkColor: kTextWhiteColor,
          // ),
        ],
      ),
    );
  }
}

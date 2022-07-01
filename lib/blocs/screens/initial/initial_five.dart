import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_limited_checkbox/flutter_limited_checkbox.dart';
import 'package:self_love/blocs/components/common_button_arguments.dart';
import 'package:self_love/blocs/components/constants.dart';

class InitialFiveScreen extends StatefulWidget {
  const InitialFiveScreen({Key? key}) : super(key: key);

  @override
  State<InitialFiveScreen> createState() => _InitialFiveScreenState();
}

class _InitialFiveScreenState extends State<InitialFiveScreen> {
  int genderValue = 0;
  String nameValue = '';
  String descriptionValue = '';
  List<String> selectedGoalWithinMonthList =[];
  // bool _checked = false;

  List<String> needList = [
    'Peace',
    'A kinder connection with yourself',
    'Confidence',
  ];

  List<Map> availableHobbies = [
    {"name": "Foobball", "isChecked": false},
    {"name": "Baseball", "isChecked": false},
    {
      "name": "Video Games",
      "isChecked": false,
    },
    {"name": "Readding Books", "isChecked": false},
    {"name": "Surfling The Internet", "isChecked": false}
  ];
  List<Map> _selectedMap = [];
  List _selectedList= [];
  double opacity = 1.0;
  @override
  void initState() {
    super.initState();
    changeOpacity();
  }

  changeOpacity() {
    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        opacity = opacity == 0.0 ? 1.0 : 0.0;
        changeOpacity();
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)!.settings.arguments != null) {
      final args = ModalRoute.of(context)!.settings.arguments as List;
      descriptionValue = args[0].toString();
      nameValue = args[1].toString();
      genderValue = args[2];
      selectedGoalWithinMonthList = args[3];
    }
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 250.0,
            child:Stack(children: <Widget>[
              AnimatedOpacity(
                opacity: opacity,
                duration: Duration(seconds: 5),
                child:  Text(
                  'What do you need the most in your life right now?',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)
                  ,
                ),
              )
            ]),
          ),
          ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(5),
            children: availableHobbies
                .map((element) => CheckboxListTile(
                controlAffinity: ListTileControlAffinity.trailing,
                value: _selectedMap.contains(element),
                title: Text(
                    element["name"],
                  style: TextStyle(color: kTextColor, fontSize: 15),
                ),
                secondary: Icon(Icons.directions_bike, color: Colors.green),
                // subtitle: Text('test'),
                activeColor: kBackgroundColor,
                checkColor: Colors.green,
                onChanged: (val) {
                  setState(() {
                    if(_selectedMap.contains(element)) {
                      _selectedMap.remove(element);
                      _selectedList.remove(element['name']);
                    }
                    else {
                      _selectedMap.add(element);
                      _selectedList.add(element['name']);
                    };

                    print(_selectedList);
                  });
                }))
                .toList(),
          ),
          CommonButtonArguments(
              buttontext: 'Next',
              argumentData: [
                descriptionValue,
                nameValue,
                genderValue,
                selectedGoalWithinMonthList,
                _selectedMap
              ],
              screenName: '/initial_six')

        ],
      ),
    );
  }
}

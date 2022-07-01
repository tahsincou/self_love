
import 'package:flutter/material.dart';
import 'package:self_love/blocs/components/constants.dart';
import 'package:self_love/blocs/components/answer_common.dart';
import 'package:self_love/blocs/screens/initial/initial_one.dart';

class InitialTwoScreen extends StatefulWidget {
  const InitialTwoScreen({Key? key}) : super(key: key);

  @override
  State<InitialTwoScreen> createState() => _InitialTwoScreenState();
}

class _InitialTwoScreenState extends State<InitialTwoScreen> {
  String nameValue= '';
  @override
  Widget build(BuildContext context) {
    if(ModalRoute.of(context)!.settings.arguments != null){
      final args = ModalRoute.of(context)!.settings.arguments as List;
      nameValue= args[0].toString();
    }
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('Intial Two'),
        //   backgroundColor: kPrimaryColor,
        // ),
        backgroundColor: kBackgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        // Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        //   Icon(Icons.check_circle, color: Colors.green),
        //   Icon(Icons.clear, color: Colors.red)
        // ]),
        // Container(
        //   width: double.infinity,
        //   height: 130,
        //   margin: EdgeInsets.only(bottom: 10, left: 30, right: 30),
        //   padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        //   decoration: BoxDecoration(
        //       color: Colors.white,
        //       borderRadius: BorderRadius.circular(10)),
        //   child: Center(
        //     child: Text('Whats your gender?'),
        //   ),
        // ),
            Text('Whats your gender?', style: TextStyle(color: kTextColor, fontWeight: FontWeight.w800, fontSize: 25)),
        SizedBox(height: 20),
        AnswerCommon(answerOption:'Female',val: 1,widgetName: '/initial_three', customerName: nameValue),
        AnswerCommon(answerOption: 'Male',val: 2,widgetName: '/initial_three', customerName: nameValue),
        AnswerCommon(answerOption: 'Others',val: 3,widgetName: '/initial_three', customerName: nameValue),
        AnswerCommon(answerOption: 'Rather not to say',val: 4,widgetName: '/initial_three', customerName: nameValue),
          ],
        ));
  }

}
// final _questions = [
//   {
//     'question': 'Whats your gender?',
//     'answers': [
//       {'answerText': 'Male', 'score': 'male'},
//       {'answerText': 'Female', 'score': 'male'},
//       {'answerText': 'Others', 'score': 'male'},
//       {'answerText': 'Rather not to say', 'score': 'male'},
//     ],
//   },
//   {
//     'question': 'Whats your address?',
//     'answers': [
//       {'answerText': 'Male', 'score': 'male'},
//       {'answerText': 'Female', 'score': 'male'},
//       {'answerText': 'Others', 'score': 'male'},
//       {'answerText': 'Rather not to say', 'score': 'male'},
//     ],
//   },
//   {
//     'question': 'Whats your address?',
//     'answers': [
//       {'answerText': 'Male', 'score': 'male'},
//       {'answerText': 'Female', 'score': 'male'},
//       {'answerText': 'Others', 'score': 'male'},
//       {'answerText': 'Rather not to say', 'score': 'male'},
//     ],
//   },
// ];
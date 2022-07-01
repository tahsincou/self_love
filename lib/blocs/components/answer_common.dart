import 'package:flutter/material.dart';
import 'package:self_love/blocs/components/constants.dart';

class AnswerCommon extends StatefulWidget {
  AnswerCommon(
      {Key? key,
      required this.answerOption,
      required this.val,
      required this.widgetName,
      required this.customerName})
      : super(key: key);
  String answerOption;
  String widgetName;
  String customerName;
  int val;
  @override
  State<AnswerCommon> createState() => _AnswerCommonState();
}

class _AnswerCommonState extends State<AnswerCommon> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.green.shade200,
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(20)),
        child: Text(widget.answerOption, style: TextStyle(fontSize: 15, color: Colors.black)),
      ),
      onTap: () {
        Navigator.pushNamed(context, widget.widgetName,
            arguments: [widget.val, widget.customerName]);
      },
    );
  }
}

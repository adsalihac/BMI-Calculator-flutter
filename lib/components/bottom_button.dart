import 'package:flutter/material.dart';
import '../common/constants.dart';

class BottomButton extends StatelessWidget {

  final String name;
  final Function onPress;

  BottomButton({required this.name,  required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => const ResultPage()),
        // );
        onPress();
      },
      child: Container(
        alignment: Alignment.center,
        color: kBottomContainerColour,
        margin: const EdgeInsets.only(top: 10.0),
        padding: const EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: kBottomContainerHeight,
        child:  Text(name,  style: kLargeButtonLabelTextStyle,
        ),
      ),
    );
  }
}
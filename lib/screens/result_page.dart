import 'package:flutter/material.dart';

import '../common/constants.dart';
import '../components/reusable_card.dart';
import '../components/bottom_button.dart';

class ResultPage extends StatelessWidget {


  final String bmiResult;
  final String resultText;
  final String interpretation;

  ResultPage({required this.bmiResult , required this.resultText , required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Result'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              child: Container(
                padding: const EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: const Text('Your Result' , style: kTitleTextStyle,),
              )
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:  [
                  Text(resultText.toUpperCase() ,style: resultTextStyle ,),
                  Text(bmiResult , style: kBMITextStyle ,),
                  Text(interpretation.toLowerCase() ,  textAlign: TextAlign.center,  style: kBodyTextStyle ,)
                ],
              ),
              onPress: () {},
            ),
          ),
          BottomButton(
            name: 'RE-CALCULATE',
            onPress: () {
              Navigator.pop(context);
            },
          ),

        ],
      )
    );
  }
}

import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../common/functions.dart';
import '../components/icon_container.dart';
import '../components/reusable_card.dart';
import '../common/constants.dart';
import '../components/bottom_button.dart';
import '../components/round_icon_button.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColour = kInactiveCardColour;
  Color femaleCardColour = kInactiveCardColour;

  Gender selectedGender = Gender.male;

  int height = 180;
  int weight = 60;
  int age = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
            child: Row(
          children: [
            Expanded(
              child: ReusableCard(
                colour: selectedGender == Gender.male
                    ? kActiveCardColour
                    : kInactiveCardColour,
                cardChild: IconContainer(
                  icon: FontAwesomeIcons.mars,
                  label: 'MALE',
                ),
                onPress: () {
                  setState(() {
                    // updateColour(Gender.male);
                    selectedGender = Gender.male;
                  });
                },
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: selectedGender == Gender.female
                    ? kActiveCardColour
                    : kInactiveCardColour,
                cardChild: IconContainer(
                  icon: FontAwesomeIcons.venus,
                  label: 'FEMALE',
                ),
                onPress: () {
                  setState(() {
                    // updateColour(Gender.female);
                    selectedGender = Gender.female;
                  });
                },
              ),
            ),
          ],
        )),
        Expanded(
          child: ReusableCard(
            colour: kActiveCardColour,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'HEIGHT',
                  style: kLabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(height.toString(), style: kNumberLabelTextStyle),
                    const Text(
                      'cm',
                      style: kLabelTextStyle,
                    ),
                  ],
                ),
                Slider(
                  value: height.toDouble(),
                  min: 120.0,
                  max: 220.0,
                  // activeColor:  const Color(0xFFFFFFFF),
                  inactiveColor: const Color(0xFF8D8E98),
                  onChanged: (double value) {
                    setState(() {
                      height = value.round();
                    });
                  },
                ),
              ],
            ),
            onPress: () {},
          ),
        ),
        Expanded(
            child: Row(
          children: [
            Expanded(
              child: ReusableCard(
                colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'WEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Text(
                      weight.toString(),
                      style: kNumberLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                weight > 1 ? weight-- : weight;
                              });
                            }),
                        RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            }),
                      ],
                    )
                  ],
                ),
                onPress: () {},
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'AGE',
                      style: kLabelTextStyle,
                    ),
                    Text(
                      age.toString(),
                      style: kNumberLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: () {
                            setState(() {
                              age > 1 ? age-- : age;
                            });
                          },
                        ),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: () {
                            setState(() {
                              age++;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
                onPress: () {},
              ),
            ),
          ],
        )),
        BottomButton(
          name: 'CALCULATE',
          onPress: () {

            Functions fuc = Functions(height: height, weight: weight);
            // Navigator.pushNamed(context, '/result');
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  ResultPage(
                  bmiResult : fuc.calculateBMI(),
                  resultText : fuc.getResult(),
                  interpretation : fuc.getInterpretation(),
              )),
            );
          },
        ),
      ]),
    );
  }
}


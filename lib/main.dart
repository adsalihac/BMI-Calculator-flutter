import 'package:flutter/material.dart';
import 'screens/input_page.dart';
import 'package:bmi_calculator/screens/result_page.dart';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData.dark(), // dark theme
      // theme: ThemeData.light(), // light theme
      theme:
      // ThemeData(
      //   // custom Theme
      //   // primaryColor: const Color(0xFF0A0E21),
      //   colorScheme: ColorScheme.fromSwatch(
      //     primarySwatch:Colors.deepPurple,
      //   ).copyWith(
      //     secondary: Colors.purple,
      //   ),
      //   scaffoldBackgroundColor:Colors.purple,
      //   textTheme: const TextTheme(
      //     bodyText2: TextStyle(color: Color(0xFFFFFFFF)),
      //   ),
      // ),
      ThemeData.dark().copyWith(
        sliderTheme: SliderTheme.of(context).copyWith(
          activeTrackColor: Colors.white,
          thumbColor: const Color(0xFFEB1555),
          overlayColor:const Color(0x29EB1555),
          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15.0),
          overlayShape: const RoundSliderOverlayShape(overlayRadius: 25.0),
        ),
        primaryColor: const Color(0xFF0a0e21),
        scaffoldBackgroundColor: const Color(0xFF0a0e21),
      ),
      // home: const InputPage(),
      // Warning: When using initialRoute, don’t define a home property.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const InputPage(),
        // '/result': (context) => const ResultPage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
      },
    );
  }
}

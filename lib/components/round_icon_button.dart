import 'package:flutter/material.dart';
import '../common/constants.dart';


class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  RoundIconButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        onPressed();
      },
      constraints: const BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: const CircleBorder(),
      // shape:  RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(5.0)
      // ),
      fillColor: const Color(0xFF4C4F5E),
      child: Icon(icon),
      elevation: 0.0,
    );
  }
}

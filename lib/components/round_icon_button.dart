import 'package:flutter/material.dart';
import 'package:bmi_cal/constants.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({Key? key, required this.icon, required this.onPress})
      : super(key: key);
  final IconData icon;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      elevation: 0.0,
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
      child: Icon(icon),
    );
  }
}

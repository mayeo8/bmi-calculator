import 'package:flutter/material.dart';
import 'package:bmi_cal/constants.dart';

class BottomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String buttonText;

  const BottomButton(
      {super.key, required this.onTap, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: const Color(kBottomContainerColor),
        margin: const EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Center(
          child: Text(
            buttonText,
            style: kLargeButtonStyle,
          ),
        ),
      ),
    );
  }
}

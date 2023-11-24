import 'package:flutter/material.dart';
import '../constants.dart';

class IconReusableContent extends StatelessWidget {
  const IconReusableContent(
      {required this.text, required this.icon, super.key});
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(text, style: kLabelTextStyle)
      ],
    );
  }
}

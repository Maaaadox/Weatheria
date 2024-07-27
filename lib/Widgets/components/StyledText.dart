import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  const StyledText(this.text, this.family, this.size, this.weight, {super.key});
  final String text, family;
  final double size;
  final String weight;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: Colors.white,
          fontFamily: family,
          fontSize: size,
          fontWeight: weight == 'bold' ? FontWeight.bold : FontWeight.normal),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//a finir
class splashScreen extends StatelessWidget {
  const splashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width);
  }
}


import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weatheria/Widgets/components/StyledText.dart';

class InfoBox extends StatelessWidget {
  const InfoBox({
    super.key,
    required this.iconPath,
    required this.infoTitle,
    required this.infoValue,
  });
  final infoTitle;
  final iconPath;
  final infoValue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 155,
      child: Row(
        children: [
          Lottie.asset(iconPath, height: 50, width: 50),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StyledText(infoTitle, 'grillmaster', 14, 'normal'),
              StyledText(infoValue, 'PublicSans', 20, 'bold'),
            ],
          )
        ],
      ),
    );
  }
}

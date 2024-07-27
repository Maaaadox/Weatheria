import 'package:flutter/material.dart';
import 'package:weatheria/Widgets/components/StyledText.dart';

class DayTile extends StatelessWidget {
  const DayTile({
    super.key,
    required this.nextDays,
    required this.index,
  });
  final index;
  final List nextDays;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
            width: 55,
            child:
                StyledText(nextDays[index].day, 'grillmaster', 24, 'normal')),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.network(nextDays[index].icon),
                Positioned(
                    bottom: 10,
                    child: StyledText(
                        nextDays[index].condition, 'grillmaster', 10, 'normal'))
              ],
            )
          ],
        ),
        SizedBox(
          width: 123,
          child: Row(children: [
            StyledText(
                '${nextDays[index].maxTemp}°', 'PublicSans', 45, 'normal'),
            const StyledText('/', 'PublicSans', 25, 'normal'),
            StyledText(
                '${nextDays[index].minTemp}°', 'PublicSans', 20, 'normal'),
          ]),
        )
      ],
    );
  }
}

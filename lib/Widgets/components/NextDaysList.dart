
import 'package:flutter/material.dart';
import 'package:weatheria/Widgets/components/DayTile.dart';

class NextDaysList extends StatelessWidget {
  final nextDays;

  const NextDaysList({super.key, required this.nextDays});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (var i = 0; i < 7; i++) ...[
          DayTile(
            index: i,
            nextDays: nextDays,
          ),
          const Divider(),
        ],
      ],
    );
  }
}

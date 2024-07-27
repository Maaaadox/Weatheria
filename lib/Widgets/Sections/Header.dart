import 'package:flutter/material.dart';
import 'package:weatheria/Logic/functions.dart';
import 'package:weatheria/Widgets/components/StyledText.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.snapshot});
  final snapshot;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(hours: 1)),
      builder: (context, snapshotd) {
        if ((dateComparer(snapshot.data!.sunrise) < 0) &&
            (dateComparer('12:00') > 0)) {
          return const StyledText('Good Night', 'grillmaster', 32, 'normal');
        } else if ((dateComparer(snapshot.data!.sunrise) > 0) &&
            (dateComparer('13:00') < 0)) {
          return const StyledText('Good Morning', 'grillmaster', 32, 'normal');
        } else if ((dateComparer('18:00') < 0) && (dateComparer('13:00') > 0)) {
          return const StyledText(
              'Good Afternoon', 'grillmaster', 32, 'normal');
        } else if ((dateComparer('18:00') > 0)) {
          return const StyledText('Good Evening', 'grillmaster', 32, 'normal');
        } else {
          return Text(snapshot.data!.sunrise);
        }
      },
    );
  }
}

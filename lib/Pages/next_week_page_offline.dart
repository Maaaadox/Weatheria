import 'package:flutter/material.dart';
import 'package:weatheria/Widgets/components/Shimmer.dart';

class NextWeekOffline extends StatefulWidget {
  const NextWeekOffline({super.key});
  @override
  State<NextWeekOffline> createState() => _NextWeekOfflineState();
}

class _NextWeekOfflineState extends State<NextWeekOffline> {
  @override
  Widget build(BuildContext context) {
    return Shimmer(
      linearGradient: _shimmerGradient,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (var i = 0; i < 7; i++) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShimmerLoading(
                  isLoading: true,
                  child: Container(
                    width: 60,
                    height: 30,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(60, 0, 0, 0),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ShimmerLoading(
                      isLoading: true,
                      child: Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(60, 0, 0, 0),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ShimmerLoading(
                      isLoading: true,
                      child: Container(
                        width: 50,
                        height: 24,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(60, 0, 0, 0),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ],
                ),
                ShimmerLoading(
                  isLoading: true,
                  child: Container(
                    width: 130,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(60, 0, 0, 0),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ],
            ),
            const Divider(),
          ],
        ],
      ),
    );
  }
}

const _shimmerGradient = LinearGradient(
  colors: [
    Color.fromARGB(87, 255, 255, 255),
    Color.fromARGB(111, 244, 244, 244),
    Color.fromARGB(15, 255, 255, 255),
  ],
  stops: [
    0.1,
    0.3,
    0.4,
  ],
  begin: Alignment(-1.0, -0.3),
  end: Alignment(1.0, 0.3),
  tileMode: TileMode.clamp,
);

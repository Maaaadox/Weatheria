import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodaySection extends StatelessWidget {
  const TodaySection({super.key, required this.snapshot});
  final snapshot;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: StreamBuilder(
        stream: Stream.periodic(const Duration(hours: 1)),
        builder: (context, snap) {
          return Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.09),
                        border: const Border(
                            top: BorderSide(width: 0.5, color: Colors.white),
                            right: BorderSide(width: 0.5, color: Colors.white),
                            left: BorderSide(width: 0.5, color: Colors.white),
                            bottom:
                                BorderSide(width: 0.5, color: Colors.white)),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16))),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: ((context, index) {
                          return Container(
                              height: 120,
                              width: 80,
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16))),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      DateFormat('hh:mm a').format(
                                          DateTime.parse(snapshot
                                              .data!.hours[index]['time'])),
                                      style: const TextStyle(
                                          color:
                                              Color.fromRGBO(255, 255, 255, 1),
                                          fontFamily: 'PublicSans'),
                                    ),
                                    Image.network(
                                      'https:${snapshot.data!.hours[index]['condition']['icon']}',
                                      height: 55,
                                      width: 55,
                                    ),
                                    Text(
                                      '${snapshot.data!.hours[index]['temp_c'].toInt().toString()}°C',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'PublicSans'),
                                    )
                                  ],
                                ),
                              ));
                        }),
                        itemCount: (24)),
                  ),
                ),
              ));
        },
      ),
    );
  }
}

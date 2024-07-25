import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:weatheria/components/api_calls.dart';
import 'package:weatheria/components/weather.dart';
import 'package:weatheria/components/next_week_page_offline.dart';
import 'package:weatheria/components/widgets.dart';

import 'dart:async';

class NextDaysScreen extends StatefulWidget {
  final String? latitude;
  final String? longitude;
  const NextDaysScreen({super.key, this.latitude, this.longitude});

  @override
  State<NextDaysScreen> createState() => _NextDaysScreenState();
}

Future<ForecastWeather>? futureForecaast;

class _NextDaysScreenState extends State<NextDaysScreen> {
  late Map<String, dynamic> jsonTable = loadData() as Map<String, dynamic>;
  late var nextDays;

  Future<dynamic> loadData() async {
    String jsonString = await rootBundle.loadString('assets/descriptions.json');
    setState(() {
      jsonTable = jsonDecode(jsonString) as Map<String, dynamic>;
    });
    return jsonDecode(jsonString) as Map<String, dynamic>;
  }

  void buildNextDays(ForecastWeather? data) {
    nextDays = List.generate(
      7,
      (i) => NextDays(
        day: DateFormat('E').format(DateTime.parse(data?.day[i])),
        icon: jsonTable[data?.condition[i].toString()]['day']['image'],
        condition: jsonTable[data?.condition[i].toString()]['day']
            ['description'],
        minTemp: data!.minTemp[i].toInt().toString(),
        maxTemp: data.maxTemp[i].toInt().toString(),
      ),
    );
  }

  void initState() {
    super.initState();
    futureForecaast = fetchForecast(widget.latitude!, widget.longitude!);
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        Expanded(
            child: Container(
                padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                height: MediaQuery.of(context).size.height >= 965
                    ? MediaQuery.of(context).size.height
                    : null,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    gradient: SweepGradient(
                  colors: [Color(0xff000000), Color(0xff5725ea)],
                  stops: [0.5, 1],
                  center: Alignment(1.2, 0.9),
                )),
                child: Column(
                  children: [
                    Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: Colors.white,
                                      ),
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.arrow_back_ios_rounded,
                                          color: Colors.black,
                                        ),
                                        iconSize: 14,
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    const StyledText(
                                        'Back', 'grillmaster', 24, 'normal')
                                  ],
                                ),
                                const Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_month,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    StyledText('This Week', 'grillmaster', 24,
                                        'normal')
                                  ],
                                )
                              ],
                            ),
                          ),
                          Image.asset(
                            'assets/icons/2ndPageIcon.png',
                            height: 120,
                          )
                        ],
                      ),
                    ]),
                    Expanded(
                        child: MediaQuery.of(context).size.height >= 965
                            ? FutureBuilder<ForecastWeather>(
                                future: futureForecaast,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    buildNextDays(snapshot.data);
                                    return NextDaysList(nextDays: nextDays);
                                  }
                                  return const NextWeekOffline();
                                },
                              )
                            : SingleChildScrollView(
                                child: FutureBuilder<ForecastWeather>(
                                future: futureForecaast,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    buildNextDays(snapshot.data);
                                    return NextDaysList(nextDays: nextDays);
                                  }
                                  return const NextWeekOffline();
                                },
                              )))
                  ],
                ))),
      ],
    )));
  }
}

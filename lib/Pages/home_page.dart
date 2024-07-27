import 'dart:core';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weatheria/Logic/functions.dart';
import 'package:weatheria/Pages/home_page_offline.dart';
import 'package:weatheria/Widgets/components/GradientText.dart';
import 'package:weatheria/Widgets/components/InfoBox.dart';
import 'package:weatheria/Widgets/Sections/Header.dart';
import 'package:weatheria/Widgets/Sections/TodaySection.dart';
import 'package:weatheria/Widgets/components/StyledText.dart';
import 'package:weatheria/Pages/next_Days_page.dart';
import 'package:weatheria/Logic/api_calls.dart';
import 'package:weatheria/models/CurrentWeatherModel.dart';
import 'package:weatheria/models/SearchLocationModel.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

var isVisible = false;
var currentLatitude = "";
var currentLongitude = "";
Future<CurrentWeather>? futureWeather;

class _HomeScreenState extends State<HomeScreen> {
  OverlayEntry? entry;
  OverlayState? overlayState;

  refresh() {
    setState(() {});
  }

  void displayOverlay() {
    WidgetsBinding.instance.addPostFrameCallback((_) => showOverlay());
  }

  void hideOverlay() {
    entry?.remove();
    entry = null;
  }

  void showOverlay() {
    entry = OverlayEntry(
      builder: (context) => OverlayBanner(
          onBannerDismissed: () {
            hideOverlay();
          },
          notifyParent: refresh),
    );
    final overlay = Overlay.of(context);
    overlay.insert(entry!);
  }

  @override
  void initState() {
    super.initState();
    futureWeather = fetchWeather('');
    loadAsset();
    //a montrer splashscreen quand l'utilisateur execute l'application pour la premier fois
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height > 979
                ? MediaQuery.of(context).size.height
                : null,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xffeb9726),
                Color(0xff353555),
                Color(0xff1D1F36),
              ],
            )),
            child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 25, 16, 4),
                child: FutureBuilder<CurrentWeather>(
                    future: futureWeather,
                    builder: (context, snapshott) {
                      if (snapshott.hasData) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              child: Row(children: [
                                StyledText(
                                    '${snapshott.data?.name},${snapshott.data?.country}',
                                    'PublicSans',
                                    16,
                                    'normal'),
                                const Icon(
                                  Icons.arrow_outward_sharp,
                                  color: Colors.white,
                                  size: 15,
                                ),
                              ]),
                              onTap: () {
                                isVisible ? print("") : displayOverlay();
                                setState(() {
                                  isVisible = true;
                                });
                              },
                            ),
                            Header(snapshot: snapshott),
                            Center(
                              child: Lottie.asset(
                                  getAnimation(
                                      snapshott.data!.weatherCode
                                          .toString()
                                          .toLowerCase(),
                                      snapshott.data!.isDay),
                                  height: 300,
                                  width: 300),
                            ),
                            Center(
                              child: Column(
                                children: [
                                  StyledText(
                                      '${snapshott.data!.tempC.toInt()}°C',
                                      'PublicSans',
                                      60,
                                      'normal'),
                                  StyledText(
                                      snapshott.data!.weatherCode
                                          .toString()
                                          .toUpperCase(),
                                      'altero',
                                      14,
                                      'normal'),
                                  StreamBuilder(
                                    stream: Stream.periodic(
                                        const Duration(seconds: 1)),
                                    builder: (context, snapshot) {
                                      return StyledText(
                                          DateFormat('EEEE d, hh:mm a')
                                              .format(DateTime.now()),
                                          'PublicSans',
                                          14,
                                          'normal');
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const StyledText(
                                'Today', 'grillmaster', 18, 'normal'),
                            const SizedBox(
                              height: 30,
                            ),
                            TodaySection(snapshot: snapshott),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const GradientText(
                                      text: "Next days ",
                                      gradient: LinearGradient(colors: [
                                        Color(0xff8E66BA),
                                        Color(0xffC69B6E),
                                      ]),
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          fontFamily: 'grillmaster',
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(width: 10),
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: Colors.white,
                                      ),
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: Colors.black,
                                        ),
                                        iconSize: 14,
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    NextDaysScreen(
                                                        latitude:
                                                            currentLatitude,
                                                        longitude:
                                                            currentLongitude),
                                              ));
                                        },
                                      ),
                                    ),
                                  ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InfoBox(
                                      iconPath: 'assets/lottie/sunrise.json',
                                      infoTitle: "Sunrise",
                                      infoValue: snapshott.data!.sunrise),
                                  InfoBox(
                                      iconPath: 'assets/lottie/sunset.json',
                                      infoTitle: "Sunset",
                                      infoValue: snapshott.data!.sunset)
                                ],
                              ),
                            ),
                            const Divider(color: Colors.black),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InfoBox(
                                    iconPath: 'assets/lottie/wind.json',
                                    infoTitle: "Wind Kph",
                                    infoValue:
                                        snapshott.data!.windKph.toString()),
                                InfoBox(
                                    iconPath: 'assets/lottie/humidity.json',
                                    infoTitle: "Humidity",
                                    infoValue:
                                        "${snapshott.data!.humidity.toString()}%")
                              ],
                            ),
                            const Divider(color: Colors.black),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InfoBox(
                                    iconPath: 'assets/lottie/raindrops.json',
                                    infoTitle: "Precipitation",
                                    infoValue:
                                        "${snapshott.data!.precipMm.toInt()}%"),
                                InfoBox(
                                    iconPath: 'assets/lottie/rain.json',
                                    infoTitle: "Will it Rain",
                                    infoValue: '${snapshott.data!.willItRain}%')
                              ],
                            )
                          ],
                        );
                      }
                      return const HomePageOffline();
                    }))),
      ),
    );
  }
}

class OverlayBanner extends StatefulWidget {
  final Function() notifyParent;
  const OverlayBanner(
      {super.key, this.onBannerDismissed, required this.notifyParent});

  final VoidCallback? onBannerDismissed;

  @override
  State<OverlayBanner> createState() => _OverlayBannerState();
}

class _OverlayBannerState extends State<OverlayBanner>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  static const Curve curve = Curves.easeOut;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _playAnimation();
  }

  var locations = [];
  var sortedCities;
  var citiesNumber;
  final TextEditingController _SearchContoller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (context, child) {
        final double animationValue = curve.transform(_controller.value);
        return FractionalTranslation(
          translation: Offset(0, (1 - animationValue)),
          child: child,
        );
      },
      animation: _controller,
      child: Column(
        children: [
          GestureDetector(
            child: Container(
              color: Colors.transparent,
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            onTap: () {
              hide();
            },
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.8,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Material(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(
                      child: Text(
                        'Search Location',
                        style: TextStyle(
                            fontFamily: 'grillmaster',
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.black,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      //search bar
                      onChanged: (value) => {
                        setState(() {
                          sortedCities = (csvTable.where((row) =>
                              row[1] is String &&
                              row[1]
                                  .toLowerCase()
                                  .startsWith(value.toLowerCase()))).toList()
                            ..sort((a, b) => a.length.compareTo(b.length));
                          citiesNumber = (csvTable.where((row) =>
                              row[1] is String &&
                              row[1]
                                  .toLowerCase()
                                  .startsWith(value.toLowerCase()))).length;

                          citiesNumber >= 5
                              ? locations = List.generate(
                                  5,
                                  (i) => SearchLocation(
                                    city: sortedCities[i][0],
                                    country: sortedCities[i][4],
                                    lat: sortedCities[i][2],
                                    lng: sortedCities[i][3],
                                  ),
                                )
                              : locations = List.generate(
                                  citiesNumber.toInt(),
                                  (i) => SearchLocation(
                                    city: sortedCities[i][0],
                                    country: sortedCities[i][4],
                                    lat: sortedCities[i][2],
                                    lng: sortedCities[i][3],
                                  ),
                                );
                        }),
                      },
                      controller: _SearchContoller,
                      cursorColor: Colors.black12,
                      decoration: InputDecoration(
                          isDense: true,
                          contentPadding: const EdgeInsets.all(0),
                          fillColor: const Color(0xffe9e9eb),
                          filled: true,
                          suffixIcon: IconButton(
                              onPressed: () async {
                                var someVal;
                                try {
                                  await fetchWeather(_SearchContoller.value.text
                                          .toString())
                                      .then((result) {
                                    setState(() {
                                      someVal = result;
                                    });
                                  });
                                  futureWeather = fetchWeather(
                                      _SearchContoller.value.text.toString());
                                  // print(futureForecaast);
                                  widget.notifyParent();
                                  hide();
                                } on Exception catch (e) {
                                  widget.notifyParent();
                                  hide();
                                  return showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            content: const SizedBox(
                                                height: 125,
                                                width: 150,
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      "Specified Location Not Available",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontFamily:
                                                              'PublicSans',
                                                          fontSize: 18,
                                                          fontWeight: FontWeight
                                                              .normal),
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Text(
                                                      "Your specified location cannot be determined.",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontFamily:
                                                              'PublicSans',
                                                          fontSize: 14,
                                                          fontWeight: FontWeight
                                                              .normal),
                                                    )
                                                  ],
                                                )));
                                      });
                                }

                                // futureForecaast = fetchForecast(
                                //     Locations[i].lat, Locations[i].lng);
                              },
                              icon: const Icon(Icons.search)),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffe9e9eb)),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffe9e9eb)),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          labelText: 'Search ',
                          labelStyle: const TextStyle(color: Color(0xff86898c)),
                          floatingLabelBehavior: FloatingLabelBehavior.never),
                    ),
                  ),
                  if (citiesNumber != null && citiesNumber <= 5)
                    Container(
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            for (var i = 0; i < citiesNumber.toInt(); i++)
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 5, 10, 0),
                                child: Card(
                                  child: ListTile(
                                      contentPadding: const EdgeInsets.all(12),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      // tileColor:
                                      //     const Color.fromARGB(255, 87, 85, 85),
                                      onTap: () {
                                        futureWeather =
                                            fetchWeather(locations[i].city)
                                                .whenComplete(() {
                                          widget.notifyParent();
                                          hide();
                                        });
                                      },
                                      title: Text(
                                          '${locations[i].city}, ${locations[i].country}'),
                                      subtitle: Text(
                                          '${locations[i].lat}, ${locations[i].lng}')),
                                ),
                              )
                          ],
                        ),
                      ),
                    )
                  else if (citiesNumber != null && citiesNumber > 5)
                    Container(
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            for (var i = 0; i < 5; i++)
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 5, 10, 0),
                                child: Card(
                                  child: ListTile(
                                      contentPadding: const EdgeInsets.all(12),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      // tileColor:
                                      //     const Color.fromARGB(255, 87, 85, 85),
                                      onTap: () {
                                        futureWeather =
                                            fetchWeather(locations[i].city);

                                        widget.notifyParent();
                                        hide();
                                      },
                                      title: Text(
                                          '${locations[i].city}, ${locations[i].country}'),
                                      subtitle: Text(
                                          '${locations[i].lat}, ${locations[i].lng}')),
                                ),
                              )
                          ],
                        ),
                      ),
                    )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _playAnimation() async {
    // fist will show banner with forward.
    await _controller.forward();
    // wait for 3 second and then play reverse animation to hide the banner
  }

  void hide() async {
    // fist will show banner with forward.
    await _controller.reverse(from: 1);
    setState(() {
      isVisible = false;
    });
    widget.onBannerDismissed?.call();
    // wait for 3 second and then play reverse animation to hide the banner
  }
}

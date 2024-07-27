import 'dart:core';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weatheria/Widgets/components/Shimmer.dart';

class HomePageOffline extends StatefulWidget {
  const HomePageOffline({super.key});

  @override
  State<HomePageOffline> createState() => _HomePageOfflineState();
}

var isVisible = false;
var currentLatitude = "";
var currentLongitude = "";

class _HomePageOfflineState extends State<HomePageOffline> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(16, 25, 16, 4),
        child: Shimmer(
            linearGradient: _shimmerGradient,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerLoading(
                  isLoading: true,
                  child: Container(
                    width: 130,
                    height: 24,
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
                    width: 200,
                    height: 24,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(60, 0, 0, 0),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                Center(
                    child: Lottie.asset('assets/lottie/not-available.json',
                        width: 300, height: 300)),
                Center(
                  child: Column(
                    children: [
                      ShimmerLoading(
                        isLoading: true,
                        child: Container(
                          width: 200,
                          height: 60,
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
                          width: 80,
                          height: 20,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(60, 0, 0, 0),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ShimmerLoading(
                        isLoading: true,
                        child: Container(
                          width: 200,
                          height: 24,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(60, 0, 0, 0),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ShimmerLoading(
                  isLoading: true,
                  child: Container(
                    width: 80,
                    height: 24,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(60, 0, 0, 0),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ShimmerLoading(
                  isLoading: true,
                  child: Container(
                    height: 120,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(60, 0, 0, 0),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ShimmerLoading(
                          isLoading: true,
                          child: Container(
                            width: 100,
                            height: 24,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(60, 0, 0, 0),
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        ShimmerLoading(
                          isLoading: true,
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: const Color.fromARGB(60, 0, 0, 0),
                            ),
                          ),
                        ),
                      ]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 148,
                      child: Row(
                        children: [
                          ShimmerLoading(
                            isLoading: true,
                            child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(60, 0, 0, 0),
                                  borderRadius: BorderRadius.circular(5),
                                )),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                              const SizedBox(
                                height: 10,
                              ),
                              ShimmerLoading(
                                isLoading: true,
                                child: Container(
                                  width: 80,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(60, 0, 0, 0),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 148,
                      child: Row(
                        children: [
                          ShimmerLoading(
                            isLoading: true,
                            child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(60, 0, 0, 0),
                                  borderRadius: BorderRadius.circular(5),
                                )),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                              const SizedBox(
                                height: 10,
                              ),
                              ShimmerLoading(
                                isLoading: true,
                                child: Container(
                                  width: 80,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(60, 0, 0, 0),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const Divider(color: Color.fromARGB(60, 0, 0, 0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 148,
                      child: Row(
                        children: [
                          ShimmerLoading(
                            isLoading: true,
                            child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(60, 0, 0, 0),
                                  borderRadius: BorderRadius.circular(5),
                                )),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                              const SizedBox(
                                height: 10,
                              ),
                              ShimmerLoading(
                                isLoading: true,
                                child: Container(
                                  width: 80,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(60, 0, 0, 0),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 148,
                      child: Row(
                        children: [
                          ShimmerLoading(
                            isLoading: true,
                            child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(60, 0, 0, 0),
                                  borderRadius: BorderRadius.circular(5),
                                )),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                              const SizedBox(
                                height: 10,
                              ),
                              ShimmerLoading(
                                isLoading: true,
                                child: Container(
                                  width: 80,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(60, 0, 0, 0),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const Divider(color: Color.fromARGB(60, 0, 0, 0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 148,
                      child: Row(
                        children: [
                          ShimmerLoading(
                            isLoading: true,
                            child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(60, 0, 0, 0),
                                  borderRadius: BorderRadius.circular(5),
                                )),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                              const SizedBox(
                                height: 10,
                              ),
                              ShimmerLoading(
                                isLoading: true,
                                child: Container(
                                  width: 80,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(60, 0, 0, 0),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 148,
                      child: Row(
                        children: [
                          ShimmerLoading(
                            isLoading: true,
                            child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(60, 0, 0, 0),
                                  borderRadius: BorderRadius.circular(5),
                                )),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                              const SizedBox(
                                height: 10,
                              ),
                              ShimmerLoading(
                                isLoading: true,
                                child: Container(
                                  width: 80,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(60, 0, 0, 0),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            )));
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

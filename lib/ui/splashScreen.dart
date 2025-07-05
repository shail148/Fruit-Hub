import 'package:flutter/material.dart';
import 'dart:async';

import 'package:percent_indicator/circular_percent_indicator.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushNamed(context, '/welcomescreen');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/welcomeimg.png', height: 100),
            SizedBox(height: 20),
            Text(
              "Fruit Hub",
              style: TextStyle(
                fontSize: 24,
                color: Colors.orange,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 10,),
        CircularPercentIndicator(
          radius: 40.0,
          lineWidth: 4.0,
          animation: true,
          animationDuration: 2000,
          percent: 1.0, // 75%
          circularStrokeCap: CircularStrokeCap.round,
          backgroundColor: Colors.grey[300]!,
          progressColor: Colors.orange,
        ),
          ],
        ),
      ),
    );
  }
}

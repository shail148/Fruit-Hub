import 'package:flutter/material.dart';

class Welcomescreen extends StatelessWidget {
  const Welcomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height:
                MediaQuery.of(context).size.height / 1.6, // full screen height
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFFFFA451),
              //borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            child: Image.asset(
              'assets/images/welcomeimg.png',
              width: 150,
              height: 150,
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Get The Freshest Fruit Salad Combo",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  "We deliver the best and freshest fruit salad in town. Order for a combo today!!!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/auth');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFFA726), // Orange
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Let’s Continue",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

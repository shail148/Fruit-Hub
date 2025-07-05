import 'package:flutter/material.dart';

class TrackOrder extends StatefulWidget {
  const TrackOrder({super.key});

  @override
  State<TrackOrder> createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top bar with Go Back and Title
            Container(
              height: 180,
              color: Colors.orange,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    label: const Text(
                      'Go Back',
                      style: TextStyle(color: Colors.black),
                    ),
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 0,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    "My Order",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(flex: 2),
                ],
              ),
            ),

            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  _buildOrderStep(
                    context,
                    image: 'assets/images/taken.png',
                    text: "Order Taken",
                  ),
                  const SizedBox(height: 30),
                  _buildOrderStep(
                    context,
                    image: 'assets/images/prepared.png',
                    text: "Order is Being Prepared",
                  ),
                  const SizedBox(height: 30),
                  _buildOrderStep(
                    context,
                    image: 'assets/images/delivery.png',
                    text: "Order Is On The Way",
                  ),
                  const SizedBox(height: 30),

                  // Map Image
                  Image.asset(
                    'assets/images/map.png',
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    fit: BoxFit.cover,
                  ),

                  const SizedBox(height: 50),

                  // Order Received Step
                  Row(
                    children: const [
                      Icon(Icons.check_circle, size: 40, color: Colors.green),
                      SizedBox(width: 20),
                      Text(
                        "Order Received",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // Reusable step widget
  Widget _buildOrderStep(BuildContext context,
      {required String image, required String text}) {
    return Row(
      children: [
        Image.asset(image, height: 50, width: 50),
        const SizedBox(width: 20),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const Icon(Icons.check_circle, size: 30, color: Colors.green),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OrderComplete extends StatefulWidget {
  const OrderComplete({super.key});

  @override
  State<OrderComplete> createState() => _OrderCompleteState();
}

class _OrderCompleteState extends State<OrderComplete> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 80),
              Lottie.asset(
                'assets/animation/confirm_animation.json',
                height: 200,
                width: 200,
                repeat: false, // optional
              ),
              SizedBox(height: 20),
              Text(
                "Congratulations!!!",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
              ),
              SizedBox(height: 15),
              Text(
                "Your order have been taken and\n is being attended to",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: Color(0xFF2A254D)),
              ),
              SizedBox(height: 40),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 18),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/trackorder');
                  },
                  child: Text(
                    "Track Order",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              SizedBox(height: 50),
              SizedBox(
                width: 300,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                   side: BorderSide(color: Colors.orange),
                    padding: EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10),
                    )
                  ),
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(context,'/home' , (route)=>false);
                  },
                  child: Text(
                    "Continue Shopping",
                    style: TextStyle(color: Colors.orange, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

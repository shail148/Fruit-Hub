import 'package:flutter/material.dart';
import 'package:fruit_hub/fetch_photo.dart';
import 'package:fruit_hub/ui/authentication.dart';
import 'package:fruit_hub/ui/basket.dart';
import 'package:fruit_hub/ui/drawer_details.dart';
import 'package:fruit_hub/ui/homescreen.dart';
import 'package:fruit_hub/ui/login_screen.dart';
import 'package:fruit_hub/ui/order_complete.dart';
import 'package:fruit_hub/ui/product_details.dart';
import 'package:fruit_hub/ui/splashScreen.dart';
import 'package:fruit_hub/ui/track_order.dart';
import 'package:fruit_hub/ui/welcomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fruit Hub',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true, // optional: for modern styling
      ),
      initialRoute: '/home',
      routes: {
        '/splash': (context) => Splashscreen(),
        '/welcomescreen': (context) => const Welcomescreen(),
        '/auth': (context) => const Authentication(),
        '/login_screen': (context) => const LoginScreen(),
        '/home': (context) => const Homescreen(),
        '/product': (context) => ProductDetailsScreen(),
        '/basket': (context) => MyBasketScreen(),
        '/drawerdetails': (context) => DrawerDetails(),
        '/order_complete': (context) => OrderComplete(),
        '/trackorder': (context) => TrackOrder(),
        '/fetchPhoto': (context) => FetchPhoto(),
      },
    );
  }
}

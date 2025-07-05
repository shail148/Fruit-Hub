import 'package:flutter/material.dart';



class DrawerDetails extends StatefulWidget {
  const DrawerDetails({super.key});

  @override
  State<DrawerDetails> createState() => _DrawerDetailsState();
}

class _DrawerDetailsState extends State<DrawerDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(decoration: BoxDecoration(color: Colors.blue), child: null,),
              ListTile(leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: (){},
              ),
            ],
          )
      ),
    );
  }
}

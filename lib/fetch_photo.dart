import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FetchPhoto extends StatefulWidget {
  const FetchPhoto({super.key});

  @override
  State<FetchPhoto> createState() => _FetchPhotoState();
}

class _FetchPhotoState extends State<FetchPhoto> {
  String imageUrl = "";

  Future<void> getDogImageUrl() async {
    final url = "https://dog.ceo/api/breeds/image/random";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {









      final data = jsonDecode(response.body);
      final fetchedUrl = data['message'];

      setState(() {
        imageUrl = fetchedUrl;
      });

      print("Dog Image URL: $fetchedUrl");
    } else {
      print("Failed to fetch dog image");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dog Image URL with Button")),
      body: Padding(
        padding: const EdgeInsets.all(
            20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              imageUrl.isNotEmpty ? imageUrl : "Press the button to fetch image",
              textAlign: TextAlign.center,
            ),
            Expanded(child: Image.network(imageUrl)),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: getDogImageUrl,
              child: const Text("Get Image"),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

Widget FormBuildLevel (String text){
  return Padding(padding: EdgeInsets.only(top: 10,bottom: 6),
    child: Text(text, style: const TextStyle(
      color: Colors.black,
      fontSize: 12,
      fontWeight: FontWeight.bold,
    ),
    ),
  );
}

InputDecoration customInputDecoration (String hint){
  return InputDecoration(
    hintText: hint,
    hintStyle: TextStyle(color: Colors.grey),
    fillColor: const Color(0xFFF5F3F3),
    contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide.none,
    ),
  );
}
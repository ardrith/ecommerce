import 'package:ecommerce/VIEW/productview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TEST SIGOSOFT',
      theme: ThemeData(
        primarySwatch: Colors.red,
        textTheme: GoogleFonts.openSansTextTheme(), 
      ),
      home: AddProductPage(),
    );
  }
}

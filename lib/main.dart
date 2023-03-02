import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'views/pages/register_page.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.lato().fontFamily,
        primarySwatch: Colors.blueGrey,
      ),
      home: const RegisterPage(),
    );
  }
}

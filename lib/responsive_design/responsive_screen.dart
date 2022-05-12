import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'lib_me/constants.dart';
import 'lib_me/home/home.dart';

class responsivePage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
      ),
      home: HomeScreen(),
    );
  }
}
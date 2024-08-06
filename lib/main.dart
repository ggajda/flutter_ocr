import 'package:flutter/material.dart';

import 'pages/home_page.dart';

void main() {
  //runApp(const HomePage(title: '',));
  runApp(MaterialApp(
    theme: ThemeData(
      brightness: Brightness.dark,
    ),
    home: const HomePage(
      title: 'Home page',
    ),
    debugShowCheckedModeBanner: false,
  ));
}

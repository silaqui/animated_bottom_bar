import 'package:animated_bottom_bar/animated_bottom_bar.dart';
import 'package:flutter/material.dart';

import 'bottom_bar_navigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated BottomBar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BottomBarNavigation(),
    );
  }
}


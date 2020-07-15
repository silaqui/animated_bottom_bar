import 'package:animated_bottom_bar/bar_style.dart';
import 'package:flutter/material.dart';

import 'animated_bottom_bar.dart';
import 'bar_item.dart';

class BottomBarNavigation extends StatefulWidget {
  final List<BarItem> barItems = [
    BarItem(text: "Home", icon: Icons.home, color: Colors.indigo),
    BarItem(
        text: "Likes", icon: Icons.favorite_border, color: Colors.pinkAccent),
    BarItem(text: "Search", icon: Icons.search, color: Colors.yellow.shade900),
    BarItem(text: "Profile", icon: Icons.person_outline, color: Colors.teal),
  ];

  @override
  State<StatefulWidget> createState() => _BottomBarNavigationState();
}

class _BottomBarNavigationState extends State<BottomBarNavigation> {
  int selectedBar = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        color: widget.barItems[selectedBar].color,
      ),
      bottomNavigationBar: AnimatedBottomBar(
          barItems: widget.barItems,
          animationDuration: const Duration(milliseconds: 150),
          onBatTap: (index) {
            setState(() {
              selectedBar = index;
            });
          },
      barStyle: BarStyle(
          fontSize: 14.0,
          iconSize: 24.0,
          fontWeight: FontWeight.w600),),
    );
  }
}

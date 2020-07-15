import 'package:animated_bottom_bar/bar_item.dart';
import 'package:flutter/material.dart';

import 'bar_style.dart';

class AnimatedBottomBar extends StatefulWidget {
  final List<BarItem> barItems;
  final Duration animationDuration;
  final Function onBatTap;
  final BarStyle barStyle;

  const AnimatedBottomBar({
    this.barItems,
    this.animationDuration = const Duration(milliseconds: 200),
    this.onBatTap,
    this.barStyle,
  });

  @override
  _AnimatedBottomBarState createState() => _AnimatedBottomBarState();
}

class _AnimatedBottomBarState extends State<AnimatedBottomBar>
    with TickerProviderStateMixin {
  int selectedBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10.0,
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 24.0,
          top: 12.0,
          left: 12.0,
          right: 12.0,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _buildBarItems(),
        ),
      ),
    );
  }

  List<Widget> _buildBarItems() {
    List<Widget> _barItems = List();
    for (int i = 0; i < widget.barItems.length; i++) {
      BarItem item = widget.barItems[i];
      bool isSelected = selectedBarIndex == i;
      _barItems.add(
        InkWell(
          onTap: () {
            setState(() {
              selectedBarIndex = i;
              widget.onBatTap(selectedBarIndex);
            });
          },
          splashColor: Colors.transparent,
          child: AnimatedContainer(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            duration: widget.animationDuration,
            decoration: BoxDecoration(
                color: isSelected
                    ? item.color.withOpacity(0.15)
                    : Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Row(
              children: <Widget>[
                Icon(
                  item.icon,
                  color: isSelected ? item.color : Colors.black,
                  size: widget.barStyle.iconSize,
                ),
                if (isSelected) SizedBox(width: 10.0),
                AnimatedSize(
                  duration: widget.animationDuration,
                  vsync: this,
                  child: Text(
                    isSelected ? item.text : "",
                    style: TextStyle(
                        fontSize: widget.barStyle.fontSize,
                        color: item.color,
                        fontWeight: widget.barStyle.fontWeight),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }
    return _barItems;
  }
}

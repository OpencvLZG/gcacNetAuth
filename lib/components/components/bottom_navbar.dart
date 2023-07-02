import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../constant/constant.dart';

class BottomNavBar extends StatefulWidget {
  // const BottomNavBar({super.key});
  final Function(int) refreshPage;
  final int currentIndex;
  const BottomNavBar(
      {super.key, required this.refreshPage, required this.currentIndex});
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(splashColor: Colors.transparent),
      child: NavigationBar(
        height: 65,
        onDestinationSelected: (int index) {
          setState(() {
            currentIndex = index;
            widget.refreshPage(index);
          });
        },
        selectedIndex: widget.currentIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.network_cell),
            label: 'NetWork',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.supervised_user_circle),
            icon: Icon(Icons.supervised_user_circle),
            label: 'Self',
          ),
        ],
      ),
    );
  }
}

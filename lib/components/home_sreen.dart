import 'package:flutter/material.dart';
import 'package:gcac_net_auth/components/components/bottom_navbar.dart';
import 'package:gcac_net_auth/components/components/main_sreen/main_sreen.dart';
import 'package:gcac_net_auth/components/components/network_sreen/network_sreen.dart';
import 'package:gcac_net_auth/components/components/self_sreen/self_sreen.dart';

class HomeSreen extends StatefulWidget {
  const HomeSreen({super.key});

  @override
  State<HomeSreen> createState() => _HomeSreenState();
}

class _HomeSreenState extends State<HomeSreen> {
  List<Widget> pageSreens = [MainSreen(), NetWorkSreen(), SelfSreen()];
  Size size = MediaQueryData().size;
  int currentIndex = 0;
  void refreshPage(int value) {
    setState(() {
      currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageSreens[currentIndex],
      bottomNavigationBar: BottomNavBar(
        refreshPage: refreshPage,
      ),
    );
  }
}

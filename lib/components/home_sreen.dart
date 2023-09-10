import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gcac_net_auth/components/components/bottom_navbar.dart';
import 'package:gcac_net_auth/components/components/main_sreen/main_sreen.dart';
import 'package:gcac_net_auth/components/components/network_sreen/network_sreen.dart';
import 'package:gcac_net_auth/components/components/self_sreen/self_sreen.dart';

class HomeSreen extends StatefulWidget {
  const HomeSreen({super.key});

  @override
  State<HomeSreen> createState() => _HomeSreenState();
}

class _HomeSreenState extends State<HomeSreen> with TickerProviderStateMixin {
  final _pageController = PageController();
  // late AnimationController animationController;
  late AnimationController _animationController;
  late Animation<double> _animation;
  int _currentIndex = 0;

  @override
  void initState() {
    _animationController =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);
    _animation = Tween(begin: 0.8, end: 1.0).animate(_animationController);
    _animationController.forward();
    // _pageController.addListener(() {
    //   // if (_currentIndex != null) {
    //   // _animationController.reverse();
    //   // }

    //   // 播放当前页面动画
    //   _animationController.forward();
    //   // _animationController.reset();
    // });
    // _animationController.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     _animationController.reset();
    //   }
    // });
    super.initState();
  }

  void refreshPage(int value) {
    _animationController.reset();
    _animationController.forward();
    setState(() {
      _pageController.jumpToPage(value);
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
          // onPageChanged: ,
          controller: _pageController,
          onPageChanged: refreshPage,
          children: [
            ScaleTransition(scale: _animation, child: MainSreen()),
            ScaleTransition(scale: _animation, child: NetWorkSreen()),
            ScaleTransition(scale: _animation, child: SelfSreen()),
          ]),
      bottomNavigationBar: BottomNavBar(
        refreshPage: refreshPage,
        currentIndex: _currentIndex,
      ),
    );
  }
}

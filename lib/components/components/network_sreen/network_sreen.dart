import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gcac_net_auth/components/components/network_sreen/components/net_work_veiw.dart';
import 'package:gcac_net_auth/constant/constant.dart';

import '../modalDialog/inputDialog.dart';

import 'components/news_view.dart';

class NetWorkSreen extends StatefulWidget {
  const NetWorkSreen({super.key});

  @override
  State<NetWorkSreen> createState() => _NetWorkSreenState();
}

class _NetWorkSreenState extends State<NetWorkSreen> {
  final _pageController = PageController();
  List<String> categories = ["NetWork", "News", "NetAttack"];
  int _selectedIndex = 0;
  

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      child: Column(
        children: [
          // Container(
          //   // margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
          //   height: size.height * 0.1,
          //   child: ListView.builder(
          //     scrollDirection: Axis.horizontal,
          //     itemCount: categories.length,
          //     itemBuilder: (context, index) {
          //       return GestureDetector(
          //         onTap: () {
          //           setState(() {
          //             _selectedIndex = index;
          //             _pageController.jumpToPage(index);
          //           });
          //         },
          //         child: Container(
          //           child: Padding(
          //               padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
          //               child: Column(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: [
          //                   Text(
          //                     categories[index],
          //                     style: TextStyle(
          //                         color: _selectedIndex == index
          //                             ? KDeafultColor
          //                             : KDeafultColor.withOpacity(0.3),
          //                         fontSize: 30,
          //                         fontWeight: FontWeight.bold),
          //                   ),
          //                   Container(
          //                     width: 100,
          //                     height: 10,
          //                     decoration: BoxDecoration(
          //                         color: _selectedIndex == index
          //                             ? KDeafultColor
          //                             : KDeafultColor.withOpacity(0.3),
          //                         borderRadius: BorderRadius.circular(10)),
          //                   )
          //                 ],
          //               )),
          //         ),
          //       );
          //     },
          //   ),
          // ),
          Expanded(
              child: Container(
            color: Colors.blue[200],
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
                    child: Container(
                      decoration: BoxDecoration(
                          // image:
                          //     DecorationImage(
                          //   fit: BoxFit.cover,
                          //   image: AssetImage("assets/imgs/cil.jpg"),
                          // )
                          ),
                    )),
                Center(
                  child: Text(
                    "AccountManage",
                    style: TextStyle(
                        color: KDeafultFontColor2,
                        fontSize: 40,
                        fontWeight: KDefaultFontWeight),
                  ),
                )
              ],
            ),
          )),
          Container(
            height: size.height * 0.8,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Stack(
                children: [
                  NetWorkView(),
                  Positioned(
                      bottom: 10,
                      right: 10,
                      child: FloatingActionButton(
                        onPressed: () {
                          showInputDialog(context);
                        },
                        child: Icon(
                          Icons.add,
                          // color: Colors.blue[300],
                        ),
                      )),
                ],
              ),
              // child: PageView(
              //   controller: _pageController,
              //   children: [NetWorkView(), NetWorkView(), NetWorkView()],
              // ),
            ),
          ),
        ],
      ),
    );
  }
}

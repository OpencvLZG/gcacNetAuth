import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gcac_net_auth/constant/constant.dart';

class NetWorkView extends StatefulWidget {
  const NetWorkView({super.key});

  @override
  State<NetWorkView> createState() => _NetWorkViewState();
}

class _NetWorkViewState extends State<NetWorkView> {
  List<String> networkData = [
    "Hk -> Usa",
    "Hk -> Usa",
    "Hk -> Usa",
    "Hk -> Usa"
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: networkData.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(bottom: 15),
          height: 80,
          decoration: BoxDecoration(
            color: KDeafultColor.withOpacity(0.3),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text(
                  networkData[index],
                  style: KDefaultTextStylet,
                ),
              ],
            ),
          ),
        );
      },
    )
        .animate(delay: Duration(microseconds: 500))
        .fade()
        .moveX(begin: -100, end: 0, duration: Duration(milliseconds: 500));
  }
}

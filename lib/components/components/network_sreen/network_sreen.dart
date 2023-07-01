import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class NetWorkSreen extends StatefulWidget {
  const NetWorkSreen({super.key});

  @override
  State<NetWorkSreen> createState() => _NetWorkSreenState();
}

class _NetWorkSreenState extends State<NetWorkSreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
    );
  }
}

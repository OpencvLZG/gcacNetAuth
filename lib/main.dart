import 'dart:io';

import 'package:flutter/material.dart';

import 'components/home_sreen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GcacNetAuth',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeSreen(),
    );
  }
}

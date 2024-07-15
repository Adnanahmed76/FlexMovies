import 'package:flexmovies/home.dart';
import 'package:flexmovies/utilis/text.dart';
import 'package:flexmovies/widgets/toprated.dart';
import 'package:flexmovies/widgets/trending.dart';

import 'package:flutter/material.dart';


void main()=>runApp(new MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark,primaryColor: Colors.green),
      home: Home(),
    );
  }
}


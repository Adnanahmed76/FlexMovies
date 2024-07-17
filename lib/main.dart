import 'package:firebase_core/firebase_core.dart';
import 'package:flexmovies/home.dart';
import 'package:flexmovies/phone_home.dart';
import 'package:flexmovies/utilis/text.dart';
import 'package:flexmovies/widgets/toprated.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark,primaryColor: Colors.green),
      home: PhoneHome(),
    );
  }
}


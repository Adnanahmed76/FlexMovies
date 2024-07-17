import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class OtpPage extends StatefulWidget {
  final String vid;
  const OtpPage({super.key, required String vid, required this.vid});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  var code="";
  Signin()async{
PhoneAuthCredential credential=PhoneAuthProvider.credential(
  verificationId: widget.vid,
  smsCode: code
);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ListView(),
      ),
    );
  }
}
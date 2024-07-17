import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class PhoneHome extends StatefulWidget {
  const PhoneHome({super.key});

  @override
  State<PhoneHome> createState() => _PhoneHomeState();
}

class _PhoneHomeState extends State<PhoneHome> {
  TextEditingController phonenumber=TextEditingController();
  sendcode() async{
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+91' + phonenumber.text,
      
      verificationCompleted:  , verificationFailed: verificationFailed, codeSent: codeSent, codeAutoRetrievalTimeout: codeAutoRetrievalTimeout)
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Image.asset("assets/auth.jpg"),
          Center(child:Text("Phone Number",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w400),) ,)
        ],
      ),
    );
  }
}
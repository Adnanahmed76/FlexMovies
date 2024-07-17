import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class PhoneHome extends StatefulWidget {
  const PhoneHome({super.key});

  @override
  State<PhoneHome> createState() => _PhoneHomeState();
}

class _PhoneHomeState extends State<PhoneHome> {
  TextEditingController phonenumber=TextEditingController();
  sendcode() async{
 try {
     await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+91' + phonenumber.text,
      
      verificationCompleted:  (PhoneAuthCredential credential){}, verificationFailed: (FirebaseAuthException e){
        Get.snackbar("Error", e.code);
      }, codeSent: (String vid,int? token){
        Get.to(OtpPage(vid: vid));
      }, codeAutoRetrievalTimeout: (vid){

      });
 }
 on FirebaseAuthException catch(e){
  Get.snackbar("Error Occured", e.code);
 }
  catch (e) {
   Get.snackbar("Error", e.toString());
 }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Image.asset("assets/auth.jpg"),
          Center(child:Text("Phone Number",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w400),) ,),
          Padding(padding: EdgeInsets.symmetric(horizontal: 25,vertical: 6),
          child: Text("We Will send you an one time password on this mobile number"),
          ),
          SizedBox(
            height: 20,
          ),
          
        ],
      ),
    );
  }
  Widget phonetext(){
    return Padding(padding: EdgeInsets.symmetric(horizontal: 50),
    child: TextField(
      controller: phonenumber,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        prefix: Text("+91 "),
        prefixIcon: Icon(Icons.phone),
        labelText: "Enter Phone Number",
        hintStyle: TextStyle(color: Colors.grey),
        labelStyle: TextStyle(color: Colors.grey),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue
          )
        )
      ),
    ),
    );
  }
  Widget button(){
    return Center(
      child: ElevatedButton(onPressed: (){

      },style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        padding: EdgeInsets.all(16)
      ),
      child: Padding(padding: EdgeInsets.symmetric(horizontal: 90),
      child: Text(
        "Resend Otp",
        style: TextStyle(

        ),
      ),
      ),
      
      ),
    );
  }
}
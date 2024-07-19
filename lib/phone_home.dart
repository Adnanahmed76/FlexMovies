import 'package:firebase_auth/firebase_auth.dart';
import 'package:flexmovies/otp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class PhoneHome extends StatefulWidget {
  final String vid;
  const PhoneHome({super.key, required this.vid});

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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: ListView(
          children: [
            Image.asset("assets/auth.jpg"),
            Center(child:Text("Your Phone ! ",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w400),) ,),
            Padding(padding: EdgeInsets.symmetric(horizontal: 45,vertical: 10),
            child: Center(child: Text("    We Will send you an one time\n password on this mobile number",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300,color: Colors.white),)),
            ),
            SizedBox(
              height: 20,
            ),
            phonetext(),
            SizedBox(
              height: 40,
            ),
            button()
          ],
        ),
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
sendcode();
      },style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        padding: EdgeInsets.all(16)
      ),
      child: Padding(padding: EdgeInsets.symmetric(horizontal: 90),
      child: Text(
        "Recieve OTP",
        style: TextStyle(
color: Colors.white,fontSize: 20
        ),
      ),
      ),
      
      ),
    );
  }
}
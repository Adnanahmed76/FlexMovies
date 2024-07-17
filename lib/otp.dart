import 'package:firebase_auth/firebase_auth.dart';
import 'package:flexmovies/widgets/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
class OtpPage extends StatefulWidget {
  final String vid;
  const OtpPage({super.key,  required this.vid,});

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
try {
  await FirebaseAuth.instance.signInWithCredential(credential).then((value){
    Get.offAll(Wrapper());
  });
  
 } on FirebaseAuthException catch(e){
  Get.snackbar("Error Occured", e.code);
 } 
catch (e) {
  Get.snackbar("Error Ocured", e.toString());
}
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          children: [
            Image.asset("assets/verify.png",height: 350,width: 350,),
            Center(child: Text("Otp Verication",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),),
            Padding(padding: EdgeInsets.symmetric(horizontal: 25,vertical: 30),
            child: Text("Enter Your Otp"),
            ),
            SizedBox(height: 20,),
            textcode(),
            SizedBox(height: 80,),
            button()

          ],
        ),
      ),
    );
  }
  Widget textcode(){
    return Center(
      child: Padding(padding: EdgeInsets.all(6),
      child: Pinput(
        length: 6,
        onChanged: (value){
          setState(() {
            code=value;
          });
        },
      ),
      
      ),
    );
  }
  Widget button(){
    return Center(
      child: ElevatedButton(
        onPressed: (){
          Signin();
        },
        style: ElevatedButton.styleFrom(
backgroundColor: Colors.blue,
padding: EdgeInsets.all(16)
        ),
        child: Padding(padding: EdgeInsets.symmetric(horizontal: 80),
        child: Text("Veriry and proceed",style: TextStyle(fontSize: 18,
        
        color: Colors.white),),
        
        ),
      ),
    );
  }
}
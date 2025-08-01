// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  late String email;

  Future passwordReset() async {
    try{
      HapticFeedback.mediumImpact();
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email).then((value){
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              elevation: 0,
              backgroundColor: Color.fromRGBO(0, 120, 0, 1),
              content: Center(
                child: Text('Password link sent',
                  textAlign: TextAlign.center,
                  style:  TextStyle(
                      color: Colors.white
                  ),),
              ),)
        );
      });

    } on FirebaseAuthException catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            elevation: 0,
            backgroundColor: const Color(0xfffffbfe),
            content: Center(
              child: Text(error.message.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.red
                ),),
            ),));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(padding: const EdgeInsets.fromLTRB(20, 100, 20, 15),
            child: Text('Forgot Password?',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w800,
                  color: const Color.fromRGBO(0, 120, 0, 1)
              ),),),
          Padding(
            padding:  EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w),
            child: Text('Enter Your Email and we will send a password reset link',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.sp,
                )),
          ),
          ///
          ///
          ///
          Container(
            padding:
            EdgeInsets.symmetric(horizontal: 10.w, vertical: 0.5.h),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                return value!.length >= 2 ? null : 'Please enter email';
              },
              onChanged: (value) {
                email = value;
              },
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromRGBO(0, 120, 0, 1)),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromRGBO(0, 120, 0, 1)),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(0, 120, 0, 1)),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                hintText: 'Enter Your Email',
                prefixIcon: Icon(Icons.email_rounded,
                  color: Color.fromRGBO(0, 120, 0, 1),),
              ),
            ),
          ),
          SizedBox(height: 5.h,),
          ElevatedButton(
              onPressed: (){
                passwordReset();
              },
              style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  fixedSize: Size(80.w, 6.h), backgroundColor: const Color.fromRGBO(0, 120, 0, 1)),
              child:  Text('Send Link',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp
                ),))
        ],
      ),
    );
  }
}
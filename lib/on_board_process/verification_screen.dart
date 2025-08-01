import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../user_home_screen.dart';
import 'on_board_screen.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {

  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;

  Future sendVerificationEmail() async {
    try{
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
      setState(() {
        canResendEmail = false;
      });
      await Future.delayed(const Duration(seconds: 5));
      setState(() {
        canResendEmail = true;
      });

    }
    catch(e){
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar( SnackBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(0, 120, 0, 1),
        content: Center(
          child: Text(e.toString(),
            style: const TextStyle(
                color: Colors.white
            ),),
        ),));
    }
  }

  Future checkEmailVerified()async{

    await FirebaseAuth.instance.currentUser!.reload();

    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if(isEmailVerified){timer?.cancel();}

  }

  @override
  void initState() {
    super.initState();

    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if(!isEmailVerified){
      sendVerificationEmail();

      timer =  Timer.periodic(
          const Duration(seconds: 3),
              (_){
            checkEmailVerified();
          }
      );

    }

  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();

  }

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return isEmailVerified ? UserHomeScreen(user: auth.currentUser!,) : Scaffold(
      body: SizedBox(
        width: 100.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Padding(padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 3.w),
                  child: IconButton(
                    onPressed: (){
                      FirebaseAuth.instance.signOut();
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return const OnBoardScreen();
                      }));
                    },
                    icon:  Icon(
                      Icons.chevron_left,
                      color: const Color.fromRGBO(0, 120, 0, 1),
                      size: 24.sp,
                    ),
                  ),),
              ],
            ),
            const SizedBox(),
            const SizedBox(),
            const SizedBox(),
            const Icon(
              Icons.outgoing_mail,
              size: 150,
              color: Color.fromRGBO(0, 120, 0, 1),
            ),
            Text('Verify your email address',
              style: TextStyle(
                  fontSize: 18.sp,
                  color: const Color.fromRGBO(0, 120, 0, 1),
                  fontWeight: FontWeight.w800
              ),),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                'We have just send email verification link on your email. Please check email and click on that link to verify your Email address. \nIt could be in your Spam Folder!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color.fromRGBO(0, 120, 0, 1),
                  fontSize: 14.sp,

                ),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                'If not auto redirected after verification, click on the Continue button.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color.fromRGBO(0, 120, 0, 1),
                  fontSize: 14.sp,

                ),),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  fixedSize: Size(80.w, 6.h),
                  backgroundColor: const Color.fromRGBO(0, 120, 0, 1)),
              child: Text(
                'Continue',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                sendVerificationEmail();
              },
              child: Text('Resend E-Mail Link',
                style: TextStyle(
                    color: canResendEmail? Color.fromRGBO(0, 120, 0, 1) : Colors.grey,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w800
                ),
              ),
            ),
            const SizedBox(),
            const SizedBox(),
            const SizedBox(),
          ],
        ),
      ),
    );
  }
}

import 'package:babylon_internship_demo/on_board_process/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'login_screen.dart';

class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            title: 'Babylon International',
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              fontFamily: GoogleFonts.firaSans().fontFamily,
              appBarTheme: const AppBarTheme(
                  elevation: 0,
                  backgroundColor: Color(0xFFe4e2dd)
              ),
              useMaterial3: true,
            ),
            home: const ActualOnBoardScreen(),
          );
        }
    );
  }

}

class ActualOnBoardScreen extends StatelessWidget {
  const ActualOnBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.w),
              child: const Hero(
                  tag: 'onBoardLogo',
                  child:  Image(image: AssetImage('images/babylon_on_board_logo.png'))),
            ),

            Padding(
              padding:  EdgeInsets.only(bottom: 8.h),
              child: Column(
                children: [
                  signUpAndLoginButton((){
                    HapticFeedback.mediumImpact();
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return const LoginScreen();
                    }));
                  }, 'Login'),
                  signUpAndLoginButton((){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return const SignUpWithEmailScreen();
                    }));
                  }, 'Sign Up')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget signUpAndLoginButton(Function()? onTap, String text){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            fixedSize: Size(90.w, 6.h),
            backgroundColor: const Color.fromRGBO(0, 120, 0, 1),
          ),
          child: Text(
            text,

            style: TextStyle(
                color: const Color(0xFFe4e2dd),
                fontSize: 16.sp,
                fontWeight: FontWeight.w600
            ),
          )),
    );
  }
}
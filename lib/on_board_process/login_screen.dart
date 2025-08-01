
import 'package:babylon_internship_demo/on_board_process/verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final showSnackBar = const SnackBar(
    elevation: 0,
    backgroundColor: Color.fromRGBO(0, 120, 0, 1),
    content: Center(
      child: Text(''
          'Password or Email does not match',
        style: TextStyle(
            color: Colors.white
        ),),
    ),);
  final _auth = FirebaseAuth.instance;
  bool showPassword = true;
  bool checkShowBoxPassword = false;
  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();
  late String email;
  late String password;
  bool showPasswordReal = false;

  bool getCorrectShowPasswordBool(bool correctState) {
    if (correctState == false) {
      return showPassword = true;
    } else {
      return showPassword = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                //------------------------ image ----------------------------//
                SizedBox(
                  height: 40.h,
                  width: 80.w,
                  child: const Hero(
                    tag: 'onBoardLogo',
                    child: Image(
                      image: AssetImage('images/babylon_on_board_logo.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                //email textField
                Container(
                  padding:
                  EdgeInsets.symmetric(horizontal: 10.w, vertical: 0.5.h),
                  child: Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.disabled,
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
                ),

                //password textField
                Container(
                  padding:
                  EdgeInsets.symmetric(horizontal: 10.w, vertical: 0.5.h),
                  child: Form(
                    key: _formKey1,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: TextFormField(
                      validator: (value) {
                        return value!.length <= 6
                            ? null
                            : null;
                      },
                      obscureText:
                      getCorrectShowPasswordBool(showPasswordReal),
                      onChanged: (value) {
                        password = value;
                      },
                      decoration:  InputDecoration(
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color.fromRGBO(0, 120, 0, 1)),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color.fromRGBO(0, 120, 0, 1)),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color.fromRGBO(0, 120, 0, 1)),
                              borderRadius: BorderRadius.all(Radius.circular(10))),
                          prefixIcon: const Icon(Icons.key_rounded,
                            color: Color.fromRGBO(0, 120, 0, 1),),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                          hintText: 'Enter Password',
                          suffix: GestureDetector(
                            onTap: (){
                              HapticFeedback.mediumImpact();
                              setState(() {
                                if(showPasswordReal == false){
                                  showPasswordReal = true;
                                } else{
                                  showPasswordReal = false;
                                }
                              });
                            },
                            child:  showPasswordReal == false ? Icon(Icons.remove_red_eye_outlined,
                              size: 16.sp,
                              color: const Color.fromRGBO(0, 120, 0, 1),) : Icon(Icons.remove_red_eye,
                              size: 16.sp,
                              color: const Color.fromRGBO(0, 120, 0, 1),),
                          )
                      ),
                    ),
                  ),
                ),


                //sizedBox spacer
                Padding(
                  padding:  EdgeInsets.only(bottom: 5.h, left: 45.w, top: 1.5.h),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return const ForgotPasswordScreen();
                      }));
                    },
                    child: Text('Forgot Password?',
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w800,
                          color: const Color.fromRGBO(0, 120, 0, 1),
                          decorationColor: Color.fromRGBO(0, 120, 0, 1)
                      ),),
                  ),
                ),

                //Button to log in
                ElevatedButton(
                  onPressed: () async {
                    try{
                      final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
                      // ignore: unnecessary_null_comparison
                      if(user != null){
                        // ignore: use_build_context_synchronously
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return const VerificationScreen();
                        }));
                      }
                    }
                    catch(e){
                      if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(showSnackBar);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      fixedSize: Size(80.w, 6.h),
                      backgroundColor: const Color.fromRGBO(0, 120, 0, 1)),
                  child: Text('Log in',
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white
                    ),),),

              ],
            )
          ],
        ),
      ),
    );
  }
}
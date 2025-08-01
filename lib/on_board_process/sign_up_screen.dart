// ignore_for_file: unnecessary_null_comparison

import 'package:babylon_internship_demo/on_board_process/verification_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpWithEmailScreen extends StatefulWidget {
  const SignUpWithEmailScreen({super.key});

  @override
  State<SignUpWithEmailScreen> createState() => _SignUpWithEmailScreenState();
}

class _SignUpWithEmailScreenState extends State<SignUpWithEmailScreen> {
  final formkey = GlobalKey<FormState>();
  final formkey2 = GlobalKey<FormState>();
  final formkey0 = GlobalKey<FormState>();
  final formkey3 = GlobalKey<FormState>();
  final formkey5 = GlobalKey<FormState>();
  bool autoValidate = true;
  final _auth = FirebaseAuth.instance;
  bool showPassword = true;
  bool checkBoxShowPassword = false;
  late String email;
  late String password;
  late String retypedPassword;
  String displayName = '';
  late String firstName;
  late String lastName;
  // ignore: prefer_typing_uninitialized_variables
  var typedPhoneNumber = '';
  bool showPasswordReal = false;
  bool showPasswordConfirming = false;
  Widget? correctButton;

  bool getCorrectShowPasswordBool(bool correctState) {
    if (correctState == false) {
      return showPassword = true;
    } else {
      return showPassword = false;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // ignore: avoid_print
    print(typedPhoneNumber.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(children: [
          Column(
            children: [
              // image
              SizedBox(
                height: 20.h,
                child: const Hero(
                  tag: 'onBoardLogo',
                  child:  Image(
                    image: AssetImage('images/babylon_on_board_logo.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              // email textField
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left: 11.w),
                    child: const Text('Email*',
                      ),
                  ),
                  Container(
                    padding:
                    EdgeInsets.symmetric(horizontal: 8.w, vertical: 0.5.h),
                    child: Form(
                      onChanged: () {
                        setState(() {
                          getCorrectButton();
                        });
                      },
                      key: formkey0,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: TextFormField(
                        onTapOutside: (_){
                          FocusScope.of(context).unfocus();
                        },
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          return value!.length >= 2 && RegExp(r"^[0-9a-z@.!?-]+$").hasMatch(value)? null : 'Please enter email with no Capital Letter.';
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
                ],
              ),


              // spacer
              const SizedBox(height: 10,),

              //first name textField
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left: 11.w),
                    child: const Text('First Name*',
                     ),
                  ),
                  Container(
                    padding:
                    EdgeInsets.symmetric(horizontal: 8.w, vertical: 0.5.h),
                    child: Form(
                      onChanged: () {
                        setState(() {
                          getCorrectButton();
                        });
                      },
                      key: formkey3,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: TextFormField(
                        onTapOutside: (_){
                          FocusScope.of(context).unfocus();
                        },
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          return value!.length >= 2 ? null : 'Please enter your Name';
                        },
                        onChanged: (value) {
                          firstName = value;
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
                          hintText: 'Enter Your First Name',
                          prefixIcon: Icon(Icons.person,
                            color: Color.fromRGBO(0, 120, 0, 1),),
                        ),
                      ),
                    ),
                  ),
                ],
              ),


              // spacer
              const SizedBox(height: 10,),

              //last name textField
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left: 11.w),
                    child: const Text('Last Name*',
                      ),
                  ),
                  Container(
                    padding:
                    EdgeInsets.symmetric(horizontal: 8.w, vertical: 0.5.h),
                    child: Form(
                      onChanged: () {
                        setState(() {
                          getCorrectButton();
                        });
                      },
                      key: formkey5,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: TextFormField(
                        onTapOutside: (_){
                          FocusScope.of(context).unfocus();
                        },
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          return value!.length >= 2 ? null : 'Please enter your Last Name';
                        },
                        onChanged: (value) {
                          lastName = value;
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
                          hintText: 'Enter Your Last Name',
                          prefixIcon: Icon(Icons.person,
                            color: Color.fromRGBO(0, 120, 0, 1),),
                        ),
                      ),
                    ),
                  ),
                ],
              ),


              // spacer
              const SizedBox(height: 10,),




              //password textField
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left: 11.w),
                    child: const Text('Password*',
                      ),
                  ),
                  Container(
                    padding:
                    EdgeInsets.symmetric(horizontal: 8.w, vertical: 0.5.h),
                    child: Form(
                      onChanged: () {
                        setState(() {
                          getCorrectButton();
                        });
                      },
                      key: formkey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: TextFormField(
                        onTapOutside: (_){
                          FocusScope.of(context).unfocus();
                        },
                        validator: (value) {
                          return value!.length <= 6
                              ? 'Password must be greater than six characters'
                              : null;
                        },
                        obscureText:
                        getCorrectShowPasswordBool(showPasswordReal),
                        onChanged: (value) {
                          password = value;
                        },
                        decoration: InputDecoration(
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
                ],
              ),

              //2nd password textField
              Container(
                padding:
                EdgeInsets.symmetric(horizontal: 8.w, vertical: 0.5.h),
                child: Form(
                  onChanged: () {
                    setState(() {
                      getCorrectButton();
                    });
                  },
                  key: formkey2,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: TextFormField(
                    onTapOutside: (_){
                      FocusScope.of(context).unfocus();
                    },
                    validator: (value) {
                      return value!.characters == password.characters
                          ? null
                          : 'Passwords don\'t match';
                    },
                    obscureText:
                    getCorrectShowPasswordBool(showPasswordConfirming),
                    onChanged: (value) {
                      retypedPassword = value;
                    },
                    decoration: InputDecoration(
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
                        hintText: 'Confirm Password',
                        suffix: GestureDetector(
                          onTap: (){
                            HapticFeedback.mediumImpact();
                            setState(() {
                              if(showPasswordConfirming == false){
                                showPasswordConfirming = true;
                              } else{
                                showPasswordConfirming = false;
                              }
                            });
                          },
                          child:  showPasswordConfirming == false ? Icon(Icons.remove_red_eye_outlined,
                            size: 16.sp,
                            color: const Color.fromRGBO(0, 120, 0, 1),) : Icon(Icons.remove_red_eye,
                            size: 16.sp,
                            color: const Color.fromRGBO(0, 120, 0, 1),),
                        )
                    ),
                  ),
                ),
              ),


              //SizedBox spacer
              SizedBox(
                height: 3.h,
              ),

              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                      text: 'By continuing you agree to our ',
                      style: TextStyle(
                          fontSize: 12.sp
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Terms of Service ',
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: Color.fromRGBO(0, 120, 0, 1),
                                decoration: TextDecoration.underline,
                                decorationColor: Color.fromRGBO(0, 120, 0, 1)
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {

                              }
                        ),
                        TextSpan(
                          text: 'and ',
                          style: TextStyle(
                              fontSize: 12.sp
                          ),
                        ),
                        TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: Color.fromRGBO(0, 120, 0, 1),
                                decoration: TextDecoration.underline,
                                decorationColor: Color.fromRGBO(0, 120, 0, 1)
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {

                              }
                        ),
                      ]
                  ),),
              ),


              const SizedBox(height: 10,),


              //sign up button
              getCorrectButton()
            ],
          ),
        ]),
      ),
    );
  }

  Widget getCorrectButton() {
    if (formkey.currentState != null && formkey2 != null && formkey0 != null) {
      if (formkey0.currentState!.validate() &&
          formkey.currentState!.validate() &&
          formkey2.currentState!.validate() &&
          formkey3.currentState!.validate() &&
          formkey5.currentState!.validate()) {
        return ElevatedButton(
          onPressed: () async {
            displayName = '$firstName $lastName';
            try{
              final newUser = await _auth.createUserWithEmailAndPassword(
                  email: email, password: password);

              if (newUser != null) {
                await newUser.user?.updateDisplayName(displayName);
                //ignore: use_build_context_synchronously
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return const VerificationScreen();
                }));
              }
            }
            catch(e){
              // ignore: avoid_print
              print(e.toString());
            }
          },
          style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              fixedSize: Size(80.w, 6.h), backgroundColor: const Color.fromRGBO(0, 120, 0, 1)),
          child: Text(
            'Sign Up',
            style: TextStyle(fontSize: 16.sp, color: const Color(0xffe4e2dd)),
          ),
        );
      }
    }
    return ElevatedButton(
        onPressed: () {
          setState(() {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                elevation: 0,
                backgroundColor: Color.fromRGBO(0, 120, 0, 1) ,
                content: Card(
                  elevation: 0,
                  shape:  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  color:  Color.fromRGBO(0, 120, 0, 1),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(vertical: 10, horizontal:5 ),
                    child: Center(
                      child: Text(
                        'Please fill in the necessary details',
                        style:  TextStyle(
                          color: Colors.white,
                        ),),
                    ),
                  ),
                ),
              ),);
          });
        },
        style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            backgroundColor: Colors.grey, fixedSize: Size(80.w, 6.h)),
        child: Text(
          'Sign Up',
          style: TextStyle(color: Colors.white, fontSize: 16.sp),
        ));
  }



}
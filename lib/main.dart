import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'firebase_options.dart';
import 'on_board_process/on_board_screen.dart';
import 'on_board_process/verification_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value){
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>
      (stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot){
          if(snapshot.hasData){
            // return const UserLoggedInBefore();
            return const UserLoggedInBefore();
          } else {
            // user hasnt logged in before
            return const OnBoardScreen();
          }
        });
  }
}

class UserLoggedInBefore extends StatelessWidget {
  const UserLoggedInBefore({super.key});

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
            home:  const VerificationScreen(),
          );
        }
    );
  }
}

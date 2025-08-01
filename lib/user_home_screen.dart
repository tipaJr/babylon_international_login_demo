
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({
    super.key,
    required this.user,
  });

  final User user;

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(0, 120, 0, 1),
        automaticallyImplyLeading: false,
        title: Text('Home', style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 12,
          children: [
            Text('Hello, ${widget.user.displayName ?? widget.user.email},\nYou\'ve successfulyy logged in.', textAlign: TextAlign.center,),
            ElevatedButton(
              onPressed: ()async {
                final FirebaseAuth auth = FirebaseAuth.instance;
                auth.signOut();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(0, 120, 0, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Platform.isIOS ? 5: 10),
                )
              ),
              child: Text('Sign Out',
              style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}

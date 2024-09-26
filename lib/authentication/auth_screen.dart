import 'package:flutter/material.dart';
import 'package:viver/screens/mainpage.dart';
import 'package:viver/screens/sign.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CheckAuth extends StatefulWidget {
  const CheckAuth({super.key});

  @override
  State<CheckAuth> createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        if (snapshot.connectionState == ConnectionState.active) {
          User? user = snapshot.data;
          if (user != null) {
            return const MainPage();
          } else {
            return const SignPage();
          }
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}

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
  bool userIsAuthenticated = false;

  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (mounted) {
        setState(() {
          userIsAuthenticated = user != null;
        });
        if (user != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const MainPage()),
          );
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return userIsAuthenticated ? const MainPage() : const Sign();
  }
}

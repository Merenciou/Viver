// CORRIGIR AUTENTICAÇÃO
// CORRIGIR AUTENTICAÇÃO
// CORRIGIR AUTENTICAÇÃO
// CORRIGIR AUTENTICAÇÃO
// CORRIGIR AUTENTICAÇÃO
// CORRIGIR AUTENTICAÇÃO
// CORRIGIR AUTENTICAÇÃO
// CORRIGIR AUTENTICAÇÃO
// CORRIGIR AUTENTICAÇÃO
// CORRIGIR AUTENTICAÇÃO
// CORRIGIR AUTENTICAÇÃO
// CORRIGIR AUTENTICAÇÃO
// CORRIGIR AUTENTICAÇÃO
// CORRIGIR AUTENTICAÇÃO

import 'dart:async';

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

  Future<User?> keepConnected() {
    Completer<User?> completer = Completer<User?>();

    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        setState(() {
          userIsAuthenticated = false;
        });
      } else {
        setState(() {
          userIsAuthenticated = true;
        });
      }
    });
    return completer.future;
  }

  @override
  void initState() {
    keepConnected();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return userIsAuthenticated ? const MainPage() : const Sign();
  }
}

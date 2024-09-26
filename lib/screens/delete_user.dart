import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:viver/authentication/auth_service.dart';
import 'package:viver/screens/sign.dart';
import 'package:viver/warnings/warnings.dart';

final TextEditingController suggestionController = TextEditingController();

Future<void> getSuggestions() async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  User? user = auth.currentUser;
  CollectionReference userCollection = firestore.collection('Suggetions');

  if (user != null) {
    await userCollection.doc('${user.email}').set(
        {'suggestion': suggestionController.text}, SetOptions(merge: false));
  }
}

class DeleteUserPage extends StatefulWidget {
  const DeleteUserPage({super.key});

  @override
  State<DeleteUserPage> createState() => _DeleteUserPageState();
}

class _DeleteUserPageState extends State<DeleteUserPage> {
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Center(
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  height: 300,
                  child: SvgPicture.asset('lib/assets/images/delete_user.svg'),
                ),
                Text(
                  'Odeio despedidas...\nantes de ir, conte nos \no que não te agradou aqui',
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Form(
                    key: _keyForm,
                    child: SizedBox(
                      width: 280,
                      height: 70,
                      child: TextFormField(
                        controller: suggestionController,
                        style: Theme.of(context).textTheme.labelSmall,
                        decoration: InputDecoration(
                          errorStyle: GoogleFonts.montserrat(fontSize: 14),
                          label: Text(
                            'Opinião / Sugestão',
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                          labelStyle: TextStyle(
                              color: Theme.of(context).colorScheme.surface),
                          floatingLabelStyle: TextStyle(
                              color: Theme.of(context).colorScheme.primary),
                          filled: true,
                          fillColor:
                              Theme.of(context).colorScheme.primaryContainer,
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      getSuggestions();
                      AuthService().deleteUser();
                      Warnings.snackBarUserDeletedSucessful(context);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(200, 50),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        backgroundColor:
                            Theme.of(context).buttonTheme.colorScheme!.primary),
                    child: Text(
                      'Excluir Conta',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(200, 50),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        backgroundColor: Theme.of(context)
                            .buttonTheme
                            .colorScheme!
                            .onSecondary),
                    child: Text(
                      'Cancelar',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

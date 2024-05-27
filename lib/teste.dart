import 'package:flutter/material.dart';
import 'package:viver/controllers/user_model.dart';

class Teste extends StatefulWidget {
  const Teste({super.key});

  @override
  State<Teste> createState() => _TesteState();
}

class _TesteState extends State<Teste> {
  late Future<String?> nameFuture;
  @override
  void initState() {
    nameFuture = UserModel().getName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
            future: nameFuture,
            builder:
                (BuildContext context, AsyncSnapshot<String?> asyncSnapshot) {
              if (asyncSnapshot.connectionState == ConnectionState.done) {
                if (asyncSnapshot.hasData) {
                  return Text(asyncSnapshot.data!);
                } else {
                  return Text('${asyncSnapshot.error}');
                }
              } else {
                return const CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}

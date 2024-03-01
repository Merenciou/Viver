import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sign extends StatefulWidget {
  const Sign({super.key});

  @override
  State<Sign> createState() => _Sign();
}

class _Sign extends State<Sign> {
  final _formKey = GlobalKey<FormState>();
  bool signSwitch = true;
  bool showPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              child: SizedBox(
                width: 150,
                height: 140,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Stack(
                    children: [
                      Image.asset(
                        'lib/assets/images/logo/viver.png',
                        color: Theme.of(context).colorScheme.secondary,
                        width: 100,
                      ),
                      Positioned(
                        top: 80,
                        child: Text(
                          'Viver',
                          style: GoogleFonts.alice(
                              fontSize: 45,
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            signSwitch ? signIn() : signUp(),
            Form(
                key: _formKey,
                child: signSwitch ? signInForms() : signUpForms()),
            signSwitch ? signInButton() : signUpButton()
          ],
        ),
      ),
    );
  }

  Widget signIn() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: SizedBox(
        width: 310,
        height: 50,
        child: Stack(
          children: [
            Positioned(
              right: 1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(180, 50),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    backgroundColor:
                        Theme.of(context).colorScheme.secondaryContainer),
                onPressed: () {
                  setState(() {
                    signSwitch = false;
                  });
                },
                child: const Text('Cadastrar'),
              ),
            ),
            Positioned(
              left: 1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(180, 50),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    backgroundColor:
                        Theme.of(context).colorScheme.primaryContainer),
                onPressed: () {
                  setState(() {
                    signSwitch = true;
                  });
                },
                child: const Text('Entrar'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget signUp() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: SizedBox(
        width: 310,
        height: 50,
        child: Stack(
          children: [
            Positioned(
              left: 1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(180, 50),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20))),
                    backgroundColor:
                        Theme.of(context).colorScheme.primaryContainer),
                onPressed: () {
                  setState(() {
                    signSwitch = true;
                  });
                },
                child: const Text('Entrar'),
              ),
            ),
            Positioned(
              right: 1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(180, 50),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    backgroundColor:
                        Theme.of(context).colorScheme.secondaryContainer),
                onPressed: () {
                  signSwitch = false;
                },
                child: const Text('Cadastrar'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget signInForms() {
    return Column(
      children: [
        SizedBox(
          height: 60,
          child: TextFormField(
            decoration: InputDecoration(
                label: Text(
                  'Email',
                  style: GoogleFonts.montserrat(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 18),
                ),
                filled: true,
                fillColor: Colors.white,
                border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(10)))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: SizedBox(
            height: 60,
            child: TextFormField(
              obscureText: showPassword,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                      icon: Icon(
                        showPassword
                            ? Icons.remove_red_eye
                            : Icons.remove_red_eye_outlined,
                        color: Colors.black38,
                      )),
                  label: Text(
                    'Senha',
                    style: GoogleFonts.montserrat(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 18),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
          ),
        ),
      ],
    );
  }

  Widget signUpForms() {
    return Column(
      children: [
        SizedBox(
          height: 60,
          child: TextFormField(
            decoration: InputDecoration(
                label: Text(
                  'Nome',
                  style: GoogleFonts.montserrat(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 18),
                ),
                filled: true,
                fillColor: Colors.white,
                border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(10)))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: SizedBox(
            height: 60,
            child: TextFormField(
              decoration: InputDecoration(
                  label: Text(
                    'Email',
                    style: GoogleFonts.montserrat(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 18),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
          ),
        ),
        SizedBox(
          height: 60,
          child: TextFormField(
            obscureText: showPassword,
            decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(
                      showPassword
                          ? Icons.remove_red_eye
                          : Icons.remove_red_eye_outlined,
                      color: Colors.black38,
                    )),
                label: Text(
                  'Senha',
                  style: GoogleFonts.montserrat(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 18),
                ),
                filled: true,
                fillColor: Colors.white,
                border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(10)))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: SizedBox(
            height: 60,
            child: TextFormField(
              obscureText: showPassword,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                      icon: Icon(
                        showPassword
                            ? Icons.remove_red_eye
                            : Icons.remove_red_eye_outlined,
                        color: Colors.black38,
                      )),
                  label: Text(
                    'Confirme sua senha',
                    style: GoogleFonts.montserrat(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 18),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
          ),
        ),
      ],
    );
  }

  Widget signInButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 14),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              minimumSize: const Size(200, 60),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              backgroundColor: Theme.of(context).colorScheme.primaryContainer),
          onPressed: () {
            Navigator.pushNamed(context, '/presentation');
          },
          child: Text(
            'Entrar',
            style: GoogleFonts.montserrat(fontSize: 18),
          )),
    );
  }

  Widget signUpButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 14),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              minimumSize: const Size(200, 60),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              backgroundColor:
                  Theme.of(context).colorScheme.secondaryContainer),
          onPressed: () {
            Navigator.pushNamed(context, '/presentation');
          },
          child: Text(
            'Cadastrar',
            style: GoogleFonts.montserrat(fontSize: 18),
          )),
    );
  }
}

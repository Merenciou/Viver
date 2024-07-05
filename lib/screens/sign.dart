import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:viver/authentication/auth_service.dart';
import 'package:viver/controllers/user_controller.dart';

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController passwordConfirmController = TextEditingController();
TextEditingController nameController = TextEditingController();

class Sign extends StatefulWidget {
  const Sign({super.key});

  @override
  State<Sign> createState() => _Sign();
}

class _Sign extends State<Sign> {
  final _formKey = GlobalKey<FormState>();
  bool signSwitch = true;
  bool showPassword = true;

  void _signInAuth(context) async {
    final AuthService auth = AuthService();

    String email = emailController.text;
    String password = passwordController.text;

    User? user = await auth.signInWithEmailAndPassword(email, password);

    if (user != null) {
      // _snackBarLoginSucessful();
      // Future.delayed(const Duration(milliseconds: 4000), () {
      //   Navigator.pushNamed(context, '/mainpage');
      // });
    } else if (authError == 'invalid-email') {
      _snackBarEmailWrong();
    } else if (authError == 'invalid-credential') {
      _snackBarPasswordWrong();
    }
  }

  // SignIn

  void _snackBarLoginSucessful() {
    var snackBarLoginSucessful = const SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: Duration(milliseconds: 1700),
      backgroundColor: Colors.green,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.verified,
            color: Colors.white,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              'Seja bem vindo!',
            ),
          ),
        ],
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBarLoginSucessful);
  }

  void _snackBarEmailWrong() {
    var snackBarEmailWrong = const SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: Duration(milliseconds: 3000),
        backgroundColor: Colors.red,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.error,
              color: Colors.white,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                'Digite corretamente o seu email',
              ),
            ),
          ],
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackBarEmailWrong);
  }

  void _snackBarPasswordWrong() {
    var snackBarPasswordWrong = const SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: Duration(milliseconds: 3000),
        backgroundColor: Colors.red,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.error,
              color: Colors.white,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                'Email ou senha incorreto!',
              ),
            ),
          ],
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackBarPasswordWrong);
  }

  // SignUp

  void _snackBarSignUpSucessfull() {
    var snackBarSucess = const SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: Duration(milliseconds: 1700),
        backgroundColor: Colors.green,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.verified,
              color: Colors.white,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                'Cadastro sucedido! :)',
              ),
            ),
          ],
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackBarSucess);
  }

  void _snackBarEmailAlreadInUse() {
    var snackBarSucess = const SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: Duration(milliseconds: 3000),
        backgroundColor: Colors.redAccent,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.error,
              color: Colors.white,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                'Este email já está cadastrado!',
              ),
            ),
          ],
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackBarSucess);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                child: SizedBox(
                  width: 150,
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Stack(
                      children: [
                        Image.asset(
                          'lib/assets/images/logo/logo.png',
                          width: 100,
                        ),
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
      ),
    );
  }

  Widget signIn() {
    var deviceData = MediaQuery.of(context);
    var screenSize = deviceData.size;

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
                    minimumSize: Size(screenSize.width * 0.380, 50),
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
                child: Text(
                  'Cadastrar',
                  style: GoogleFonts.montserrat(color: Colors.white),
                ),
              ),
            ),
            Positioned(
              left: 1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(screenSize.width * 0.380, 50),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    backgroundColor: Theme.of(context).colorScheme.tertiary),
                onPressed: () {
                  setState(() {
                    signSwitch = true;
                  });
                },
                child: Text(
                  'Entrar',
                  style: GoogleFonts.montserrat(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget signUp() {
    var deviceData = MediaQuery.of(context);
    var screenSize = deviceData.size;

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
                    minimumSize: Size(screenSize.width * 0.380, 50),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20))),
                    backgroundColor: Theme.of(context).colorScheme.tertiary),
                onPressed: () {
                  setState(() {
                    signSwitch = true;
                  });
                },
                child: Text(
                  'Entrar',
                  style: GoogleFonts.montserrat(color: Colors.white),
                ),
              ),
            ),
            Positioned(
              right: 1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(screenSize.width * 0.380, 50),
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
                child: Text(
                  'Cadastrar',
                  style: GoogleFonts.montserrat(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget signInForms() {
    return SingleChildScrollView(
      reverse: true,
      child: Column(
        children: [
          SizedBox(
            height: 60,
            child: TextFormField(
              cursorColor: Theme.of(context).colorScheme.secondary,
              textInputAction: TextInputAction.next,
              controller: emailController,
              decoration: InputDecoration(
                  label: Text(
                    'Email',
                    style: GoogleFonts.montserrat(
                        color: Theme.of(context).colorScheme.surface,
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
                controller: passwordController,
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
                          color: Theme.of(context).colorScheme.surface,
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
      ),
    );
  }

  Widget signUpForms() {
    return SingleChildScrollView(
      reverse: true,
      child: Column(
        children: [
          SizedBox(
            height: 60,
            child: TextFormField(
              controller: nameController,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                  label: Text(
                    'Nome',
                    style: GoogleFonts.montserrat(
                        color: Theme.of(context).colorScheme.surface,
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
                textInputAction: TextInputAction.next,
                controller: emailController,
                decoration: InputDecoration(
                    label: Text(
                      'Email',
                      style: GoogleFonts.montserrat(
                          color: Theme.of(context).colorScheme.surface,
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
              textInputAction: TextInputAction.next,
              controller: passwordController,
              obscureText: showPassword,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Preencha este campo!';
                }
                if (value.length < 6) {
                  return 'Sua senha deve conter, no minímo, 6 caracteres!';
                }
                return null;
              },
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
                        color: Theme.of(context).colorScheme.surface,
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
                controller: passwordConfirmController,
                textInputAction: TextInputAction.go,
                obscureText: showPassword,
                validator: (value) {
                  if (value != passwordController.text) {
                    return 'As senhas não coincidem!';
                  }
                  return null;
                },
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
                          color: Theme.of(context).colorScheme.surface,
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
      ),
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
              backgroundColor: Theme.of(context).colorScheme.tertiary),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _signInAuth(context);
              emailController.clear();
              passwordController.clear();
              passwordConfirmController.clear();
            }
          },
          child: Text(
            'Entrar',
            style: GoogleFonts.montserrat(fontSize: 18, color: Colors.white),
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
            if (_formKey.currentState!.validate()) {
              _signUpAuth(context);
              emailController.clear();
              passwordController.clear();
              passwordConfirmController.clear();
            }
          },
          child: Text(
            'Cadastrar',
            style: GoogleFonts.montserrat(fontSize: 18, color: Colors.white),
          )),
    );
  }
}

void _signUpAuth(context) async {
  final AuthService auth = AuthService();

  String email = emailController.text;
  String password = passwordController.text;

  User? user = await auth.signUpWithEmailAndPassword(email, password);

  if (user != null) {
    // _snackBarSignUpSucessfull();
    // Future.delayed(const Duration(milliseconds: 2000), () {
    //   Navigator.pushNamed(context, '/presentation');
    // });
    await UserController(name: nameController.text).setName();
    nameController.clear();
  }
  if (authError == 'email-already-in-use') {
    // _snackBarEmailAlreadInUse();
  }
}

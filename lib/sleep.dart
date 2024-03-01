import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Sleep extends StatefulWidget {
  const Sleep({super.key});

  @override
  State<Sleep> createState() => _SleepState();
}

class _SleepState extends State<Sleep> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController ageController = TextEditingController();
  TextEditingController wakeUpController = TextEditingController();
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        children: [
          isPressed
              ? calcResult()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: SizedBox(
                          width: 250,
                          height: 250,
                          child: SvgPicture.asset(
                              'lib/assets/images/sleeping.svg')),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Quantas horas de sono por noite você deve dormir?',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.montserrat(color: Colors.black54),
                        ),
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: ageController,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, preencha este campo!';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                label: Text(
                                  'Digite sua idade',
                                  style: GoogleFonts.montserrat(
                                      color: Colors.black38),
                                ),
                                border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide.none)),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: TextFormField(
                              controller: wakeUpController,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor, preencha este campo!';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  suffixIcon: Tooltip(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    textAlign: TextAlign.center,
                                    textStyle: GoogleFonts.montserrat(
                                        color: Colors.white),
                                    message:
                                        'Esta informação será utilizada apenas para definir seus alarmes de beber água!',
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.info,
                                          color: Colors.black38,
                                        )),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  label: Text(
                                    'Que horas você costuma acordar?',
                                    style: GoogleFonts.montserrat(
                                        color: Colors.black38),
                                  ),
                                  border: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide: BorderSide.none)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            isPressed = true;
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(200, 50),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          backgroundColor:
                              Theme.of(context).colorScheme.primaryContainer),
                      child: Text(
                        'Calcular',
                        style: GoogleFonts.montserrat(fontSize: 18),
                      ),
                    )
                  ],
                ),
        ],
      ),
    );
  }

  Widget calcResult() {
    return Align(
      child: Container(
        width: 350,
        height: 450,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    Positioned(
                        child: Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              isPressed = false;
                            });
                          },
                          icon: const Icon(
                            Icons.close_rounded,
                            color: Color(0xFFFFFFFF),
                            size: 36,
                          )),
                    )),
                    Align(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Container(
                            width: 200,
                            height: 110,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40))),
                            child: SvgPicture.asset(
                              'lib/assets/images/sleep.svg',
                            )),
                      ),
                    ),
                  ],
                ),
                Text(
                  'Você deve dormir',
                  textAlign: TextAlign.center,
                  style:
                      GoogleFonts.montserrat(fontSize: 18, color: Colors.white),
                ),
                Text(
                  '8 a 9 horas',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      fontSize: 18, color: Colors.yellow),
                ),
                Text(
                  'por noite!',
                  textAlign: TextAlign.center,
                  style:
                      GoogleFonts.montserrat(fontSize: 18, color: Colors.white),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    'Este é o seu resultado?',
                    style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      shape: const RoundedRectangleBorder(),
                      backgroundColor: const Color(0xFFA2D5F2)),
                  child: Text(
                    'Sim',
                    style: GoogleFonts.montserrat(
                        fontSize: 18, color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                      ),
                      backgroundColor: const Color(0xFFF38BA0)),
                  child: Text(
                    'Não',
                    style: GoogleFonts.montserrat(
                        fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

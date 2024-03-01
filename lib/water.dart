import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:viver/clock.dart';

class WaterPage extends StatefulWidget {
  const WaterPage({super.key});

  @override
  State<WaterPage> createState() => _WaterPage();
}

class _WaterPage extends State<WaterPage> {
  bool alarmSwitch = false;
  bool dialogBox = false;
  TextEditingController weightController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  int calcValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: dialogBox
            ? calcResult()
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Clock(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Defina um lembrete para beber água:',
                                style: GoogleFonts.montserrat(
                                    color: Colors.black38),
                              )),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: SizedBox(
                              width: 350,
                              height: 90,
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                width: 350,
                                height: 90,
                                child: Center(
                                  child: SwitchListTile(
                                    title: Text(
                                      'Ativado',
                                      style: GoogleFonts.montserrat(),
                                    ),
                                    secondary: Text(
                                      '07:00',
                                      style: GoogleFonts.montserrat(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black45),
                                    ),
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    value: alarmSwitch,
                                    activeColor:
                                        Theme.of(context).colorScheme.secondary,
                                    inactiveTrackColor:
                                        Theme.of(context).colorScheme.primary,
                                    trackOutlineColor:
                                        const MaterialStatePropertyAll(
                                            Colors.white),
                                    onChanged: (details) {
                                      setState(() {
                                        alarmSwitch = !alarmSwitch;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Quantidade ideal de água a ser ingerida por dia:',
                                style: GoogleFonts.montserrat(
                                    color: Colors.black38),
                              ),
                            ),
                          ),
                          Form(
                            key: _formKey,
                            child: TextFormField(
                              controller: weightController,
                              onChanged: (value) {
                                weightController.text = value;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Ops, digite o seu peso! :)';
                                }
                                return null;
                              },
                              style:
                                  GoogleFonts.montserrat(color: Colors.black38),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide.none),
                                label: Text(
                                  'Digite o seu peso:',
                                  style: GoogleFonts.montserrat(
                                      color: Colors.black26),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 14),
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    dialogBox = true;
                                  });
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  minimumSize: const Size(200, 60),
                                  backgroundColor: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer),
                              child: Text(
                                'Calcular',
                                style: GoogleFonts.montserrat(fontSize: 18),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ));
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
                              dialogBox = false;
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
                            width: 110,
                            height: 110,
                            decoration: const BoxDecoration(
                                color: Color(0xFFA2D5F2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40))),
                            child: SvgPicture.asset(
                                'lib/assets/images/water.svg')),
                      ),
                    ),
                  ],
                ),
                Text(
                  'Você deve ingerir',
                  textAlign: TextAlign.center,
                  style:
                      GoogleFonts.montserrat(fontSize: 18, color: Colors.white),
                ),
                Text(
                  '2, 1 litros',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      fontSize: 18, color: Colors.yellow),
                ),
                Text(
                  'de água por dia!',
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
                    'Este é o seu peso?',
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

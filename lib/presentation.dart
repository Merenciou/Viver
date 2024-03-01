// Adicionar arrastar pro lado
// Adicionar arrastar pro lado
// Adicionar arrastar pro lado
// Adicionar arrastar pro lado
// Adicionar arrastar pro lado
// Adicionar arrastar pro lado
// Adicionar arrastar pro lado
// Adicionar arrastar pro lado
// Adicionar arrastar pro lado
// Adicionar arrastar pro lado
// Adicionar arrastar pro lado

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

int presentationIndex = 0;

class Presentation extends StatefulWidget {
  const Presentation({super.key});

  @override
  State<Presentation> createState() => _Presentation();
}

class _Presentation extends State<Presentation> {
  List<Widget> presentation(BuildContext context) {
    return [
      welcome(),
      water(),
      breathe(),
      sleep(),
      stretching(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: SizedBox(
          width: double.infinity,
          height: 900,
          child: Align(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return presentation(context)[presentationIndex];
                }),
          ),
        ));
  }

  Widget welcome() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 200,
          height: 200,
          child: SvgPicture.asset(
            'lib/assets/images/welcome.svg',
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            'Olá, Vitor',
            style: GoogleFonts.montserrat(fontSize: 30, color: Colors.black54),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: Text(
            'Seja bem vindo ao Viver,\n o seu ambiente de bem estar',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
                fontSize: 20, color: Theme.of(context).colorScheme.secondary),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  presentationIndex = 0;
                });
              },
              icon: Icon(
                Icons.circle,
                size: 35,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  presentationIndex = 1;
                });
              },
              icon: const Icon(
                Icons.circle,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  presentationIndex = 2;
                });
              },
              icon: const Icon(
                Icons.circle,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  presentationIndex = 3;
                });
              },
              icon: const Icon(
                Icons.circle,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  presentationIndex = 4;
                });
              },
              icon: const Icon(
                Icons.circle,
                color: Colors.white,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 0, top: 20),
          child: TextButton(
            onPressed: () {
              setState(() {
                presentationIndex = 1;
              });
            },
            child: Text(
              'Avançar',
              style:
                  GoogleFonts.montserrat(fontSize: 20, color: Colors.black45),
            ),
          ),
        ),
      ],
    );
  }

  Widget water() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 200,
          height: 200,
          child: SvgPicture.asset(
            'lib/assets/images/water.svg',
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            'Hidrate-se',
            style: GoogleFonts.montserrat(fontSize: 30, color: Colors.black54),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: Text(
            'Defina um lembrete para hidratar\n-se adequadamente ao dia a dia',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
                fontSize: 20, color: Theme.of(context).colorScheme.secondary),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  presentationIndex = 0;
                });
              },
              icon: const Icon(
                Icons.circle,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  presentationIndex = 1;
                });
              },
              icon: Icon(
                Icons.circle,
                size: 35,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  presentationIndex = 2;
                });
              },
              icon: const Icon(
                Icons.circle,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  presentationIndex = 3;
                });
              },
              icon: const Icon(
                Icons.circle,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  presentationIndex = 4;
                });
              },
              icon: const Icon(
                Icons.circle,
                color: Colors.white,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 0, top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    presentationIndex = 0;
                  });
                },
                child: Text(
                  'Voltar',
                  style: GoogleFonts.montserrat(
                      fontSize: 20, color: Colors.black45),
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    presentationIndex = 2;
                  });
                },
                child: Text(
                  'Avançar',
                  style: GoogleFonts.montserrat(
                      fontSize: 20, color: Colors.black45),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget breathe() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 200,
          height: 200,
          child: SvgPicture.asset(
            'lib/assets/images/breathe.svg',
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            'Respire e Inspire',
            style: GoogleFonts.montserrat(fontSize: 30, color: Colors.black54),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: Text(
            'Utilize sua respiração para lidar\n com a correria do cotidiano',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
                fontSize: 20, color: Theme.of(context).colorScheme.secondary),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  presentationIndex = 0;
                });
              },
              icon: const Icon(
                Icons.circle,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  presentationIndex = 1;
                });
              },
              icon: const Icon(
                Icons.circle,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  presentationIndex = 2;
                });
              },
              icon: Icon(
                Icons.circle,
                size: 35,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  presentationIndex = 3;
                });
              },
              icon: const Icon(
                Icons.circle,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  presentationIndex = 4;
                });
              },
              icon: const Icon(
                Icons.circle,
                color: Colors.white,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 0, top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    presentationIndex = 1;
                  });
                },
                child: Text(
                  'Voltar',
                  style: GoogleFonts.montserrat(
                      fontSize: 20, color: Colors.black45),
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    presentationIndex = 3;
                  });
                },
                child: Text(
                  'Avançar',
                  style: GoogleFonts.montserrat(
                      fontSize: 20, color: Colors.black45),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget sleep() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 260,
          height: 200,
          child: SvgPicture.asset(
            'lib/assets/images/sleep.svg',
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            'Durma melhor',
            style: GoogleFonts.montserrat(fontSize: 30, color: Colors.black54),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: Text(
            'Organize suas noites e tenha um\n relatório semanal do seu sono',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
                fontSize: 20, color: Theme.of(context).colorScheme.secondary),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  presentationIndex = 0;
                });
              },
              icon: const Icon(
                Icons.circle,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  presentationIndex = 1;
                });
              },
              icon: const Icon(
                Icons.circle,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  presentationIndex = 2;
                });
              },
              icon: const Icon(
                Icons.circle,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  presentationIndex = 3;
                });
              },
              icon: Icon(
                Icons.circle,
                size: 35,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  presentationIndex = 4;
                });
              },
              icon: const Icon(
                Icons.circle,
                color: Colors.white,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 0, top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    presentationIndex = 2;
                  });
                },
                child: Text(
                  'Voltar',
                  style: GoogleFonts.montserrat(
                      fontSize: 20, color: Colors.black45),
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    presentationIndex = 4;
                  });
                },
                child: Text(
                  'Avançar',
                  style: GoogleFonts.montserrat(
                      fontSize: 20, color: Colors.black45),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget stretching() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 200,
          height: 200,
          child: SvgPicture.asset(
            'lib/assets/images/stretching.svg',
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            'Alongamentos',
            style: GoogleFonts.montserrat(fontSize: 30, color: Colors.black54),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: Text(
            'Defina um lembrete para se\n alongar ao decorrer do dia',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
                fontSize: 20, color: Theme.of(context).colorScheme.secondary),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  presentationIndex = 0;
                });
              },
              icon: const Icon(
                Icons.circle,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  presentationIndex = 1;
                });
              },
              icon: const Icon(
                Icons.circle,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  presentationIndex = 2;
                });
              },
              icon: const Icon(
                Icons.circle,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  presentationIndex = 3;
                });
              },
              icon: const Icon(
                Icons.circle,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  presentationIndex = 4;
                });
              },
              icon: Icon(
                Icons.circle,
                size: 35,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 0, top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    presentationIndex = 3;
                  });
                },
                child: Text(
                  'Voltar',
                  style: GoogleFonts.montserrat(
                      fontSize: 20, color: Colors.black45),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/homepage');
                },
                child: Text(
                  'Continuar',
                  style: GoogleFonts.montserrat(
                      fontSize: 20, color: Colors.black45),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  double directionX = 0.0;
  List<Widget> presentation(BuildContext context) {
    return [
      welcome(),
      water(),
      breathe(),
      sleep(),
      stretching(),
    ];
  }

  String userName = 'padrão';

  void getName() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final FirebaseAuth auth = FirebaseAuth.instance;
    CollectionReference userCollection = firestore.collection('User');
    User? user = auth.currentUser;

    if (user != null) {
      await userCollection.doc(user.uid).get().then(
        (DocumentSnapshot documentSnapshot) {
          if (documentSnapshot.exists) {
            Map<String, dynamic>? data =
                documentSnapshot.data() as Map<String, dynamic>;

            setState(() {
              userName = data['name'];
            });
          }
        },
      );
    }
  }

  @override
  void initState() {
    getName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SizedBox(
        width: double.infinity,
        height: 900,
        child: Align(
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                onPanUpdate: ((details) {
                  setState(() {
                    directionX += details.delta.dx;
                  });
                }),
                onPanEnd: ((details) {
                  if (directionX < 100) {
                    if (presentationIndex <= 3) {
                      setState(() {
                        presentationIndex = presentationIndex + 1;
                      });
                    }
                  } else if (directionX > 100) {
                    if (presentationIndex >= 1) {
                      setState(() {
                        presentationIndex = presentationIndex - 1;
                      });
                    }
                  }

                  setState(() {
                    directionX = 0.0;
                  });
                }),
                child: presentation(context)[presentationIndex],
              );
            },
          ),
        ),
      ),
    );
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
            'Olá, $userName',
            style: Theme.of(context).textTheme.displaySmall,
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
          padding: const EdgeInsets.only(top: 20),
          child: TextButton(
            onPressed: () {
              setState(() {
                presentationIndex = 1;
              });
            },
            child: Text(
              'Avançar',
              style: Theme.of(context).textTheme.bodySmall,
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
            style: Theme.of(context).textTheme.displaySmall,
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
          padding: const EdgeInsets.only(top: 20),
          child: SizedBox(
            width: 240,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      presentationIndex = 0;
                    });
                  },
                  child: Text(
                    'Voltar',
                    style: Theme.of(context).textTheme.bodySmall,
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
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
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
            style: Theme.of(context).textTheme.displaySmall,
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
          padding: const EdgeInsets.only(top: 20),
          child: SizedBox(
            width: 240,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      presentationIndex = 1;
                    });
                  },
                  child: Text(
                    'Voltar',
                    style: Theme.of(context).textTheme.bodySmall,
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
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
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
            style: Theme.of(context).textTheme.displaySmall,
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
          padding: const EdgeInsets.only(top: 20),
          child: SizedBox(
            width: 240,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      presentationIndex = 2;
                    });
                  },
                  child: Text(
                    'Voltar',
                    style: Theme.of(context).textTheme.bodySmall,
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
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
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
            style: Theme.of(context).textTheme.displaySmall,
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
          padding: const EdgeInsets.only(top: 20),
          child: SizedBox(
            width: 240,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      presentationIndex = 3;
                    });
                  },
                  child: Text(
                    'Voltar',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/mainpage');
                  },
                  child: Text(
                    'Continuar',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

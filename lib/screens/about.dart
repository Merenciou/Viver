import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ),
                Center(
                  child: SizedBox(
                    height: 650,
                    width: 300,
                    child: Column(
                      children: [
                        Text(
                          'Sobre',
                          style: GoogleFonts.montserrat(
                              fontSize: 24, fontWeight: FontWeight.w500),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Sobre mim:',
                              style: GoogleFonts.montserrat(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Sou Vitor Merencio, um desenvolvedor solo apaixonado por criar soluções inovadoras e eficazes para melhorar a vida das pessoas (inclusive a minha). Com 2 anos e meio de experiência em desenvolvimento de software, eu sempre busco criar aplicativos que sejam fáceis de usar, intuitivos e que atendam às necessidades dos usuários.',
                              style: GoogleFonts.montserrat(fontSize: 18),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

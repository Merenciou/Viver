import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacyPage extends StatefulWidget {
  const PrivacyPage({super.key});

  @override
  State<PrivacyPage> createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        body: Center(
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
                      size: 50,
                    ),
                  ),
                ),
                Center(
                  child: SizedBox(
                    height: 750,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Text(
                            'Termos de Privacidade',
                            style: GoogleFonts.montserrat(fontSize: 24),
                          ),
                        ),
                        SizedBox(
                          width: 300,
                          height: 600,
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Introdução',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Viver é um aplicativo móvel desenvolvido por Vitor. Nossa missão é fornecer um serviço de bem estar ao dia a dia para nossos usuários. Neste documento, descrevemos como coletamos, usamos e protegemos as informações pessoais dos nossos usuários.',
                                    style: GoogleFonts.montserrat(fontSize: 18),
                                    textAlign: TextAlign.left,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Coleta de Dados',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Ao usar o Viver, você pode ser solicitado a fornecer informações pessoais, como:',
                                    style: GoogleFonts.montserrat(fontSize: 18),
                                    textAlign: TextAlign.left,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        '• E-mail\n • Senha\n• Nome\n• Idade\n• Peso\n• Horário de despertar\n• Horário de dormir\n• Quantidade de água ingerida.',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 18),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Text(
                                      'Essas informações são coletadas para:',
                                      style:
                                          GoogleFonts.montserrat(fontSize: 18),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  Text(
                                    '• Criar e gerenciar sua conta.\n• Cálculos para métrica de quantidade de horas ideal a ser dormida.\n• Cálculos para métrica de quantidade de água ideal a ser ingerida.\n• Lembretes diários via notificação.',
                                    style: GoogleFonts.montserrat(fontSize: 18),
                                    textAlign: TextAlign.left,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Uso de Dados',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '• Fornecer o serviço solicitado.',
                                    style: GoogleFonts.montserrat(fontSize: 18),
                                    textAlign: TextAlign.left,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Proteção de Dados',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '• Criptografia de dados.\n• Controle de acesso.\n • Monitoramento de segurança.',
                                    style: GoogleFonts.montserrat(fontSize: 18),
                                    textAlign: TextAlign.left,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Compartilhamento de Dados',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Nós não compartilhamos as informações coletadas com terceiros, exceto:',
                                    style: GoogleFonts.montserrat(fontSize: 18),
                                    textAlign: TextAlign.left,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      '• Quando necessário para fornecer o serviço solicitado\n Quando exigido por lei ou regulamentação',
                                      style:
                                          GoogleFonts.montserrat(fontSize: 18),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Direitos do Usuário',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Você tem o direito de:',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 18),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '• Acessar e corrigir suas informações pessoais\n• Cancelar sua conta\n• Reclamar sobre o uso indevido de suas informações',
                                    style: GoogleFonts.montserrat(fontSize: 18),
                                    textAlign: TextAlign.left,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Alterações',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Nós podemos alterar estes termos de privacidade a qualquer momento. Se houver alterações significativas, nós notificaremos você por e-mail ou dentro do aplicativo.',
                                    style: GoogleFonts.montserrat(fontSize: 18),
                                    textAlign: TextAlign.left,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Contato',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'E-mail: vitormerencio.1987@gmail.com',
                                    style: GoogleFonts.montserrat(fontSize: 18),
                                    textAlign: TextAlign.left,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Aceitação',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Ao usar o Viver, você aceita estes termos de privacidade e concorda em cumprir com as condições estabelecidas.',
                                    style: GoogleFonts.montserrat(fontSize: 18),
                                    textAlign: TextAlign.left,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Data de Vigência',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Estes termos de privacidade entram em vigor em 07 de Outubro de 2024.',
                                    style: GoogleFonts.montserrat(fontSize: 18),
                                    textAlign: TextAlign.left,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Versão',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      '0.0.1',
                                      style:
                                          GoogleFonts.montserrat(fontSize: 18),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
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

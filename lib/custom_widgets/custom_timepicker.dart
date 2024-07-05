import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextEditingController wakeUpHourController = TextEditingController();

class CustomTimePicker extends StatefulWidget {
  const CustomTimePicker({super.key});

  @override
  State<CustomTimePicker> createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  TimeOfDay selectedTime = TimeOfDay.now();
  final GlobalKey<TooltipState> toolTipKey = GlobalKey<TooltipState>();

  void _onTooltipTap(GlobalKey tooltipKey) {
    final dynamic tooltip = tooltipKey.currentState;
    tooltip?.ensureTooltipVisible();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: wakeUpHourController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        label: Text(
          'Que horas você costuma acordar?',
          style: GoogleFonts.montserrat(color: Colors.black38),
        ),
        suffixIcon: Tooltip(
          key: toolTipKey,
          triggerMode: TooltipTriggerMode.manual,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          textAlign: TextAlign.center,
          textStyle: GoogleFonts.montserrat(color: Colors.white),
          message:
              'Esta informação será utilizada apenas para definir seus alarmes de beber água!',
          child: IconButton(
            icon: const Icon(
              Icons.info,
              color: Colors.black38,
            ),
            onPressed: () {
              _onTooltipTap(toolTipKey);
            },
          ),
        ),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide.none),
      ),
      onTap: () async {
        TimeOfDay? timeOfDay = await showTimePicker(
          context: context,
          initialTime: selectedTime,
          initialEntryMode: TimePickerEntryMode.dial,
          errorInvalidText: 'Selecione um horário válido',
          confirmText: 'Selecionar',
          cancelText: 'Cancelar',
          helpText: 'Selecione a hora',
          hourLabelText: 'Horas',
          minuteLabelText: 'Minutos',
        );

        if (timeOfDay != null) {
          setState(() {
            selectedTime = timeOfDay;
            wakeUpHourController.text =
                '${selectedTime.hour.toString().padLeft(2, '0')}:${selectedTime.minute.toString().padLeft(2, '0')}';
          });

          // if (selectedTime.hour.toString().length < 2) {
          //   setState(() {
          //     selectedTime.hour.toString().padLeft(2, '0');
          //   });

          // }
        }
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, preencha este campo!';
        }
        return null;
      },
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';

// TextEditingController wakeUpHourController = TextEditingController();

// class CustomTimePicker extends StatefulWidget {
//   const CustomTimePicker({super.key});

//   @override
//   State<CustomTimePicker> createState() => _CustomTimePickerState();
// }


// class _CustomTimePickerState extends State<CustomTimePicker> {
//   TimeOfDay selectedTime = TimeOfDay.now();

//   int hour = 00;
//   int minute = 00;
//   String time = '00:00';
//   bool isTapped = false;
//   // padleft(2, '0');

//   @override
//   void initState() {
//     print(isTapped);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         TextFormField(
//           onTap: ,
//         )
//         // TextFormField(
//         //   controller: wakeUpHourController,
//         //   decoration: InputDecoration(
//         //     filled: true,
//         //     fillColor: Colors.white,
//         //     label: Text(
//         //       'Que horas você costuma acordar?',
//         //       style: GoogleFonts.montserrat(color: Colors.black38),
//         //     ),
//         //     hintText: isTapped ? time : 'Que horas você costuma acordar?',
//         //     hintStyle: GoogleFonts.montserrat(color: Colors.black38),
//         //     border: const OutlineInputBorder(
//         //         borderRadius: BorderRadius.all(Radius.circular(10)),
//         //         borderSide: BorderSide.none),
//         //   ),
//         //   onTap: () async {
//         //     setState(() {
//         //       isTapped = true;
//         //     });
//         //     final TimeOfDay? timeOfDay = await showTimePicker(
//         //       context: context,
//         //       initialTime: selectedTime,
//         //       initialEntryMode: TimePickerEntryMode.dial,
//         //     );
//         //     if (timeOfDay != null) {
//         //       setState(() {
//         //         selectedTime = timeOfDay;

//         //         hour = selectedTime.hour;
//         //         minute = selectedTime.minute;
//         //         time = '$hour:$minute';
//         //       });
//         //     }

//         //     if (hour.toString().length < 2 && minute.toString().length < 2) {
//         //       time = '0$hour:0$minute';
//         //       print('menor 2');
//         //     }

//         //     if (minute.toString().length < 2) {
//         //       time = '$hour:0$minute';
//         //     }
//         //   },
//         //   keyboardType: TextInputType.number,
//         //   // inputFormatters: [FormatterInputHour()],
//         // ),

//         // ElevatedButton(
//         //   onPressed: () async {
//         //     final TimeOfDay? timeOfDay = await showTimePicker(
//         //       context: context,
//         //       initialTime: selectedTime,
//         //       initialEntryMode: TimePickerEntryMode.dial,
//         //     );
//         //     if (timeOfDay != null) {
//         //       setState(() {
//         //         selectedTime = timeOfDay;
//         //         hour = selectedTime.hour;
//         //         minute = selectedTime.minute;
//         //         time = '$hour:$minute';
//         //       });
//         //     }

//         //     if (hour.toString().length < 2 &&
//         //         minute.toString().length < 2) {
//         //       time = '0$hour:0$minute';
//         //     }

//         //     if (minute.toString().length < 2) {
//         //       time = '$hour:0$minute';
//         //     }
//         //   },
//         //   child: const Text('Escolher Horário'),
//         // ),
//       ],
//     );
//   }
// }

// class FormatterInputHour extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(
//       TextEditingValue oldValue, TextEditingValue newValue) {
//     if (newValue.text.length > 5) {
//       return oldValue;
//     }

//     String newText = newValue.text.padRight(5, '0');
//     return TextEditingValue(
//       text: newText,
//       selection: TextSelection.collapsed(offset: newText.length),
//     );
//   }
// }

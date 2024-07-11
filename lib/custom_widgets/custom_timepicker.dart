import 'package:flutter/material.dart';

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
      style: Theme.of(context).textTheme.labelSmall,
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).colorScheme.primaryContainer,
        label: Text(
          'Horário de despertar',
          style: Theme.of(context).textTheme.labelSmall,
        ),
        suffixIcon: Tooltip(
          key: toolTipKey,
          triggerMode: TooltipTriggerMode.manual,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          textAlign: TextAlign.center,
          textStyle: Theme.of(context).textTheme.titleSmall,
          message:
              'Esta informação será utilizada apenas para definir seus alarmes de beber água!',
          child: IconButton(
            icon: Icon(
              Icons.info,
              color: Theme.of(context).colorScheme.tertiary,
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

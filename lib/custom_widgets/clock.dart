import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:viver/controllers/dark_theme_controller.dart';

class Clock extends StatefulWidget {
  const Clock({super.key});

  @override
  State<Clock> createState() => _Clock();
}

class _Clock extends State<Clock> {
  final ValueNotifier<DateTime> _timeNotifier = ValueNotifier(DateTime.now());

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      _timeNotifier.value = DateTime.now();
    });
    _timeNotifier.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<DateTime>(
      valueListenable: _timeNotifier,
      builder: (context, value, child) {
        return SizedBox(
          width: 200,
          height: 200,
          child: CustomPaint(
            painter: ClockPainter(_timeNotifier),
          ),
        );
      },
    );
  }
}

class ClockPainter extends CustomPainter {
  final ValueNotifier<DateTime> _timeNotifier;
  ClockPainter(this._timeNotifier);

  @override
  void paint(Canvas canvas, Size size) {
    var dateTime = _timeNotifier.value;
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    var fillBrush = Paint()
      ..color = DarkThemeController.instance.isDarkTheme
          ? Colors.white24
          : Colors.white38;

    var outLineBrush = Paint()
      ..color = DarkThemeController.instance.isDarkTheme
          ? Colors.white24
          : Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    var centerFillBrush = Paint()
      ..color = DarkThemeController.instance.isDarkTheme
          ? Colors.white24
          : Colors.white;

    var hoursHandBrush = Paint()
      ..color = DarkThemeController.instance.isDarkTheme
          ? Colors.white24
          : Colors.white
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    var minutesHandBrush = Paint()
      ..color = DarkThemeController.instance.isDarkTheme
          ? Colors.white24
          : Colors.white
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    var secondsHandBrush = Paint()
      ..color = DarkThemeController.instance.isDarkTheme
          ? Colors.white24
          : Colors.white
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    var dashBrush = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..color = DarkThemeController.instance.isDarkTheme
          ? Colors.white24
          : Colors.white
      ..strokeWidth = 10;

    canvas.drawCircle(center, radius + 10, fillBrush);
    canvas.drawCircle(center, radius + 10, outLineBrush);

    var hoursHandX = centerX +
        40 * sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    var hoursHandY = centerX -
        60 * cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    canvas.drawLine(center, Offset(hoursHandX, hoursHandY), hoursHandBrush);

    var minutesHandX = centerX + 65 * sin(dateTime.minute * 6 * pi / 180);
    var minutesHandY = centerX - 65 * cos(dateTime.minute * 6 * pi / 180);
    canvas.drawLine(
        center, Offset(minutesHandX, minutesHandY), minutesHandBrush);

    var secondsHandX = centerX + 70 * sin(dateTime.second * 6 * pi / 180);
    var secondsHandY = centerX - 70 * cos(dateTime.second * 6 * pi / 180);
    canvas.drawLine(
        center, Offset(secondsHandX, secondsHandY), secondsHandBrush);

    canvas.drawCircle(center, 4, centerFillBrush);

    var outerCircleRadius = radius;
    var innerCircleRadius = radius - 1;
    for (double i = 0; i < 360; i += 22.5) {
      var x1 = centerX + outerCircleRadius * cos(i * pi / 45);
      var y1 = centerX + outerCircleRadius * sin(i * pi / 45);

      var x2 = centerX + innerCircleRadius * cos(i * pi / 45);
      var y2 = centerX + innerCircleRadius * sin(i * pi / 45);

      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

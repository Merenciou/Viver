import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:viver/controllers/chart_sleep_model.dart';
import 'package:viver/controllers/user_model.dart';

double? sizeSleepChart;
double? mondaySlept;
double? tuesdaySlept;
double? wednesdaySlept;
double? thursdaySlept;
double? fridaySlept;
double? saturdaySlept;
double? sundaySlept;

void getDaysSlept() {
  ChartSleepModel().getMonday().listen((value) {
    mondaySlept = value;
  }, onError: (error) {
    print('ops, erro: $error');
  });
  ChartSleepModel().getTuesday().listen((value) {
    tuesdaySlept = value;
  }, onError: (error) {
    print('ops, erro: $error');
  });
  ChartSleepModel().getWednesday().listen((value) {
    wednesdaySlept = value;
  }, onError: (error) {
    print('ops, erro: $error');
  });
  ChartSleepModel().getThursday().listen((value) {
    thursdaySlept = value;
  }, onError: (error) {
    print('ops, erro: $error');
  });
  ChartSleepModel().getFriday().listen((value) {
    fridaySlept = value;
  }, onError: (error) {
    print('ops, erro: $error');
  });
  ChartSleepModel().getSaturday().listen((value) {
    saturdaySlept = value;
  }, onError: (error) {
    print('ops, erro: $error');
  });
  ChartSleepModel().getSunday().listen((value) {
    sundaySlept = value;
  }, onError: (error) {
    print('ops, erro: $error');
  });
}

class SleepChartBar extends StatefulWidget {
  const SleepChartBar({super.key});

  @override
  State<SleepChartBar> createState() => _SleepChartBarState();
}

class _SleepChartBarState extends State<SleepChartBar> {
  void getHourIdealSleepMax() async {
    sizeSleepChart = double.tryParse(
        (await UserModel().getHourIdealSleepMax() ?? 0).toString());
  }

  @override
  void initState() {
    getDaysSlept();
    // getChartIndex();
    //
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
          barTouchData: barTouchData,
          titlesData: titlesData,
          borderData: borderData,
          barGroups: barGroups,
          gridData: const FlGridData(show: true),
          alignment: BarChartAlignment.spaceAround,
          maxY: (sizeSleepChart ?? 7) * 2),
    );
  }
}

BarTouchData get barTouchData => BarTouchData(
      enabled: false,
      touchTooltipData: BarTouchTooltipData(
          getTooltipColor: (BarChartGroupData group) => Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
                rod.toY.toString(),
                const TextStyle(
                    color: Color(0XFF79AC78), fontWeight: FontWeight.bold));
          }),
    );

Widget getTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Color(0XFF79AC78),
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
  String text;
  switch (value.toInt()) {
    case 0:
      text = 'Seg';
      break;
    case 1:
      text = 'Ter';
      break;
    case 2:
      text = 'Qua';
      break;
    case 3:
      text = 'Qui';
      break;
    case 4:
      text = 'Sex';
      break;
    case 5:
      text = 'Sáb';
      break;
    case 6:
      text = 'Dom';
      break;
    default:
      text = '';
      break;
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 4,
    child: Text(
      text,
      style: style,
    ),
  );
}

FlTitlesData get titlesData => const FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 30,
          getTitlesWidget: getTitles,
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
    );

FlBorderData get borderData => FlBorderData(
      show: false,
    );

LinearGradient get _barsGradient => const LinearGradient(colors: [
      Color(0xFFFF8080),
      Color(0xFFFFFEC4),
      Color(0XFF79AC78),
    ], begin: Alignment.bottomCenter, end: Alignment.topCenter);

List<BarChartGroupData> get barGroups => [
      BarChartGroupData(
        x: 0,
        barRods: [
          BarChartRodData(toY: mondaySlept ?? 0, gradient: _barsGradient),
        ],
        showingTooltipIndicators: [0],
      ),
      BarChartGroupData(
        x: 1,
        barRods: [
          BarChartRodData(toY: tuesdaySlept ?? 0, gradient: _barsGradient),
        ],
        showingTooltipIndicators: [0],
      ),
      BarChartGroupData(
        x: 2,
        barRods: [
          BarChartRodData(toY: wednesdaySlept ?? 0, gradient: _barsGradient),
        ],
        showingTooltipIndicators: [0],
      ),
      BarChartGroupData(
        x: 3,
        barRods: [
          BarChartRodData(toY: thursdaySlept ?? 0, gradient: _barsGradient),
        ],
        showingTooltipIndicators: [0],
      ),
      BarChartGroupData(
        x: 4,
        barRods: [
          BarChartRodData(toY: fridaySlept ?? 0, gradient: _barsGradient),
        ],
        showingTooltipIndicators: [0],
      ),
      BarChartGroupData(
        x: 5,
        barRods: [
          BarChartRodData(toY: saturdaySlept ?? 0, gradient: _barsGradient),
        ],
        showingTooltipIndicators: [0],
      ),
      BarChartGroupData(
        x: 6,
        barRods: [
          BarChartRodData(toY: sundaySlept ?? 0, gradient: _barsGradient),
        ],
        showingTooltipIndicators: [0],
      ),
    ];

class BarChartSample extends StatefulWidget {
  const BarChartSample({super.key});

  @override
  State<BarChartSample> createState() => _BarChartSampleState();
}

class _BarChartSampleState extends State<BarChartSample> {
  @override
  Widget build(BuildContext context) {
    return const AspectRatio(
      aspectRatio: 1.6,
      child: SleepChartBar(),
    );
  }
}

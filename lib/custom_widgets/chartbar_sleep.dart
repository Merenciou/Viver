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

void initializeChartSleptProperties() async {
  UserModel userModel = UserModel();

  sizeSleepChart =
      double.tryParse((await userModel.getHourIdealSleepMax()).toString());
  sizeSleepChart;
}

class SleepChartBar extends StatefulWidget {
  const SleepChartBar({super.key});

  @override
  State<SleepChartBar> createState() => _SleepChartBarState();
}

class _SleepChartBarState extends State<SleepChartBar> {
  void getDaysSlept() {
    ChartSleepModel().getMonday().listen((value) {
      if (mounted) {
        setState(() {
          mondaySlept = value;
        });
      }
    }, onError: (error) {
      mondaySlept = 0;
    });
    ChartSleepModel().getTuesday().listen((value) {
      if (mounted) {
        setState(() {
          tuesdaySlept = value;
        });
      }
    }, onError: (error) {
      tuesdaySlept = 0;
    });
    ChartSleepModel().getWednesday().listen((value) {
      if (mounted) {
        setState(() {
          wednesdaySlept = value;
        });
      }
    }, onError: (error) {
      wednesdaySlept = 0;
    });
    ChartSleepModel().getThursday().listen((value) {
      if (mounted) {
        setState(() {
          thursdaySlept = value;
        });
      }
    }, onError: (error) {
      thursdaySlept = 0;
    });
    ChartSleepModel().getFriday().listen((value) {
      if (mounted) {
        setState(() {
          fridaySlept = value;
        });
      }
    }, onError: (error) {
      fridaySlept = 0;
    });
    ChartSleepModel().getSaturday().listen((value) {
      if (mounted) {
        setState(() {
          saturdaySlept = value;
        });
      }
    }, onError: (error) {
      saturdaySlept = 0;
    });
    ChartSleepModel().getSunday().listen((value) {
      if (mounted) {
        setState(() {
          sundaySlept = value;
        });
      }
    }, onError: (error) {
      sundaySlept = 0;
    });
  }

  @override
  void initState() {
    getDaysSlept();
    initializeChartSleptProperties();
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

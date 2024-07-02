import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:viver/controllers/chart_hydration_model.dart';
import 'package:viver/controllers/user_model.dart';

double? sizeHydrationChart;
double? mondayHydration;
double? tuesdayHydration;
double? wednesdayHydration;
double? thursdayHydration;
double? fridayHydration;
double? saturdayHydration;
double? sundayHydration;

void initializeChartHydrationProperties() async {
  UserModel userModel = UserModel();
  sizeHydrationChart = await userModel.getWaterIdeal();
}

class HydrationChartBar extends StatefulWidget {
  const HydrationChartBar({super.key});

  @override
  State<HydrationChartBar> createState() => _HydrationChartBarState();
}

class _HydrationChartBarState extends State<HydrationChartBar> {
  void getDaysHydration() {
    ChartHydrationModel().getMonday().listen((value) {
      setState(() {
        mondayHydration = value;
      });
    }, onError: (error) {
      mondayHydration = 0;
    });
    ChartHydrationModel().getTuesday().listen((value) {
      setState(() {
        tuesdayHydration = value;
      });
    }, onError: (error) {
      tuesdayHydration = 0;
    });
    ChartHydrationModel().getWednesday().listen((value) {
      setState(() {
        wednesdayHydration = value;
      });
    }, onError: (error) {
      wednesdayHydration = 0;
    });
    ChartHydrationModel().getThursday().listen((value) {
      setState(() {
        thursdayHydration = value;
      });
    }, onError: (error) {
      thursdayHydration = 0;
    });
    ChartHydrationModel().getFriday().listen((value) {
      setState(() {
        fridayHydration = value;
      });
    }, onError: (error) {
      fridayHydration = 0;
    });
    ChartHydrationModel().getSaturday().listen((value) {
      setState(() {
        saturdayHydration = value;
      });
    }, onError: (error) {
      saturdayHydration = 0;
    });
    ChartHydrationModel().getSunday().listen((value) {
      setState(() {
        sundayHydration = value;
      });
    }, onError: (error) {
      sundayHydration = 0;
    });
  }

  @override
  void initState() {
    getDaysHydration();
    initializeChartHydrationProperties();
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
          maxY: (sizeHydrationChart ?? 2.2) * 1.3),
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
          BarChartRodData(toY: mondayHydration ?? 0, gradient: _barsGradient),
        ],
        showingTooltipIndicators: [0],
      ),
      BarChartGroupData(
        x: 1,
        barRods: [
          BarChartRodData(toY: tuesdayHydration ?? 0, gradient: _barsGradient),
        ],
        showingTooltipIndicators: [0],
      ),
      BarChartGroupData(
        x: 2,
        barRods: [
          BarChartRodData(
              toY: wednesdayHydration ?? 0, gradient: _barsGradient),
        ],
        showingTooltipIndicators: [0],
      ),
      BarChartGroupData(
        x: 3,
        barRods: [
          BarChartRodData(toY: thursdayHydration ?? 0, gradient: _barsGradient),
        ],
        showingTooltipIndicators: [0],
      ),
      BarChartGroupData(
        x: 4,
        barRods: [
          BarChartRodData(toY: fridayHydration ?? 0, gradient: _barsGradient),
        ],
        showingTooltipIndicators: [0],
      ),
      BarChartGroupData(
        x: 5,
        barRods: [
          BarChartRodData(toY: saturdayHydration ?? 0, gradient: _barsGradient),
        ],
        showingTooltipIndicators: [0],
      ),
      BarChartGroupData(
        x: 6,
        barRods: [
          BarChartRodData(toY: sundayHydration ?? 0, gradient: _barsGradient),
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
      child: HydrationChartBar(),
    );
  }
}

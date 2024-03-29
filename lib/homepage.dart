import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var screenReportIndex = 0;
  List<Widget> screenReportList(BuildContext context) {
    return [
      reportSleep(),
      reportWater(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return screenReportList(context)[screenReportIndex];
  }

  Widget reportSleep() {
    return Stack(
      children: [
        Positioned(
          right: -6,
          top: 410,
          child: IconButton(
            onPressed: () {
              setState(() {
                screenReportIndex = 1;
              });
            },
            icon: Icon(
              Icons.arrow_forward_ios_rounded,
              color: Theme.of(context).colorScheme.secondary,
              size: 60,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child: SvgPicture.asset('lib/assets/images/sun.svg'),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Bom dia, ',
                            style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 24),
                          ),
                          TextSpan(
                            text: 'Vitor',
                            style: GoogleFonts.montserrat(
                                color: Theme.of(context).colorScheme.secondary,
                                fontWeight: FontWeight.w500,
                                fontSize: 24),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Relatório semanal do seu sono:',
                      style: GoogleFonts.montserrat(fontSize: 16),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    decoration: const BoxDecoration(
                        color: Colors.white38,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: const CustomChartBar(),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 152,
                      height: 150,
                      decoration: const BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.percent_rounded,
                              size: 38,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            Text(
                              '78%',
                              style: GoogleFonts.montserrat(
                                  fontSize: 30, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'Meta de\nsono\n(diário)',
                              textAlign: TextAlign.left,
                              style: GoogleFonts.montserrat(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 152,
                      height: 150,
                      decoration: const BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.percent_rounded,
                              size: 38,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            Text(
                              '70%',
                              style: GoogleFonts.montserrat(
                                  fontSize: 30, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'Meta de\nsono\n(semanal)',
                              textAlign: TextAlign.left,
                              style: GoogleFonts.montserrat(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Container(
                    width: double.infinity,
                    height: 130,
                    decoration: const BoxDecoration(
                        color: Colors.white38,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.mood_rounded,
                          size: 38,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        Text(
                          'Qualidade de sono',
                          style: GoogleFonts.montserrat(
                              fontSize: 30, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Ótimo',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.montserrat(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  child: SizedBox(
                    width: 100,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              screenReportIndex = 0;
                            });
                          },
                          icon: Icon(
                            Icons.circle,
                            color: Theme.of(context).colorScheme.secondary,
                            size: 15,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              screenReportIndex = 1;
                            });
                          },
                          icon: Icon(
                            Icons.circle,
                            color: Theme.of(context).colorScheme.secondary,
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
      ],
    );
  }

  Widget reportWater() {
    return Stack(
      children: [
        Positioned(
          left: -6,
          top: 410,
          child: IconButton(
            onPressed: () {
              setState(() {
                screenReportIndex = 0;
              });
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Theme.of(context).colorScheme.secondary,
              size: 60,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child: SvgPicture.asset(
                      'lib/assets/images/water.svg',
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Bom dia, ',
                            style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 24),
                          ),
                          TextSpan(
                            text: 'Vitor',
                            style: GoogleFonts.montserrat(
                                color: Theme.of(context).colorScheme.secondary,
                                fontWeight: FontWeight.w500,
                                fontSize: 24),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Relatório semanal de sua hidratação:',
                      style: GoogleFonts.montserrat(fontSize: 16),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    decoration: const BoxDecoration(
                        color: Colors.white38,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: const CustomChartBar(),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 152,
                      height: 150,
                      decoration: const BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.percent_rounded,
                              size: 38,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            Text(
                              '89%',
                              style: GoogleFonts.montserrat(
                                  fontSize: 30, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'Meta de\nhidratação\n(diária)',
                              textAlign: TextAlign.left,
                              style: GoogleFonts.montserrat(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 152,
                      height: 150,
                      decoration: const BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.percent_rounded,
                              size: 38,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            Text(
                              '83%',
                              style: GoogleFonts.montserrat(
                                  fontSize: 30, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'Meta de\nhidratação\n(semanal)',
                              textAlign: TextAlign.left,
                              style: GoogleFonts.montserrat(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Container(
                    width: double.infinity,
                    height: 130,
                    decoration: const BoxDecoration(
                        color: Colors.white38,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.mood_rounded,
                          size: 38,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        Text(
                          'Nível de Hidratação',
                          style: GoogleFonts.montserrat(
                              fontSize: 30, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Bom',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.montserrat(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  child: SizedBox(
                    width: 100,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              screenReportIndex = 0;
                            });
                          },
                          icon: Icon(
                            Icons.circle,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              screenReportIndex = 1;
                            });
                          },
                          icon: Icon(
                            Icons.circle,
                            color: Theme.of(context).colorScheme.secondary,
                            size: 15,
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
      ],
    );
  }
}

class CustomChartBar extends StatefulWidget {
  const CustomChartBar({super.key});

  @override
  State<CustomChartBar> createState() => _CustomChartBarState();
}

class _CustomChartBarState extends State<CustomChartBar> {
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
          maxY: 20),
    );
  }
}

BarTouchData get barTouchData => BarTouchData(
      enabled: false,
      touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.transparent,
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
          BarChartRodData(toY: 8, gradient: _barsGradient),
        ],
        showingTooltipIndicators: [0],
      ),
      BarChartGroupData(
        x: 1,
        barRods: [
          BarChartRodData(toY: 9.30, gradient: _barsGradient),
        ],
        showingTooltipIndicators: [0],
      ),
      BarChartGroupData(
        x: 2,
        barRods: [
          BarChartRodData(toY: 10, gradient: _barsGradient),
        ],
        showingTooltipIndicators: [0],
      ),
      BarChartGroupData(
        x: 3,
        barRods: [
          BarChartRodData(toY: 8, gradient: _barsGradient),
        ],
        showingTooltipIndicators: [0],
      ),
      BarChartGroupData(
        x: 4,
        barRods: [
          BarChartRodData(toY: 6, gradient: _barsGradient),
        ],
        showingTooltipIndicators: [0],
      ),
      BarChartGroupData(
        x: 5,
        barRods: [
          BarChartRodData(toY: 7, gradient: _barsGradient),
        ],
        showingTooltipIndicators: [0],
      ),
      BarChartGroupData(
        x: 6,
        barRods: [
          BarChartRodData(toY: 10, gradient: _barsGradient),
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
      child: CustomChartBar(),
    );
  }
}

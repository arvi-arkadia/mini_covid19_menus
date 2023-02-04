import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mini_covid19_menus/constant.dart';

class WeeklyChart extends StatelessWidget {
  const WeeklyChart({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: BarChart(
        BarChartData(
          barGroups: getBarGroups(),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: getWeek,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

getBarGroups() {
  List<double> barChartDatas = [6, 10, 8, 7, 10, 15, 9];
  List<BarChartGroupData> barChartGroups = [];
  barChartDatas.asMap().forEach(
        (i, value) => barChartGroups.add(
          BarChartGroupData(
            x: i,
            barRods: [
              BarChartRodData(
                toY: value,
                // this is not the proper way, this is just for demo
                color: i == 4 ? kPrimaryColor : kInactiveChartColor,
                width: 16,
              ),
            ],
          ),
        ),
      );
  return barChartGroups;
}

Widget getWeek(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Color(0xff7589a2),
    fontWeight: FontWeight.w300,
    fontSize: 10,
  );
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text('MON', style: style);
      break;
    case 1:
      text = const Text('TUE', style: style);
      break;
    case 2:
      text = const Text('WED', style: style);
      break;
    case 3:
      text = const Text('THU', style: style);
      break;
    case 4:
      text = const Text('FRI', style: style);
      break;
    case 5:
      text = const Text('SAT', style: style);
      break;
    case 6:
      text = const Text('SUN', style: style);
      break;
    default:
      text = const Text('', style: style);
      break;
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 10,
    child: text,
  );
}

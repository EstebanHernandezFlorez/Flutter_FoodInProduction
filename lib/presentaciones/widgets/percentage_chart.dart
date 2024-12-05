import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class PercentageChart extends StatelessWidget {
  final Color color;

  const PercentageChart({
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: BarChart(
        BarChartData(
          maxY: 10,
          minY: 0,
          barTouchData: BarTouchData(enabled: false),
          borderData: FlBorderData(show: false),
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            horizontalInterval: 2,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: Colors.grey.withOpacity(0.2),
                strokeWidth: 1,
              );
            },
          ),
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  final labels = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
                  if (value >= 0 && value < labels.length) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        labels[value.toInt()],
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                        ),
                      ),
                    );
                  }
                  return const Text('');
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 2,
                getTitlesWidget: (value, meta) {
                  return Text(
                    '${value.toInt()}%',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                    ),
                  );
                },
              ),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
          barGroups: [
            _generateBarGroup(0, 8),
            _generateBarGroup(1, 6.5),
            _generateBarGroup(2, 7),
            _generateBarGroup(3, 9),
            _generateBarGroup(4, 5),
            _generateBarGroup(5, 7.5),
            _generateBarGroup(6, 8.5),
          ],
        ),
      ),
    );
  }

  BarChartGroupData _generateBarGroup(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: color,
          width: 12,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(4),
          ),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 10,
            color: Colors.grey.withOpacity(0.1),
          ),
        ),
      ],
    );
  }
}

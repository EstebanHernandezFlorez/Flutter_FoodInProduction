import 'package:flutter/material.dart';
import '../widgets/money_chart.dart';
import '../widgets/percentage_chart.dart';
import '../widgets/time_chart.dart';

class PerformanceSection extends StatelessWidget {
  final String title;
  final String value;
  final Color color;
  final String chartType;

  const PerformanceSection({
    required this.title,
    required this.value,
    required this.color,
    required this.chartType,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(width: 16.0),
              Text(
                value,
                style: TextStyle(fontSize: 16, color: color),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          SizedBox(
            width: double.infinity,
            height: 100, // Reduced height
            child: _buildChart(),
          ),
        ],
      ),
    );
  }

  Widget _buildChart() {
    switch (chartType) {
      case 'percentage':
        return PercentageChart(color: color);
      case 'money':
        return MoneyChart(color: color);
      case 'time':
        return TimeChart(color: color);
      default:
        return const SizedBox();
    }
  }
}
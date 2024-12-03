import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class EmployeeWidget extends StatelessWidget {
  final String nombre;
  final String cargo;
  final String imagenUrl;
  final bool activo;

  const EmployeeWidget({
    required this.nombre,
    required this.cargo,
    required this.imagenUrl,
    required this.activo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nombre),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(imagenUrl, width: 100, height: 100),
                  ),
                  const SizedBox(width: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nombre,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        cargo,
                        style: const TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        activo ? 'Activo' : 'Inactivo',
                        style: TextStyle(
                          fontSize: 18,
                          color: activo ? Colors.green : Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32.0),
              const Text('Horas Trabajadas',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16.0),
              _buildHoursChart(),
              const SizedBox(height: 32.0),
              const Text('Rendimiento',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16.0),
              _buildPerformanceChart(),
              const SizedBox(height: 32.0),
              const Text('Tareas Completadas',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16.0),
              _buildTasksChart(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHoursChart() {
    return LineChart(
      LineChartData(
        gridData: const FlGridData(show: false),
        titlesData: const FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        minX: 0,
        maxX: 6,
        minY: 0,
        maxY: 12,
        lineBarsData: [
          LineChartBarData(
            spots: [
              const FlSpot(0, 8),
              const FlSpot(1, 9),
              const FlSpot(2, 7),
              const FlSpot(3, 8),
              const FlSpot(4, 8.5),
              const FlSpot(5, 7.5),
            ],
            isCurved: true,
            color: Colors.blue,
            barWidth: 4,
            isStrokeCapRound: true,
          ),
        ],
      ),
    );
  }

  Widget _buildPerformanceChart() {
    return PieChart(
      PieChartData(
        sections: [
          PieChartSectionData(value: 75, title: '75%', color: Colors.green),
          PieChartSectionData(value: 25, title: '25%', color: Colors.orange),
        ],
      ),
    );
  }

  Widget _buildTasksChart() {
    return BarChart(
      BarChartData(
        gridData: const FlGridData(show: false),
        titlesData: const FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        barGroups: [
          BarChartGroupData(
            x: 0,
            barRods: [
              BarChartRodData(fromY: 0, toY: 8, color: Colors.blue, width: 16)
            ],
          ),
          BarChartGroupData(
            x: 1,
            barRods: [
              BarChartRodData(fromY: 0, toY: 12, color: Colors.green, width: 16)
            ],
          ),
          BarChartGroupData(
            x: 2,
            barRods: [
              BarChartRodData(fromY: 0, toY: 10, color: Colors.orange, width: 16)
            ],
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class InsumoWidget extends StatelessWidget {
  final String nombre;
  final String descripcion;
  final String imagenUrl;
  final bool activo;

  const InsumoWidget({
    required this.nombre,
    required this.descripcion,
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
          onPressed: () {
            Navigator.pop(context);
          },
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
                        descripcion,
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
              const Text('Gráfico de Dinero',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16.0),
              _buildMoneyChart(),
              const SizedBox(height: 32.0),
              const Text('Gráfico de Porcentaje',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16.0),
              _buildPercentageChart(),
              const SizedBox(height: 32.0),
              const Text('Gráfico de Tiempo de Preparación',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16.0),
              _buildTimeChart(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMoneyChart() {
    return LineChart(
      LineChartData(
        gridData: const FlGridData(show: false),
        titlesData: const FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        minX: 0,
        maxX: 10,
        minY: 0,
        maxY: 1000,
        lineBarsData: [
          LineChartBarData(
            spots: [
              const FlSpot(0, 200),
              const FlSpot(2, 500),
              const FlSpot(5, 750),
              const FlSpot(7, 1000),
              const FlSpot(9, 900),
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

  Widget _buildPercentageChart() {
    return PieChart(
      PieChartData(
        sections: [
          PieChartSectionData(value: 40, title: '40%', color: Colors.blue),
          PieChartSectionData(value: 30, title: '30%', color: Colors.green),
          PieChartSectionData(value: 30, title: '30%', color: Colors.red),
        ],
      ),
    );
  }

  Widget _buildTimeChart() {
    return BarChart(
      BarChartData(
        gridData: const FlGridData(show: false),
        titlesData: const FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        barGroups: [
          BarChartGroupData(
            x: 0,
            barRods: [
              BarChartRodData(fromY: 5, toY: 5, color: Colors.blue, width: 16)
            ],
          ),
          BarChartGroupData(
            x: 1,
            barRods: [
              BarChartRodData(fromY: 10, toY: 10, color: Colors.green, width: 16)
            ],
          ),
          BarChartGroupData(
            x: 2,
            barRods: [
              BarChartRodData(fromY: 7, toY: 7, color: Colors.red, width: 16)
            ],
          ),
        ],
      ),
    );
  }
}
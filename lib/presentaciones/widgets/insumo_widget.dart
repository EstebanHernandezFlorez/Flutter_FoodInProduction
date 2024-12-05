import 'package:flutter/material.dart';
import '../screens/performance_section.dart';

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
              // Sección superior: Nombre, imagen y descripción
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(imagenUrl, width: 100, height: 100),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
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
                  ),
                ],
              ),
              const SizedBox(height: 32.0),

              // Sección de rendimiento
              const Text(
                'Rendimiento del Insumo',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20.0),

              // Rendimiento en Porcentaje
              const PerformanceSection(
                title: 'Porcentaje de Éxito',
                value: '80%',
                color: Colors.blue,
                chartType: 'percentage',
              ),

              // Rendimiento en Dinero
              const PerformanceSection(
                title: 'Ingreso Estimado',
                value: '\$1,200',
                color: Colors.green,
                chartType: 'money',
              ),

              // Rendimiento en Tiempo
              const PerformanceSection(
                title: 'Tiempo de Preparación',
                value: '15 min',
                color: Colors.orange,
                chartType: 'time',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Órdenes de Producción',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: OrderProductionPage(),
    );
  }
}

class OrderProductionPage extends StatelessWidget {
  // Función para mostrar el modal de detalles
  void showOrderDetailModal(BuildContext context, String name, String detail,
      String status, String startTime, String endTime) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Detalles de la Orden'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Insumo: $detail'),
              Text('Empleado: $name'),
              Text('Estado: $status'),
              Text('Hora de Inicio: $startTime'),
              Text('Hora Final: $endTime'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el modal
              },
              child: const Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Órdenes de Producción',
          style: TextStyle(
            fontWeight: FontWeight.bold, // Negrita
          ),
        ),
        centerTitle: true, // Centrar el texto
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Due',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Jueves, 10:00am',
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'Órdenes acabadas de iniciar',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildOrderCard(
                  context,
                  name: 'Empleado 1',
                  detail: 'Solomo',
                  statusColor: Colors.green,
                  status: 'En progreso',
                  imageUrl: 'https://via.placeholder.com/48',
                  startTime: '10:00am',
                  endTime: '12:00pm',
                ),
                _buildOrderCard(
                  context,
                  name: 'Empleado 2',
                  detail: 'Hamburguesa',
                  statusColor: Colors.green,
                  status: 'En progreso',
                  imageUrl: 'https://via.placeholder.com/48',
                  startTime: '10:15am',
                  endTime: '12:15pm',
                ),
                _buildOrderCard(
                  context,
                  name: 'Empleado 3',
                  detail: 'Burrito',
                  statusColor: Colors.orange,
                  status: 'Pendientes',
                  imageUrl: 'https://via.placeholder.com/48',
                  startTime: '11:00am',
                  endTime: '1:00pm',
                ),
                _buildOrderCard(
                  context,
                  name: 'Empleado 1',
                  detail: 'Tacos',
                  statusColor: Colors.orange,
                  status: 'Pendientes',
                  imageUrl: 'https://via.placeholder.com/48',
                  startTime: '11:30am',
                  endTime: '1:30pm',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Modificar el widget para incluir el contexto y pasar la información al modal
  Widget _buildOrderCard(
    BuildContext context, {
    required String name,
    required String detail,
    required Color statusColor,
    required String status,
    required String imageUrl,
    required String startTime,
    required String endTime,
  }) {
    return GestureDetector(
      onTap: () {
        // Mostrar el modal al tocar la tarjeta
        showOrderDetailModal(context, name, detail, status, startTime, endTime);
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 12),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(imageUrl),
          ),
          title: Text(name),
          subtitle: Text(detail),
          trailing: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              status,
              style: TextStyle(
                color: statusColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

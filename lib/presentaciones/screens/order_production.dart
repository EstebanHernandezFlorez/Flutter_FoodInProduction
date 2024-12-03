import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OrderProductionPage extends StatefulWidget {
  const OrderProductionPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OrderProductionPageState createState() => _OrderProductionPageState();
}

class _OrderProductionPageState extends State<OrderProductionPage> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Órdenes de Producción'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Órdenes de Producción',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),

          Divider(
            height: 24.0,
            thickness: 1.0,
            color: Colors.grey[300],
          ),

          // Fila de orden en progreso
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Due', style: Theme.of(context).textTheme.titleMedium),
                Container(
                  width: 100.0,
                  height: 32.0,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'En progreso',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
              ],
            ),
          ),

          // Fecha y hora
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Jueves, 10:00am',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.blue,
                  ),
            ),
          ),

          // Subtítulo
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Text(
              'Órdenes recién iniciadas',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),

          // Paginación con PageView para las órdenes
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: PageView(
                controller: _pageController,
                children: [
                  _buildPageContent('Pendientes', 'Empleado 1', 'Solomo'),
                  _buildPageContent('En Progreso', 'Empleado 2', 'Cañon'),
                  _buildPageContent('Completadas', 'Empleado 3', 'Burrito'),
                ],
              ),
            ),
          ),

          // Indicador de página para navegar entre las órdenes
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: SmoothPageIndicator(
              controller: _pageController,
              count: 3,
              effect: const ExpandingDotsEffect(
                dotWidth: 8.0,
                dotHeight: 8.0,
                spacing: 8.0,
                dotColor: Colors.grey,
                activeDotColor: Colors.blue,
              ),
            ),
          ),

          // Botón de completar tarea
          Padding(
            padding: const EdgeInsets.only(bottom: 44.0),
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('¡Tarea completada!'),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Color del botón
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text('Marcar como completada'),
            ),
          ),
        ],
      ),
    );
  }

  // Widget para crear una tarjeta de orden de producción
  Widget _buildOrderCard(BuildContext context, String employeeName, String position, String imageUrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 7.0,
              color: Colors.grey.withOpacity(0.3),
              offset: const Offset(0.0, 3.0),
            ),
          ],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(40.0),
                child: Image.network(
                  imageUrl,
                  width: 40.0,
                  height: 40.0,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    employeeName,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    position,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget para el contenido de cada página
  Widget _buildPageContent(String title, String employeeName, String position) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16.0),
          _buildOrderCard(context, employeeName, position, 'https://images.unsplash.com/photo-1610737241336-371badac3b66?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDV8fHVzZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'),
        ],
      ),
    );
  }
}

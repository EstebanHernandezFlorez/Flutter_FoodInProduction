import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Notificación de Reserva Confirmada
        NotificationContainer(
          title: 'Reserva Confirmada',
          message: '¡Tu reserva ha sido confirmada, esperamos verte pronto!',
          icon: Icons.event_available,
          backgroundColor: Colors.green.shade100,
          imageUrl: 'assets/images/comida2.jpg',  // Asegúrate de tener esta imagen en la carpeta 'assets/images'
        ),
        const SizedBox(height: 16),
        // Notificación de Orden de Producción #1
        NotificationContainer(
          title: 'Orden de Producción #1234',
          message: 'Tu orden está en producción y se completará pronto.',
          icon: Icons.production_quantity_limits,
          backgroundColor: Colors.orange.shade100,
          imageUrl: 'assets/images/comida2.jpg',  // Asegúrate de tener esta imagen en la carpeta 'assets/images'
        ),
        const SizedBox(height: 16),
        // Notificación de Orden de Producción #2
        NotificationContainer(
          title: 'Orden de Producción #5678',
          message: 'Tu segunda orden está siendo procesada, estará lista pronto.',
          icon: Icons.production_quantity_limits,
          backgroundColor: Colors.orange.shade100,
          imageUrl: 'assets/images/comida2.jpg',  // Asegúrate de tener esta imagen en la carpeta 'assets/images'
        ),
      ],
    );
  }
}

class NotificationContainer extends StatelessWidget {
  final String title;
  final String message;
  final IconData icon;
  final Color backgroundColor;
  final String imageUrl;

  const NotificationContainer({
    required this.title,
    required this.message,
    required this.icon,
    required this.backgroundColor,
    required this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Imagen pequeña de la notificación
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              imageUrl,
              width: 80.0, // Hacemos la imagen más pequeña
              height: 80.0,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          // Contenido de texto de la notificación
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  message,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.black54,
                      ),
                ),
              ],
            ),
          ),
          // Icono de la notificación
          Icon(
            icon,
            color: Colors.black,
            size: 24.0,
          ),
        ],
      ),
    );
  }
}

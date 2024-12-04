import 'package:flutter/material.dart';
import '../screens/insumo.dart'; // Página de insumo
import '../screens/empleado.dart'; // Página de empleados
import '../screens/reservas.dart'; // Página de reservas
import '../screens/OrderProductionPage.dart'; // Página de órdenes de producción
import '../screens/landing_page_screen.dart'; // Página de inicio o landing

class PaginaPrincipalWidget extends StatefulWidget {
  const PaginaPrincipalWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PaginaPrincipalWidgetState createState() => _PaginaPrincipalWidgetState();
}

class _PaginaPrincipalWidgetState extends State<PaginaPrincipalWidget> {
  // Índice para controlar la página seleccionada
  int _selectedIndex = 0;

  // Lista de páginas a las que se puede navegar
  final List<Widget> _pages = [
    const LandingPageScreen(), // Página de inicio
    const InsumosPage(), // Página de insumo
    const EmployeesPage(), // Página de empleados
    const ReservasWidget(), // Página de reservas
     OrderProductionPage(), // Página de órdenes de producción
  ];

  // Cambiar de página según el índice seleccionado
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Actualiza la página seleccionada
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[
          _selectedIndex], // Muestra la página según el índice seleccionado
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer), // Icono de insumo
            label: 'Insumo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle), // Icono de empleado
            label: 'Empleado',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_rounded), // Icono de reservas
            label: 'Reservas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank), // Icono de producción
            label: 'Producción',
          ),
        ],
        currentIndex: _selectedIndex, // Índice actual
        selectedItemColor: Colors.blue, // Color de los íconos seleccionados
        unselectedItemColor:
            Colors.grey, // Color de los íconos no seleccionados
        onTap: _onItemTapped, // Cambia de página al tocar un ícono
      ),
    );
  }
}

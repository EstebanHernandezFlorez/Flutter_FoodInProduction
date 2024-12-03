import 'package:flutter/material.dart';
import '../screens/reservas.dart';
import '../screens/order_production.dart'; // Página de órdenes de producción
import '../screens/rendimiento.dart'; // Página de rendimiento
import '../screens/landing_page_screen.dart'; // Página de inicio o landing
import './editar_perfil.dart';

class PaginaPrincipalWidget extends StatefulWidget {
  const PaginaPrincipalWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PaginaPrincipalWidgetState createState() => _PaginaPrincipalWidgetState();
}

class _PaginaPrincipalWidgetState extends State<PaginaPrincipalWidget> {
  int _selectedIndex = 0;

  // Lista de páginas a las que se puede navegar
  final List<Widget> _pages = [
    const LandingPageScreen(),
    const OrderProductionPage(),
    const ReservasWidget(),
    const RendimientoEmpleadosWidget(),
    const EditWidget() // Página de inicio
  ];

  // Cambiar de página según el índice seleccionado
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Muestra la página según el índice seleccionado
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank),
            label: 'Órdenes de producción',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_rounded),
            label: 'Reservas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.groups),
            label: 'Rendimiento',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.adb_rounded),
            label: 'Mi Perfil',
          ),
          
        ],
        currentIndex: _selectedIndex, // Índice actual
        selectedItemColor: Colors.blue, // Color de los íconos seleccionados
        unselectedItemColor: Colors.grey, // Color de los íconos no seleccionados
        onTap: _onItemTapped, // Cambia de página al tocar un ícono
      ),
    );
  }
}

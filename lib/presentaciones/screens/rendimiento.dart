import 'package:flutter/material.dart';

class RendimientoEmpleadosWidget extends StatefulWidget {
  const RendimientoEmpleadosWidget({super.key});

  @override
  State<RendimientoEmpleadosWidget> createState() =>
      _RendimientoEmpleadosWidgetState();
}

class _RendimientoEmpleadosWidgetState extends State<RendimientoEmpleadosWidget>
    with TickerProviderStateMixin {
  late TextEditingController _textController1;
  late FocusNode _focusNode1;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _textController1 = TextEditingController();
    _focusNode1 = FocusNode();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _textController1.dispose();
    _focusNode1.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Rendimiento del Empleado'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Título y Barra de Búsqueda
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _textController1,
                  focusNode: _focusNode1,
                  decoration: InputDecoration(
                    labelText: 'Buscar Insumo',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                  ),
                ),
              ),
              // Resultados de búsqueda (dummy data)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Resultado',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              // Lista de insumos con empleados
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  height: 250.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildInsumoCard('Insumo 1', '4 empleados asociados', Icons.desktop_windows),
                      _buildInsumoCard('Insumo 2', '2 empleados asociados', Icons.design_services),
                      _buildInsumoCard('Insumo 3', '5 empleados asociados', Icons.build),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Método para construir las tarjetas de insumos
  Widget _buildInsumoCard(String title, String subtitle, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Container(
        width: 230.0,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: const [BoxShadow(blurRadius: 4.0, color: Colors.black26)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 140.0,
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 18.0,
                      backgroundColor: Colors.white,
                      child: Icon(
                        icon,
                        color: Colors.blue,
                        size: 24.0,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      title,
                      style: const TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                    Text(
                      subtitle,
                      style: const TextStyle(color: Colors.white70, fontSize: 12.0),
                    ),
                  ],
                ),
              ),
            ),
            // Aquí podrías agregar una fila de iconos o más datos
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(radius: 14.0, backgroundImage: NetworkImage('https://placekitten.com/50/50')),
                  SizedBox(width: 8.0),
                  CircleAvatar(radius: 14.0, backgroundImage: NetworkImage('https://placekitten.com/50/51')),
                  SizedBox(width: 8.0),
                  CircleAvatar(radius: 14.0, backgroundImage: NetworkImage('https://placekitten.com/50/52')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

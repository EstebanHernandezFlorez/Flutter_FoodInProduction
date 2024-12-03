import 'package:flutter/material.dart';
import '../widgets/insumo_widget.dart'; // Asegúrate de importar la página de detalles

class InsumosPage extends StatefulWidget {
  const InsumosPage({super.key});

  @override
  State<InsumosPage> createState() => _InsumosPageState();
}

class _InsumosPageState extends State<InsumosPage> {
  final List<Map<String, dynamic>> insumos = [
    {
      'nombre': 'Insumo 1',
      'descripcion': 'Descripción del insumo 1',
      'imagen': 'https://via.placeholder.com/150',
      'activo': true,
    },
    {
      'nombre': 'Insumo 2',
      'descripcion': 'Descripción del insumo 2',
      'imagen': 'https://via.placeholder.com/150',
      'activo': false,
    },
    {
      'nombre': 'Insumo 3',
      'descripcion': 'Descripción del insumo 3',
      'imagen': 'https://via.placeholder.com/150',
      'activo': true,
    },
    {
      'nombre': 'Insumo 4',
      'descripcion': 'Descripción del insumo 4',
      'imagen': 'https://via.placeholder.com/150',
      'activo': false,
    },
    {
      'nombre': 'Insumo 5',
      'descripcion': 'Descripción del insumo 5',
      'imagen': 'https://via.placeholder.com/150',
      'activo': true,
    },
  ];

  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> filteredInsumos = [];
  int currentPage = 0;
  static const int itemsPerPage = 3;

  @override
  void initState() {
    super.initState();
    filteredInsumos = insumos; // Inicialmente todos los insumos están visibles
  }

  void _filterInsumos(String query) {
    setState(() {
      filteredInsumos = insumos
          .where((insumo) => insumo['nombre']
              .toLowerCase()
              .contains(query.toLowerCase()))
          .toList();
      currentPage = 0; // Resetear a la primera página al filtrar
    });
  }

  List<Map<String, dynamic>> _getPaginatedInsumos() {
    int startIndex = currentPage * itemsPerPage;
    int endIndex = (currentPage + 1) * itemsPerPage;
    return filteredInsumos.sublist(
      startIndex,
      endIndex > filteredInsumos.length ? filteredInsumos.length : endIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insumos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              onChanged: _filterInsumos,
              decoration: const InputDecoration(
                labelText: 'Buscar insumo',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: _getPaginatedInsumos().length,
                itemBuilder: (context, index) {
                  final insumo = _getPaginatedInsumos()[index];
                  return _buildInsumoCard(
                    insumo['nombre'],
                    insumo['descripcion'],
                    insumo['imagen'],
                    insumo['activo'],
                    context,
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: currentPage > 0
                      ? () {
                          setState(() {
                            currentPage--;
                          });
                        }
                      : null,
                ),
                Text('Página ${currentPage + 1}'),
                IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: (currentPage + 1) * itemsPerPage < filteredInsumos.length
                      ? () {
                          setState(() {
                            currentPage++;
                          });
                        }
                      : null,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInsumoCard(String nombre, String descripcion, String imagenUrl, bool activo, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () {
          // Navegar a la página de detalles del insumo
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => InsumoWidget(
                nombre: nombre,
                descripcion: descripcion,
                imagenUrl: imagenUrl,
                activo: activo,
              ),
            ),
          );
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          elevation: 6.0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                ClipOval(
                  child: Image.network(
                    imagenUrl,
                    width: 70.0,
                    height: 70.0,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nombre,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        descripcion,
                        style: const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                CircleAvatar(
                  radius: 5.0,
                  backgroundColor: activo ? Colors.green : Colors.red,
                  
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

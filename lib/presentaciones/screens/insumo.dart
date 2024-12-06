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
      'nombre': 'Carne de Hamburguesa',
      'descripcion': 'Descripción del insumo 1',
      'imagen': 'lib/assets/images/carneHamburguesa.jpg',  // Ruta correcta
      'activo': true,
    },
    {
      'nombre': 'Carne de los tacos',
      'descripcion': 'Descripción del insumo 2',
      'imagen': 'lib/assets/images/tacos.jpg',  // Ruta correcta
      'activo': false,
    },
    {
      'nombre': 'Costillas',
      'descripcion': 'Descripción del insumo 3',
      'imagen': 'lib/assets/images/costillas.jpg',  // Ruta correcta
      'activo': true,
    },
    {
      'nombre': 'Solomo',
      'descripcion': 'Descripción del insumo 4',
      'imagen': 'lib/assets/images/solomo.jpg',  // Ruta correcta
      'activo': false,
    },
    {
      'nombre': 'Carne del Burrito',
      'descripcion': 'Descripción del insumo 5',
      'imagen': 'lib/assets/images/burrito.jpg',  // Ruta correcta
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
          .where((insumo) =>
              insumo['nombre'].toLowerCase().contains(query.toLowerCase()))
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
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12, horizontal: 16),
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
                  onPressed:
                      (currentPage + 1) * itemsPerPage < filteredInsumos.length
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

  Widget _buildInsumoCard(String nombre, String descripcion, String imagenUrl,
    bool activo, BuildContext context) {
      return Card(
        margin: const EdgeInsets.symmetric(vertical: 12.0),  // Aumentar margen
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),  // Card más redondeada
        ),
        elevation: 6.0,  // Sombra más fuerte para mayor profundidad
        child: InkWell(
          onTap: () {
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
          child: Padding(
            padding: const EdgeInsets.all(16.0),  // Aumentamos el padding interno
            child: Row(
              children: [
                // Imagen más grande
                Container(
                  width: 70.0,  // Aumentamos el tamaño de la imagen
                  height: 70.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      imagenUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                // Información del insumo
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        nombre,
                        style: const TextStyle(
                          fontSize: 18,  // Mayor tamaño para el nombre
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 6.0),
                      Text(
                        descripcion,
                        style: TextStyle(
                          fontSize: 14,  // Aumentamos el tamaño de la descripción
                          color: Colors.grey[600],
                        ),
                        maxLines: 2,  // Permitimos 2 líneas para la descripción
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                // Indicador de estado
                Container(
                  width: 10.0,
                  height: 10.0,
                  margin: const EdgeInsets.only(left: 12.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: activo ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
}

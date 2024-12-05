import 'package:flutter/material.dart';
import '../widgets/empleado_widget.dart';

class EmployeesPage extends StatefulWidget {
  const EmployeesPage({super.key});

  @override
  State<EmployeesPage> createState() => _EmployeesPageState();
}

class _EmployeesPageState extends State<EmployeesPage> {
  final List<Map<String, dynamic>> employees = [
    {
      'nombre': 'Juan Pérez',
      'cargo': 'Chef Principal',
      'imagen': 'https://via.placeholder.com/150',
      'activo': true,
    },
    {
      'nombre': 'María González',
      'cargo': 'Sous Chef',
      'imagen': 'https://via.placeholder.com/150',
      'activo': false,
    },
    {
      'nombre': 'Carlos Rodríguez',
      'cargo': 'Cocinero',
      'imagen': 'https://via.placeholder.com/150',
      'activo': true,
    },
  ];

  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> filteredEmployees = [];
  int currentPage = 0;
  static const int itemsPerPage = 3;

  @override
  void initState() {
    super.initState();
    filteredEmployees = employees;
  }

  void _filterEmployees(String query) {
    setState(() {
      filteredEmployees = employees
          .where((employee) => employee['nombre']
              .toLowerCase()
              .contains(query.toLowerCase()))
          .toList();
      currentPage = 0;
    });
  }

  List<Map<String, dynamic>> _getPaginatedEmployees() {
    int startIndex = currentPage * itemsPerPage;
    int endIndex = (currentPage + 1) * itemsPerPage;
    return filteredEmployees.sublist(
      startIndex,
      endIndex > filteredEmployees.length ? filteredEmployees.length : endIndex,
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
              onChanged: _filterEmployees,
              decoration: const InputDecoration(
                labelText: 'Buscar empleado',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: _getPaginatedEmployees().length,
                itemBuilder: (context, index) {
                  final employee = _getPaginatedEmployees()[index];
                  return _buildEmployeeCard(
                    employee['nombre'],
                    employee['cargo'],
                    employee['imagen'],
                    employee['activo'],
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
                  onPressed: (currentPage + 1) * itemsPerPage < filteredEmployees.length
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

  Widget _buildEmployeeCard(String nombre, String cargo, String imagenUrl, bool activo, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EmployeeWidget(
                nombre: nombre,
                cargo: cargo,
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
                        cargo,
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
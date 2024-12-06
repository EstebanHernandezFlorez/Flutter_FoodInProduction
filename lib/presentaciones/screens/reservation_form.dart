import 'package:flutter/material.dart';

class ReservationForm extends StatefulWidget {
  const ReservationForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ReservationFormState createState() => _ReservationFormState();
}

class _ReservationFormState extends State<ReservationForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _eventNameController = TextEditingController();
  final TextEditingController _eventTimeController = TextEditingController();
  final TextEditingController _eventDateController = TextEditingController();
  final TextEditingController _observationsController = TextEditingController();

  // Function to clear form inputs
  void _clearForm() {
    _eventNameController.clear();
    _eventTimeController.clear();
    _eventDateController.clear();
    _observationsController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Campo para el nombre del evento
            TextFormField(
              controller: _eventNameController,
              decoration: const InputDecoration(
                labelText: 'Nombre del evento',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese el nombre del evento';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Campo para la hora del evento
            TextFormField(
              controller: _eventTimeController,
              decoration: const InputDecoration(
                labelText: 'Hora del evento',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.datetime,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese la hora del evento';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Campo para la fecha del evento
            TextFormField(
              controller: _eventDateController,
              decoration: const InputDecoration(
                labelText: 'Fecha del evento',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.datetime,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese la fecha del evento';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Campo para observaciones
            TextFormField(
              controller: _observationsController,
              decoration: const InputDecoration(
                labelText: 'Observaciones',
                border: OutlineInputBorder(),
              ),
              maxLines: 4, // Permite múltiples líneas para observaciones
            ),
            const SizedBox(height: 16),

            // Botones para guardar y limpiar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Validar formulario
                    if (_formKey.currentState?.validate() ?? false) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Reserva guardada')),
                      );
                    }
                  },
                  child: const Text('Guardar'),
                ),
                ElevatedButton(
                  onPressed: _clearForm,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text('Limpiar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}





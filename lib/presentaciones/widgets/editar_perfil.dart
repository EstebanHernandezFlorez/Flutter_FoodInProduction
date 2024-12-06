import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _documentoController =
      TextEditingController(text: '12345678');
  final TextEditingController _nombreCompletoController =
      TextEditingController(text: 'Lina Marcela');
  final TextEditingController _correoController =
      TextEditingController(text: 'lina@example.com');
  final TextEditingController _celularController =
      TextEditingController(text: '1234567890');
  final TextEditingController _rolController =
      TextEditingController(text: 'Admin');
  final TextEditingController _contrasenaController = TextEditingController();
  final TextEditingController _confirmarContrasenaController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Perfil'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildReadOnlyField(
                label: 'Documento',
                controller: _documentoController,
              ),
              const SizedBox(height: 16),
              _buildReadOnlyField(
                label: 'Nombre Completo',
                controller: _nombreCompletoController,
              ),
              const SizedBox(height: 16),
              _buildEditableField(
                label: 'Correo',
                controller: _correoController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El correo es obligatorio.';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Ingrese un correo válido.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              _buildEditableField(
                label: 'Celular',
                controller: _celularController,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El celular es obligatorio.';
                  }
                  if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                    return 'Ingrese un celular válido (10 dígitos).';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              _buildReadOnlyField(
                label: 'Rol',
                controller: _rolController,
              ),
              const SizedBox(height: 16),
              _buildEditableField(
                label: 'Contraseña',
                controller: _contrasenaController,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'La contraseña es obligatoria.';
                  }
                  if (value.length < 6) {
                    return 'La contraseña debe tener al menos 6 caracteres.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              _buildEditableField(
                label: 'Confirmar Contraseña',
                controller: _confirmarContrasenaController,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Debe confirmar la contraseña.';
                  }
                  if (value != _contrasenaController.text) {
                    return 'Las contraseñas no coinciden.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text('Guardar Cambios'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReadOnlyField({
    required String label,
    required TextEditingController controller,
  }) {
    return TextFormField(
      controller: controller,
      readOnly: true,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }

  Widget _buildEditableField({
    required String label,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      validator: validator,
    );
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      // Guardar cambios
      if (kDebugMode) {
        print('Documento: ${_documentoController.text}');
      }
      if (kDebugMode) {
        print('Nombre Completo: ${_nombreCompletoController.text}');
      }
      if (kDebugMode) {
        print('Correo: ${_correoController.text}');
      }
      if (kDebugMode) {
        print('Celular: ${_celularController.text}');
      }
      if (kDebugMode) {
        print('Rol: ${_rolController.text}');
      }
      if (kDebugMode) {
        print('Contraseña: ${_contrasenaController.text}');
      }
    }
  }

  @override
  void dispose() {
    _documentoController.dispose();
    _nombreCompletoController.dispose();
    _correoController.dispose();
    _celularController.dispose();
    _rolController.dispose();
    _contrasenaController.dispose();
    _confirmarContrasenaController.dispose();
    super.dispose();
  }
}

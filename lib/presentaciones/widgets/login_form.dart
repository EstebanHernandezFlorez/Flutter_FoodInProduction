import 'package:flutter/material.dart';
import 'package:flutter_food/presentaciones/widgets/ForgotPassword.dart';

// Aquí podrías importar las pantallas de destino.
import '../widgets/order_column.dart'; // Asegúrate de tener esta clase
import '../screens/index_empleado.dart'; // Asegúrate de tener esta clase

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  // Controladores de los TextFormField
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Estado de visibilidad de la contraseña
  bool _passwordVisible = false;

  // Función de validación de credenciales
  void _validateCredentials(String username, String password) {
    // Aquí puedes agregar tu lógica de autenticación (API, Firebase, etc.)
    // Ahora vamos a redirigir a diferentes pantallas según las credenciales.

    if (username == "admin" && password == "1234") {
      // Si es un administrador, redirige a la página del administrador
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const PaginaPrincipalWidget()),
      );
    } else if (username == "user" && password == "abcd") {
      // Si es un usuario común, redirige a la página de usuario
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const PaginaEmpleadosWidget()),
      );
    } else {
      // Si las credenciales son incorrectas, mostrar un mensaje de error
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Credenciales incorrectas')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F4F8), // Color de fondo
      body: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Imagen de la aplicación
                Container(
                  width: 220.0,
                  height: 220.0,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'lib/assets/images/IconoFIP.png', // Asegúrate de tener esta imagen en tu proyecto
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Bienvenido',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 32.0),
                // Formulario de login
                Material(
                  color:
                      Colors.transparent, // Hacer que el fondo sea transparente
                  elevation: 0.0, // Eliminar la elevación para evitar sombras
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color:
                          Colors.transparent, // Eliminar fondo blanco o oscuro
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        children: [
                          // Campo de texto para el usuario
                          TextFormField(
                            controller: _usernameController,
                            decoration: InputDecoration(
                              labelText: 'Usuario',
                              labelStyle: const TextStyle(
                                  color: Colors.black), // Color de la etiqueta
                              filled: false, // Sin fondo
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: const BorderSide(
                                    color: Colors.black), // Color del borde
                              ),
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          // Campo de texto para la contraseña
                          TextFormField(
                            controller: _passwordController,
                            obscureText: !_passwordVisible,
                            decoration: InputDecoration(
                              labelText: 'Contraseña',
                              labelStyle: const TextStyle(
                                  color: Colors.black), // Color de la etiqueta
                              filled: false, // Sin fondo
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: const BorderSide(
                                    color: Colors.black), // Color del borde
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ForgotPassword(),
                                ),
                              );
                            },
                            child: const Text(
                              'Olvidé mi contraseña',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                          const SizedBox(height: 32.0),
                          // Botón de iniciar sesión
                          ElevatedButton(
                            onPressed: () {
                              // Obtener los valores de los campos
                              String username = _usernameController.text;
                              String password = _passwordController.text;

                              // Validar las credenciales
                              _validateCredentials(username, password);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 155, 14, 14),
                              padding: const EdgeInsets.symmetric(
                                vertical: 18.0,
                                horizontal: 32.0,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            ),
                            child: const Text(
                              'Iniciar sesión',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

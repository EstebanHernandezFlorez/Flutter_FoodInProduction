import 'package:flutter/material.dart';
import '../widgets/notification_card.dart';
import '../widgets/editar_perfil.dart'; // Importa la clase EditProfileScreen
import '../widgets/login_form.dart'; // Importa la clase LoginWidget

class LandingPageScreen extends StatelessWidget {
  const LandingPageScreen({super.key});

  void _logout(BuildContext context) {
    // Lógica para cerrar sesión y navegar al LoginWidget
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginWidget()),
    );
  }

  void _editProfile(BuildContext context) {
    // Navegar a la pantalla de edición de perfil
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const EditProfileScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading:
            false, // Desactivamos el retroceso automático
        actions: [
          // Ícono de usuario con menú desplegable
          PopupMenuButton<String>(
            icon: const Icon(Icons.person,
                color: Colors.black), // Ícono de usuario
            onSelected: (value) {
              if (value == 'Editar perfil') {
                _editProfile(context);
              } else if (value == 'Cerrar sesión') {
                _logout(context);
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<String>(
                  value: 'Editar perfil',
                  child: Row(
                    children: [
                      Icon(Icons.edit),
                      SizedBox(width: 8),
                      Text('Editar perfil'),
                    ],
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'Cerrar sesión',
                  child: Row(
                    children: [
                      Icon(Icons.logout),
                      SizedBox(width: 8),
                      Text('Cerrar sesión'),
                    ],
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NotificationCard(),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

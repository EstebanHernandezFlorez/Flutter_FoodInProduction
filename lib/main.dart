import 'package:flutter/material.dart';
import '../presentaciones/widgets/login_form.dart'; // Asegúrate de importar tu widget de login
import '../screens/OrderProductionPage.dart'; // Página de órdenes de producción
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,  // Elimina el banner de depuración
      title: 'Mi App',
      home: LoginWidget(),  // Este es tu login
      // initialRoute: 
    );
   
  }
}

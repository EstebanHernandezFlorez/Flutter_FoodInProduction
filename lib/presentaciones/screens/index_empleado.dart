import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../widgets/inicio_rendimiento_widget.dart';

class PaginaEmpleadosWidget extends StatefulWidget {
  const PaginaEmpleadosWidget({super.key});

  @override
  State<PaginaEmpleadosWidget> createState() => _PaginaEmpleadosWidgetState();
}

class _PaginaEmpleadosWidgetState extends State<PaginaEmpleadosWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFFFBF9F5),
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(
              Icons.menu,
              color: Color(0xFF101518),
              size: 24.0,
            ),
            onPressed: () {
              if (kDebugMode) {
                print('IconButton pressed ...');
              }
            },
          ),
          title: const Text(
            'Time Tracker',
            style: TextStyle(
              fontFamily: 'Readex Pro',
              color: Color(0xFF101518),
              fontSize: 28.0,
              fontWeight: FontWeight.normal,
            ),
          ),
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Material(
                    color: Colors.transparent,
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'Start New Task',
                              style: TextStyle(
                                fontFamily: 'Readex Pro',
                                color: Color(0xFF101518),
                                fontSize: 24.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFBF9F5),
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: const Color(0xFFEDE8DF),
                                  width: 1.0,
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Seleccionar empleado',
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        color: Color(0xFF57636C),
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Color(0xFF57636C),
                                      size: 24.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFBF9F5),
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: const Color(0xFFEDE8DF),
                                  width: 1.0,
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Seleccionar insumo',
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        color: Color(0xFF57636C),
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Color(0xFF57636C),
                                      size: 24.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // Navegar a la pantalla de inicio de rendimiento
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const InicioderendimientoWidget(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF507583),
                                padding: const EdgeInsets.all(14.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                              ),
                              child: const Text(
                                'Iniciar Orden de produccion',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ].map((child) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16.0),
                              child: child,
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'Orden con Empleados',
                              style: TextStyle(
                                fontFamily: 'Readex Pro',
                                color: Color(0xFF101518),
                                fontSize: 24.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            ListView(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              children: [
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFBF9F5),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Product Assembly',
                                              style: TextStyle(
                                                fontFamily: 'Inter',
                                                color: Color(0xFF101518),
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            Text(
                                              'John Smith',
                                              style: TextStyle(
                                                fontFamily: 'Inter',
                                                color: Color(0xFF57636C),
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          '2h 15m',
                                          style: TextStyle(
                                            fontFamily: 'Inter',
                                            color: Color(0xFF507583),
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFBF9F5),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Quality Check',
                                              style: TextStyle(
                                                fontFamily: 'Inter',
                                                color: Color(0xFF101518),
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            Text(
                                              'Sarah Johnson',
                                              style: TextStyle(
                                                fontFamily: 'Inter',
                                                color: Color(0xFF57636C),
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          '45m',
                                          style: TextStyle(
                                            fontFamily: 'Inter',
                                            color: Color(0xFF507583),
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFBF9F5),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Assembly Line',
                                              style: TextStyle(
                                                fontFamily: 'Inter',
                                                color: Color(0xFF101518),
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            Text(
                                              'Michael Lee',
                                              style: TextStyle(
                                                fontFamily: 'Inter',
                                                color: Color(0xFF57636C),
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          '3h 30m',
                                          style: TextStyle(
                                            fontFamily: 'Inter',
                                            color: Color(0xFF507583),
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
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
      ),
    );
  }
}

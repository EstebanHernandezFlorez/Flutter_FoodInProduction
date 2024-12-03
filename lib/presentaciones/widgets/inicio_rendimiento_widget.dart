// ignore_for_file: unused_field

import 'dart:async'; // Importar para usar Timer
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class InicioderendimientoWidget extends StatefulWidget {
  const InicioderendimientoWidget({super.key});

  @override
  State<InicioderendimientoWidget> createState() =>
      _InicioderendimientoWidgetState();
}

class _InicioderendimientoWidgetState extends State<InicioderendimientoWidget> {
  // Variables para el cronómetro
  late Timer _timer;
  int _start = 0; // Tiempo transcurrido en segundos
  bool _isRunning = false; // Si el cronómetro está en ejecución
  bool _isTimerStopped = false; // Indicar si el cronómetro fue detenido
  bool _showNextStep = false; // Mostrar el siguiente paso después de detener el cronómetro

  // Iniciar el cronómetro
  void _startTimer() {
    _isRunning = true;
    _start = 0; // Restablecer el tiempo antes de iniciar
    _isTimerStopped = false;
    _showNextStep = false; // Ocultar el siguiente paso mientras el cronómetro está en marcha

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _start++;
      });
    });
  }

  // Detener el cronómetro
  void _stopTimer() {
    _isRunning = false;
    _timer.cancel();
    setState(() {
      _isTimerStopped = true;
      _showNextStep = true; // Mostrar el siguiente paso después de detener el cronómetro
    });
  }

  // Convertir los segundos a un formato "mm:ss"
  String get _formattedTime {
    int minutes = (_start / 60).floor();
    int seconds = _start % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    // Cancelar el cronómetro al salir de la pantalla
    if (_isRunning) {
      _timer.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF1F4F8),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 1.0,
                height: 180.0,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFFF6A73), Color(0xFFF83B46)],
                    stops: [0.0, 1.0],
                    begin: AlignmentDirectional(0.0, -1.0),
                    end: AlignmentDirectional(0, 1.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Juan Pérez',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              Text(
                                'Auxiliar de cocina',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: const Color(0x33FFFFFF),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25.0),
                              child: Image.network(
                                'https://images.unsplash.com/photo-1621523379741-0db8b7c11ac2?w=500&h=500',
                                width: 50.0,
                                height: 50.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 1.0,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Material(
                        color: Colors.transparent,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 1.0,
                          height: 600.0,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF1F4F8),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Buscar insumo',
                                      style: TextStyle(
                                        color: Color(0xFF14181B),
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: _isRunning
                                          ? _stopTimer
                                          : _startTimer,
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xFFF83B46),
                                        padding: const EdgeInsets.all(8.0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20.0),
                                        ),
                                      ),
                                      child: Text(
                                        _isRunning ? 'Detener' : 'Iniciar',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                // Mostrar el cronómetro
                                Text(
                                  'Tiempo: $_formattedTime',
                                  style: const TextStyle(
                                    color: Color(0xFF14181B),
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                const Text(
                                  'Realizar una evaluación completa del estado actual del equipo, identificando posibles problemas y necesidades de mantenimiento.',
                                  style: TextStyle(
                                    color: Color(0xFF14181B),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                const Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Tiempo estimado: 5min',
                                      style: TextStyle(
                                        color: Color(0xFF677681),
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 30),
                                // Si el cronómetro fue detenido, mostrar el siguiente paso
                                if (_showNextStep)
                                  Column(
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          // Acción para el siguiente paso
                                          if (kDebugMode) {
                                            print('Realizar siguiente paso');
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color(0xFF507583),
                                          padding: const EdgeInsets.all(12.0),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(25.0),
                                          ),
                                        ),
                                        child: const Text('Siguiente paso'),
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
            ],
          ),
        ),
      ),
    );
  }
}

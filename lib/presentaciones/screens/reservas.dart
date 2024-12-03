import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart'; // Importamos TableCalendar
import 'reservation_form.dart';

// Pantalla de creación de reserva (Formulario)
class CreateReservationPage extends StatelessWidget {
  const CreateReservationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear Reserva'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Formulario para crear una reserva',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            const ReservationForm(),  // Llamamos al formulario aquí
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Volver a la pantalla principal
              },
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}

class ReservasWidget extends StatefulWidget {
  const ReservasWidget({super.key});

  @override
  State<ReservasWidget> createState() => _ReservasWidgetState();
}

class _ReservasWidgetState extends State<ReservasWidget> with SingleTickerProviderStateMixin {
  DateTime _selectedDay = DateTime.now();
  DateTime? _focusedDay;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _focusedDay = _selectedDay;
    _tabController = TabController(length: 2, vsync: this); // Para el TabBar de Mes y Semana
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Reservas'),
          elevation: 0.0,
        ),
        body: Column(
          children: [
            // TabBar para cambiar entre vistas de Mes y Semana
            TabBar(
              controller: _tabController,
              tabs: const [
                Tab(text: 'Month'),
                Tab(text: 'Week'),
              ],
            ),
            // El TabBarView donde se muestran las vistas del calendario
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Vista de Mes
                  _buildMonthView(),
                  // Vista de Semana
                  _buildWeekView(),
                ],
              ),
            ),
            // Aquí se muestra el "Coming Up" debajo del calendario
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Coming Up',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8.0), // Espacio entre "Coming Up" y las reservas
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _buildReservationCard('Boda', '2:20pm', 'Wed, 03/08/2022', Colors.blueAccent),
                  _buildReservationCard('Cumpleaños', '5:20pm', 'Wed, 03/08/2022', Colors.greenAccent),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Navegar al formulario de creación de reserva
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CreateReservationPage()),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  // Vista de calendario en modo mes
  Widget _buildMonthView() {
    return TableCalendar(
      focusedDay: _focusedDay!,
      firstDay: DateTime(2020),
      lastDay: DateTime(2025),
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
        });
        // Navegar al formulario de creación de reserva al seleccionar un día
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CreateReservationPage()),
        );
      },
      onPageChanged: (focusedDay) {
        setState(() {
          _focusedDay = focusedDay;
        });
      },
      calendarStyle: const CalendarStyle(
        todayDecoration: BoxDecoration(
          color: Colors.blueAccent,
          shape: BoxShape.circle,
        ),
        selectedDecoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
        ),
        weekendTextStyle: TextStyle(
          color: Colors.red,
        ),
      ),
      headerStyle: const HeaderStyle(
        formatButtonVisible: false,
      ),
    );
  }

  // Vista de calendario en modo semana
  Widget _buildWeekView() {
    return TableCalendar(
      focusedDay: _focusedDay!,
      firstDay: DateTime(2020),
      lastDay: DateTime(2025),
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
        });
        // Navegar al formulario de creación de reserva al seleccionar un día
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CreateReservationPage()),
        );
      },
      onPageChanged: (focusedDay) {
        setState(() {
          _focusedDay = focusedDay;
        });
      },
      availableGestures: AvailableGestures.all,
      calendarStyle: const CalendarStyle(
        todayDecoration: BoxDecoration(
          color: Colors.blueAccent,
          shape: BoxShape.circle,
        ),
        selectedDecoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
        ),
        weekendTextStyle: TextStyle(
          color: Colors.red,
        ),
      ),
      headerStyle: const HeaderStyle(
        formatButtonVisible: false,
      ),
      daysOfWeekStyle: const DaysOfWeekStyle(
        weekdayStyle: TextStyle(color: Colors.black),
        weekendStyle: TextStyle(color: Colors.red),
      ),
      weekNumbersVisible: false, // Deshabilita la visualización de los números de semana
    );
  }

  // Función para construir las tarjetas de reserva
  Widget _buildReservationCard(String title, String time, String date, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 4.0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Card(
                        color: color,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                          child: Text(
                            time,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        date,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Icon(
                  Icons.add_photo_alternate_outlined,
                  color: Colors.black,
                  size: 24.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

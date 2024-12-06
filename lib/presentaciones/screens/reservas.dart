
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class Reservation {
  final String title;
  final DateTime dateTime;

  Reservation({
    required this.title,
    required this.dateTime,
  });
}

class ReservasWidget extends StatefulWidget {
  const ReservasWidget({Key? key}) : super(key: key);

  @override
  State<ReservasWidget> createState() => _ReservasWidgetState();
}

class _ReservasWidgetState extends State<ReservasWidget> with SingleTickerProviderStateMixin {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  late TabController _tabController;

  List<Reservation> _reservations = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  void _addReservation(String title, DateTime dateTime) {
    setState(() {
      _reservations.add(Reservation(title: title, dateTime: dateTime));
      _reservations.sort((a, b) => a.dateTime.compareTo(b.dateTime));
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Reservas'),
        ),
        body: Column(
          children: [
            // TabBar para cambiar entre vistas de Mes y Semana
            TabBar(
              controller: _tabController,
              tabs: const [
                Tab(text: 'Mes'),
                Tab(text: 'Semana'),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildMonthView(),
                  _buildWeekView(),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Próximas reservas',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _reservations.length,
                itemBuilder: (context, index) {
                  final reservation = _reservations[index];
                  return _buildReservationCard(reservation);
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CreateReservationPage(
                  onSave: _addReservation,
                  initialDate: _selectedDay,
                ),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Widget _buildMonthView() {
    return TableCalendar(
      focusedDay: _focusedDay,
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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CreateReservationPage(
              onSave: _addReservation,
              initialDate: selectedDay,
            ),
          ),
        );
      },
      onPageChanged: (focusedDay) {
        _focusedDay = focusedDay;
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
        cellMargin: EdgeInsets.all(4),
        cellPadding: EdgeInsets.all(2),
      ),
      headerStyle: const HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        titleTextStyle: TextStyle(fontSize: 16),
        leftChevronIcon: Icon(Icons.chevron_left, size: 20),
        rightChevronIcon: Icon(Icons.chevron_right, size: 20),
      ),
      daysOfWeekHeight: 20,
      rowHeight: 35,
    );
  }

  Widget _buildWeekView() {
    return TableCalendar(
      focusedDay: _focusedDay,
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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CreateReservationPage(
              onSave: _addReservation,
              initialDate: selectedDay,
            ),
          ),
        );
      },
      onPageChanged: (focusedDay) {
        _focusedDay = focusedDay;
      },
      availableGestures: AvailableGestures.all,
      calendarFormat: CalendarFormat.week,
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
        cellMargin: EdgeInsets.all(4),
        cellPadding: EdgeInsets.all(2),
      ),
      headerStyle: const HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        titleTextStyle: TextStyle(fontSize: 16),
        leftChevronIcon: Icon(Icons.chevron_left, size: 20),
        rightChevronIcon: Icon(Icons.chevron_right, size: 20),
      ),
      daysOfWeekStyle: const DaysOfWeekStyle(
        weekdayStyle: TextStyle(color: Colors.black, fontSize: 12),
        weekendStyle: TextStyle(color: Colors.red, fontSize: 12),
      ),
      weekNumbersVisible: false,
      daysOfWeekHeight: 20,
      rowHeight: 35,
    );
  }

  Widget _buildReservationCard(Reservation reservation) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
                    reservation.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    DateFormat('yyyy-MM-dd HH:mm').format(reservation.dateTime),
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
              Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Icon(
                  Icons.event,
                  color: Colors.white,
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

class CreateReservationPage extends StatefulWidget {
  final Function(String, DateTime) onSave;
  final DateTime initialDate;

  const CreateReservationPage({
    Key? key,
    required this.onSave,
    required this.initialDate,
  }) : super(key: key);

  @override
  State<CreateReservationPage> createState() => _CreateReservationPageState();
}

class _CreateReservationPageState extends State<CreateReservationPage> {
  final _titleController = TextEditingController();
  late DateTime _selectedDate;
  late TimeOfDay _selectedTime;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
    _selectedTime = TimeOfDay.now();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

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
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Título'),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text(
                  'Fecha: ${DateFormat('yyyy-MM-dd').format(_selectedDate)}',
                  style: const TextStyle(fontSize: 16),
                ),
                IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () => _selectDate(context),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Hora: ${_selectedTime.format(context)}',
                  style: const TextStyle(fontSize: 16),
                ),
                IconButton(
                  icon: const Icon(Icons.access_time),
                  onPressed: () => _selectTime(context),
                ),
              ],
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                if (_titleController.text.isNotEmpty) {
                  widget.onSave(
                    _titleController.text,
                    DateTime(_selectedDate.year, _selectedDate.month, _selectedDate.day,
                        _selectedTime.hour, _selectedTime.minute),
                  );
                  Navigator.pop(context);
                }
              },
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';

// class Reservation {
//   final String title;
//   final String time;
//   final String date;

//   Reservation({
//     required this.title,
//     required this.time,
//     required this.date,
//   });
// }

// class ReservasWidget extends StatefulWidget {
//   const ReservasWidget({Key? key}) : super(key: key);

//   @override
//   State<ReservasWidget> createState() => _ReservasWidgetState();
// }

// class _ReservasWidgetState extends State<ReservasWidget> with SingleTickerProviderStateMixin {
//   DateTime _selectedDay = DateTime.now();
//   DateTime _focusedDay = DateTime.now();
//   late TabController _tabController;

//   List<Reservation> _reservations = [];

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 2, vsync: this);
//   }

//   void _addReservation(String title, String time, String date) {
//     setState(() {
//       _reservations.add(Reservation(title: title, time: time, date: date));
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Reservas'),
//       ),
//       body: Column(
//         children: [
//           TabBar(
//             controller: _tabController,
//             tabs: const [
//               Tab(text: 'Mes'),
//               Tab(text: 'Semana'),
//             ],
//           ),
//           SizedBox(
//             height: MediaQuery.of(context).size.height * 0.45,
//             child: TabBarView(
//               controller: _tabController,
//               children: [
//                 _buildMonthView(),
//                 _buildWeekView(),
//               ],
//             ),
//           ),
//           const Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Text(
//               'Próximas reservas',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: _reservations.length,
//               itemBuilder: (context, index) {
//                 final reservation = _reservations[index];
//                 return _buildReservationCard(
//                   reservation.title,
//                   reservation.time,
//                   reservation.date,
//                   Colors.blueAccent,
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => CreateReservationPage(
//                 onSave: _addReservation,
//                 selectedDate: _selectedDay,
//               ),
//             ),
//           );
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }

//   Widget _buildMonthView() {
//     return TableCalendar(
//       focusedDay: _focusedDay,
//       firstDay: DateTime(2020),
//       lastDay: DateTime(2025),
//       selectedDayPredicate: (day) {
//         return isSameDay(_selectedDay, day);
//       },
//       onDaySelected: (selectedDay, focusedDay) {
//         setState(() {
//           _selectedDay = selectedDay;
//           _focusedDay = focusedDay;
//         });
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => CreateReservationPage(
//               onSave: _addReservation,
//               selectedDate: selectedDay,
//             ),
//           ),
//         );
//       },
//       onPageChanged: (focusedDay) {
//         _focusedDay = focusedDay;
//       },
//       calendarStyle: const CalendarStyle(
//         todayDecoration: BoxDecoration(
//           color: Colors.blueAccent,
//           shape: BoxShape.circle,
//         ),
//         selectedDecoration: BoxDecoration(
//           color: Colors.blue,
//           shape: BoxShape.circle,
//         ),
//         weekendTextStyle: TextStyle(
//           color: Colors.red,
//         ),
//         cellMargin: EdgeInsets.all(4),
//         cellPadding: EdgeInsets.all(2),
//       ),
//       headerStyle: const HeaderStyle(
//         formatButtonVisible: false,
//         titleCentered: true,
//         titleTextStyle: TextStyle(fontSize: 16),
//         leftChevronIcon: Icon(Icons.chevron_left, size: 20),
//         rightChevronIcon: Icon(Icons.chevron_right, size: 20),
//       ),
//       daysOfWeekHeight: 20,
//       rowHeight: 35,
//     );
//   }

//   Widget _buildWeekView() {
//     return TableCalendar(
//       focusedDay: _focusedDay,
//       firstDay: DateTime(2020),
//       lastDay: DateTime(2025),
//       selectedDayPredicate: (day) {
//         return isSameDay(_selectedDay, day);
//       },
//       onDaySelected: (selectedDay, focusedDay) {
//         setState(() {
//           _selectedDay = selectedDay;
//           _focusedDay = focusedDay;
//         });
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => CreateReservationPage(
//               onSave: _addReservation,
//               selectedDate: selectedDay,
//             ),
//           ),
//         );
//       },
//       onPageChanged: (focusedDay) {
//         _focusedDay = focusedDay;
//       },
//       availableGestures: AvailableGestures.all,
//       calendarStyle: const CalendarStyle(
//         todayDecoration: BoxDecoration(
//           color: Colors.blueAccent,
//           shape: BoxShape.circle,
//         ),
//         selectedDecoration: BoxDecoration(
//           color: Colors.blue,
//           shape: BoxShape.circle,
//         ),
//         weekendTextStyle: TextStyle(
//           color: Colors.red,
//         ),
//         cellMargin: EdgeInsets.all(4),
//         cellPadding: EdgeInsets.all(2),
//       ),
//       headerStyle: const HeaderStyle(
//         formatButtonVisible: false,
//         titleCentered: true,
//         titleTextStyle: TextStyle(fontSize: 16),
//         leftChevronIcon: Icon(Icons.chevron_left, size: 20),
//         rightChevronIcon: Icon(Icons.chevron_right, size: 20),
//       ),
//       daysOfWeekStyle: const DaysOfWeekStyle(
//         weekdayStyle: TextStyle(color: Colors.black, fontSize: 12),
//         weekendStyle: TextStyle(color: Colors.red, fontSize: 12),
//       ),
//       weekNumbersVisible: false,
//       daysOfWeekHeight: 20,
//       rowHeight: 35,
//     );
//   }

//   Widget _buildReservationCard(String title, String time, String date, Color color) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//       child: Card(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(8.0),
//         ),
//         elevation: 4.0,
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     title,
//                     style: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Row(
//                     children: [
//                       Card(
//                         color: color,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8.0),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
//                           child: Text(
//                             time,
//                             style: const TextStyle(
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 8.0),
//                       Text(
//                         date,
//                         style: const TextStyle(fontSize: 12),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               Container(
//                 width: 50.0,
//                 height: 50.0,
//                 decoration: BoxDecoration(
//                   color: Colors.grey[200],
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//                 child: const Icon(
//                   Icons.add_photo_alternate_outlined,
//                   color: Colors.black,
//                   size: 24.0,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CreateReservationPage extends StatefulWidget {
//   final Function(String, String, String) onSave;
//   final DateTime selectedDate;

//   const CreateReservationPage({
//     Key? key,
//     required this.onSave,
//     required this.selectedDate,
//   }) : super(key: key);

//   @override
//   State<CreateReservationPage> createState() => _CreateReservationPageState();
// }

// class _CreateReservationPageState extends State<CreateReservationPage> {
//   final _titleController = TextEditingController();
//   final _timeController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Crear Reserva'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _titleController,
//               decoration: const InputDecoration(labelText: 'Título'),
//             ),
//             TextField(
//               controller: _timeController,
//               decoration: const InputDecoration(labelText: 'Hora'),
//             ),
//             Text(
//               'Fecha seleccionada: ${widget.selectedDate.toLocal().toString().split(' ')[0]}',
//               style: const TextStyle(fontSize: 16),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               child: const Text('Guardar'),
//               onPressed: () {
//                 if (_titleController.text.isEmpty || _timeController.text.isEmpty) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(content: Text('Por favor complete todos los campos.')),
//                   );
//                   return;
//                 }
//                 widget.onSave(
//                   _titleController.text,
//                   _timeController.text,
//                   widget.selectedDate.toLocal().toString().split(' ')[0],
//                 );
//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reservas'),
      ),
      body: Column(
        children: [
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Descripción Reserva'),
            ),
            const SizedBox(height: 20),
            Text(
              'Fecha seleccionada: ${DateFormat('yyyy-MM-dd').format(_selectedDate)}',
              style: const TextStyle(fontSize: 16),
            ),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: const Text('Cambiar fecha'),
            ),
            const SizedBox(height: 20),
            Text(
              'Hora seleccionada: ${_selectedTime.format(context)}',
              style: const TextStyle(fontSize: 16),
            ),
            ElevatedButton(
              onPressed: () => _selectTime(context),
              child: const Text('Cambiar hora'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Guardar'),
              onPressed: () {
                if (_titleController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Por favor ingrese un título para la reserva.')),
                  );
                  return;
                }
                final reservationDateTime = DateTime(
                  _selectedDate.year,
                  _selectedDate.month,
                  _selectedDate.day,
                  _selectedTime.hour,
                  _selectedTime.minute,
                );
                widget.onSave(_titleController.text, reservationDateTime);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}


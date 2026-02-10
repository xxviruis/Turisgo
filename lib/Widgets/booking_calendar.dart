import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingCalendar extends StatefulWidget {
  final Map<String, int> precios;
  final Function(DateTime?, DateTime?, int, double) onChanged;

  const BookingCalendar({
    super.key,
    required this.precios,
    required this.onChanged,
  });

  @override
  State<BookingCalendar> createState() => _BookingCalendarState();
}

class _BookingCalendarState extends State<BookingCalendar> {
  DateTime? _inicio;
  DateTime? _fin;
  DateTime _focusedDay = DateTime(2026, 2, 9);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: TableCalendar(
          locale: 'es_ES',
          focusedDay: _focusedDay,
          firstDay: DateTime(2026, 2, 9),
          lastDay: DateTime(2026, 3, 31),
          rangeSelectionMode: RangeSelectionMode.enforced,
          rangeStartDay: _inicio,
          rangeEndDay: _fin,
          availableGestures: AvailableGestures.horizontalSwipe,
          headerStyle: const HeaderStyle(
            titleCentered: true,
            formatButtonVisible: false,
            leftChevronIcon: Icon(Icons.chevron_left),
            rightChevronIcon: Icon(Icons.chevron_right),
          ),
          daysOfWeekStyle: const DaysOfWeekStyle(
            weekendStyle: TextStyle(color: Colors.redAccent),
          ),
          calendarStyle: CalendarStyle(
            todayDecoration: BoxDecoration(
              color: Colors.blue.shade100,
              shape: BoxShape.circle,
            ),
            rangeStartDecoration: const BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            rangeEndDecoration: const BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            withinRangeDecoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
          ),
          calendarBuilders: CalendarBuilders(
            defaultBuilder: (context, day, _) {
              final key = DateFormat('yyyy-MM-dd').format(day);
              final precio = widget.precios[key];

              if (precio == null) return null;

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${day.day}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$${NumberFormat.compact(locale: 'es').format(precio)}',
                    style: const TextStyle(
                      fontSize: 11,
                      color: Colors.green,
                    ),
                  ),
                ],
              );
            },
          ),
          onRangeSelected: (start, end, focusedDay) {
            setState(() {
              _inicio = start;
              _fin = end;
              _focusedDay = focusedDay;
            });
            _calcularTotal();
          },
        ),
      ),
    );
  }

  void _calcularTotal() {
    if (_inicio == null || _fin == null) return;

    double total = 0;
    int noches = 0;

    DateTime d = _inicio!;
    while (d.isBefore(_fin!)) {
      final key = DateFormat('yyyy-MM-dd').format(d);
      total += widget.precios[key] ?? 0;
      noches++;
      d = d.add(const Duration(days: 1));
    }

    widget.onChanged(_inicio, _fin, noches, total);
  }
}

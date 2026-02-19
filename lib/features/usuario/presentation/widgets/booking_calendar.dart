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
  State<BookingCalendar> createState() => BookingCalendarState();
}

class BookingCalendarState extends State<BookingCalendar> {
  DateTime? _inicio;
  DateTime? _fin;

  DateTime get _hoy {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  late DateTime _focusedDay = _hoy;

  @override
  void initState() {
    super.initState();
    // 🔥 Ningún día seleccionado al iniciar
    _inicio = null;
    _fin = null;
  }

  // 🔹 Limpia selección desde afuera
  void limpiarFechas() {
    setState(() {
      _inicio = null;
      _fin = null;
      _focusedDay = _hoy;
    });

    widget.onChanged(null, null, 0, 0);
  }

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

          // 🔥 Bloquea días pasados, permite hoy
          firstDay: _hoy,
          lastDay: DateTime(2027, 12, 31),

          rangeSelectionMode: RangeSelectionMode.enforced,
          rangeStartDay: _inicio,
          rangeEndDay: _fin,

          enabledDayPredicate: (day) {
            final d = DateTime(day.year, day.month, day.day);
            return !d.isBefore(_hoy);
          },

          headerStyle: const HeaderStyle(
            titleCentered: true,
            formatButtonVisible: false,
          ),

          // ❌ SIN todayDecoration → hoy no se pinta
          calendarStyle: const CalendarStyle(
            disabledTextStyle: TextStyle(color: Colors.grey),
          ),

          calendarBuilders: CalendarBuilders(
            // 🔥 Hoy se pinta igual que un día normal
            todayBuilder: (context, day, _) {
              return _buildDay(day);
            },

            defaultBuilder: (context, day, _) {
              final d = DateTime(day.year, day.month, day.day);

              if (d.isBefore(_hoy)) {
                return Center(
                  child: Text(
                    '${day.day}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                );
              }

              return _buildDay(day);
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

  Widget _buildDay(DateTime day) {
    final key = DateFormat('yyyy-MM-dd').format(day);
    final precio = widget.precios[key];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${day.day}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        if (precio != null) ...[
          const SizedBox(height: 4),
          Text(
            NumberFormat.currency(
              locale: "es_CO",
              symbol: "",
              decimalDigits: 0,
            ).format(precio),
            style: const TextStyle(
              fontSize: 11,
              color: Colors.green,
            ),
          ),
        ],
      ],
    );
  }

  void _calcularTotal() {
    if (_inicio == null || _fin == null) {
      widget.onChanged(null, null, 0, 0);
      return;
    }

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

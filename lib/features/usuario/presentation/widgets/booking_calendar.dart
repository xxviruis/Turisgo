import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingCalendar extends StatefulWidget {
  final int precioBase;
  final Function(DateTime?, DateTime?, int, double) onChanged;

  const BookingCalendar({
    super.key,
    required this.precioBase,
    required this.onChanged,
  });

  @override
  State<BookingCalendar> createState() => BookingCalendarState();
}

class BookingCalendarState extends State<BookingCalendar> {
  DateTime? _inicio;
  DateTime? _fin;

  // 🔒 RANGO PERMITIDO
  final DateTime _fechaInicio = DateTime(2026, 2, 26);
  final DateTime _fechaFin = DateTime(2026, 4, 20);

  late DateTime _focusedDay = _fechaInicio;

  @override
  void initState() {
    super.initState();
    _inicio = null;
    _fin = null;
  }

  // 🔹 Limpia selección desde afuera
  void limpiarFechas() {
    setState(() {
      _inicio = null;
      _fin = null;
      _focusedDay = _fechaInicio;
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
          firstDay: _fechaInicio,
          lastDay: _fechaFin,

          rangeSelectionMode: RangeSelectionMode.enforced,
          rangeStartDay: _inicio,
          rangeEndDay: _fin,

          // 🔥 CLAVE: ningún día seleccionado cuando se limpian fechas
          selectedDayPredicate: (day) {
            return false;
          },

          enabledDayPredicate: (day) {
            return !day.isBefore(_fechaInicio) && !day.isAfter(_fechaFin);
          },

          headerStyle: const HeaderStyle(
            titleCentered: true,
            formatButtonVisible: false,
          ),

          calendarStyle: const CalendarStyle(
            disabledTextStyle: TextStyle(color: Colors.grey),
          ),

          calendarBuilders: CalendarBuilders(
            todayBuilder: (context, day, _) {
              return _buildDay(day);
            },
            defaultBuilder: (context, day, _) {
              if (day.isBefore(_fechaInicio) || day.isAfter(_fechaFin)) {
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

  // 🔥 Precio dinámico por día (fin de semana más caro)
  int _precioPorDia(DateTime day) {
    final bool esFinDeSemana =
        day.weekday == DateTime.friday || day.weekday == DateTime.saturday;

    return esFinDeSemana
        ? (widget.precioBase * 1.15).round()
        : widget.precioBase;
  }

  Widget _buildDay(DateTime day) {
    final precio = _precioPorDia(day);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('${day.day}', style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(
          NumberFormat.currency(
            locale: "es_CO",
            symbol: "",
            decimalDigits: 0,
          ).format(precio),
          style: const TextStyle(fontSize: 11, color: Colors.green),
        ),
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
      total += _precioPorDia(d);
      noches++;
      d = d.add(const Duration(days: 1));
    }

    widget.onChanged(_inicio, _fin, noches, total);
  }
}

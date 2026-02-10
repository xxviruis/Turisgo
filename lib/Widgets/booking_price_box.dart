import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookingPriceBox extends StatefulWidget {
  final int noches;
  final double total;
  final VoidCallback onClearDates;

  const BookingPriceBox({
    super.key,
    required this.noches,
    required this.total,
    required this.onClearDates,
  });

  @override
  State<BookingPriceBox> createState() => _BookingPriceBoxState();
}

class _BookingPriceBoxState extends State<BookingPriceBox> {
  int habitaciones = 1;

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat('#,###', 'es_CO');
    final double totalFinal = widget.total * habitaciones;

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          width: 320,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ===== PRECIO =====
              Text(
                "Precio total",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                "\$ ${formatter.format(totalFinal)}",
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              // ===== INFO =====
              Text(
                "${widget.noches} noche(s) • $habitaciones habitación(es)",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade700,
                ),
              ),

              const Divider(height: 32),

              // ===== SELECTOR HABITACIONES =====
              const Text(
                "Habitaciones",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  _btn(
                    icon: Icons.remove,
                    onTap: habitaciones > 1
                        ? () => setState(() => habitaciones--)
                        : null,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      habitaciones.toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  _btn(
                    icon: Icons.add,
                    onTap: () => setState(() => habitaciones++),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // ===== BOTÓN RESERVAR =====
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: widget.noches > 0 ? () {} : null,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Reservar ahora",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // ===== LIMPIAR =====
              Center(
                child: TextButton.icon(
                  onPressed: () {
                    setState(() {
                      habitaciones = 1;
                    });
                    widget.onClearDates();
                  },
                  icon: const Icon(Icons.delete_outline),
                  label: const Text("Limpiar fechas"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _btn({required IconData icon, VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, size: 20),
      ),
    );
  }
}

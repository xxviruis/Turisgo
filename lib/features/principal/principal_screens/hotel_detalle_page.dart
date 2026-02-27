import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/widgets/mapa_hotel.dart';
import 'package:flutter_application_1/features/usuario/presentation/widgets/booking_calendar.dart';
import 'package:flutter_application_1/features/usuario/presentation/widgets/booking_price_box.dart';
import 'package:flutter_application_1/core/utils/servicios_icons.dart';
import 'galeria_fotos_hotel.dart';

class HotelDetallePage extends StatefulWidget {
  final Map<String, dynamic> hotel;
  const HotelDetallePage({super.key, required this.hotel});

  @override
  State<HotelDetallePage> createState() => _HotelDetallePageState();
}

class _HotelDetallePageState extends State<HotelDetallePage> {
  int noches = 0;
  double total = 0;
  final GlobalKey<BookingCalendarState> _calendarKey = GlobalKey();

  void _clearBooking() {
    setState(() {
      noches = 0;
      total = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final hotel = widget.hotel;

    final List<String> imagenes = List<String>.from(hotel["imagenes"] ?? []);
    final List<String> servicios = List<String>.from(hotel["servicios"] ?? []);
    final String descripcion = hotel["descripcion"] ?? "Sin descripción";
    final String direccion = hotel["direccion"] ?? "";

    while (imagenes.length < 8) {
      imagenes.add(imagenes.isNotEmpty ? imagenes[0] : hotel["img"]);
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(title: Text(hotel["nombre"])),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 24),

              // ================= COLLAGE =================
              SizedBox(
                width: 1100,
                child: Column(
                  children: [
                    SizedBox(
                      height: 260,
                      child: Row(
                        children: [
                          Expanded(flex: 7, child: _img(imagenes[0])),
                          const SizedBox(width: 8),
                          Expanded(
                            flex: 3,
                            child: Column(
                              children: [
                                Expanded(child: _img(imagenes[1])),
                                const SizedBox(height: 8),
                                Expanded(child: _img(imagenes[2])),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 110,
                      child: Row(
                        children: List.generate(5, (index) {
                          if (index == 4) {
                            return Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          GaleriaFotos(images: imagenes),
                                    ),
                                  );
                                },
                                child: Stack(
                                  children: [
                                    _img(imagenes[7]),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.6),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "+${imagenes.length - 8} fotos",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                          return Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: _img(imagenes[index + 3]),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // ================= INFO =================
              SizedBox(
                width: 1100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      hotel["nombre"],
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "⭐ ${hotel["puntuacion"]} • ${hotel["ubicación"]}",
                      style: const TextStyle(fontSize: 16),
                    ),

                    const SizedBox(height: 32),

                    // ================= SERVICIOS =================
                    const Text(
                      "Servicios más populares",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 16),

                    Wrap(
                      spacing: 24,
                      runSpacing: 16,
                      children: servicios.map((servicio) {
                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              ServiciosIconos.getIcono(servicio),
                              size: 22,
                              color: Colors.blueGrey,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              servicio.toUpperCase(),
                              style: const TextStyle(fontSize: 15),
                            ),
                          ],
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 32),

                    // ================= DESCRIPCIÓN + MAPA =================
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // TEXTO IZQUIERDA
                        Expanded(
                          flex: 6,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Descripción",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                descripcion,
                                style: const TextStyle(
                                  fontSize: 16,
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(width: 32),

                        // MAPA DERECHA
                        Expanded(
                          flex: 4,
                          child: SizedBox(
                            height: 360,
                            child: MapaHotel(
                              nombreHotel: hotel["nombre"],
                              direccion: hotel["direccion"],
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 40),

                    // ================= BOOKING =================
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: BookingCalendar(
                            precioBase: hotel["precioBase"],
                            onChanged: (ini, fin, noches, total) {
                              setState(() {
                                this.noches = noches;
                                this.total = total;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 24),
                        BookingPriceBox(
                          noches: noches,
                          total: total,
                          onClearDates: () {
                            _calendarKey.currentState?.limpiarFechas();
                            setState(() {
                              noches = 0;
                              total = 0;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }

  Widget _img(String img) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        img,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ServiciosIconos {
  static const Map<String, IconData> iconos = {
    "wifi": Icons.wifi,
    "piscina": Icons.pool,
    "restaurante": Icons.restaurant,
    "parking": Icons.local_parking,
    "aire": Icons.ac_unit,
    "spa": Icons.spa,
    "gym": Icons.fitness_center,
    "mascotas": Icons.pets,
    "bar": Icons.local_bar,
    "playa": Icons.beach_access,
    "desayuno": Icons.free_breakfast,
    "recepcion24": Icons.support_agent,
  };

  static IconData getIcono(String servicio) {
    return iconos[servicio] ?? Icons.check_circle;
  }
}

class PrecioHotel {
  static double getPrecioPorFecha(DateTime fecha) {
    if (fecha.weekday == DateTime.friday ||
        fecha.weekday == DateTime.saturday) {
      return 298000;
    }
    return 221000;
  }
}

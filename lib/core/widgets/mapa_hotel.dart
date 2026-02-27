import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:url_launcher/url_launcher.dart';

class MapaHotel extends StatefulWidget {
  final String nombreHotel;
  final String direccion;

  const MapaHotel({
    super.key,
    required this.nombreHotel,
    required this.direccion,
  });

  @override
  State<MapaHotel> createState() => _MapaHotelState();
}

class _MapaHotelState extends State<MapaHotel> {
  LatLng? posicion;
  bool cargando = true;

  @override
  void initState() {
    super.initState();
    _geocodificar();
  }

  Future<void> _geocodificar() async {
    try {
      final locations = await locationFromAddress(widget.direccion);
      final l = locations.first;
      posicion = LatLng(l.latitude, l.longitude);
    } catch (_) {
      posicion = null;
    }
    setState(() => cargando = false);
  }

  Future<void> _abrirMaps() async {
    final url =
        'https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(widget.direccion)}';
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    if (cargando) {
      return const Center(child: CircularProgressIndicator());
    }

    // 🌐 WEB → SOLO LINK (ES LO CORRECTO)
    if (kIsWeb) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Ubicación',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          InkWell(
            onTap: _abrirMaps,
            child: Text(
              widget.direccion,
              style: const TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      );
    }

    // 📱 ANDROID → MAPA REAL
    if (posicion == null) {
      return const Text('No se pudo cargar el mapa');
    }

    return Column(
      children: [
        SizedBox(
          height: 180,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: posicion!,
                zoom: 15,
              ),
              markers: {
                Marker(
                  markerId: const MarkerId('hotel'),
                  position: posicion!,
                  infoWindow: InfoWindow(
                    title: widget.nombreHotel,
                    snippet: widget.direccion,
                  ),
                ),
              },
              zoomControlsEnabled: false,
              myLocationButtonEnabled: false,
            ),
          ),
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: _abrirMaps,
          child: Text(
            widget.direccion,
            style: const TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}

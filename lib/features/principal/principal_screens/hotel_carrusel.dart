import 'package:flutter/material.dart';
import 'hotel_detalle_page.dart';

class HotelesCarrusel extends StatefulWidget {
  const HotelesCarrusel({super.key});

  @override
  State<HotelesCarrusel> createState() => _HotelesCarruselState();
}

class _HotelesCarruselState extends State<HotelesCarrusel> {
  final ScrollController _controller = ScrollController();

  final List<Map<String, dynamic>> hoteles = [
    {
      "nombre": "NH Cali Royale",
      "ubicación": "CALI",
      "puntuacion": 4.5,
      "precioBase": 230000,
      "direccion": "Carrera 100 #11-60, Cali, Valle del Cauca, Colombia",
      "descripcion":
          '''Este hotel de 5 estrellas está situado en Cali, Colombia, junto al centro comercial Holguines y ofrece un centro de negocios abierto las 24 horas, wifi y parking gratis. El hotel cuenta con una piscina al aire libre y un spa.

Las habitaciones del NH Royal Cali tienen grandes ventanas y arte moderno en las paredes. Todas ellas están equipadas con TV LCD y escritorio.

En el restaurante principal del hotel NH Royal Cali se sirven especialidades colombianas e internacionales. También hay un restaurante de barbacoa y servicio de habitaciones.

Los huéspedes pueden hacer ejercicio en el gimnasio del NH Royal Cali o programar un masaje. El personal del mostrador de información turística puede ayudarte a organizar una excursión al Parque Nacional Farallones de Cali, que está a 10 km.

El Centro Comercial Jardín Plaza está a menos de 1 km del hotel. El Hotel NH Royal Cali está a solo 15 minutos en coche del centro de Cali.

Se admiten mascotas a petición y previa autorización. Se admiten perros y gatos con un peso máximo de 25 kg. Se aplicará un suplemento de 110.000 COP por mascota y noche (máximo 2 mascotas por habitación). Se admiten perros guía de forma gratuita.
''',
      "imagenes": [
        "assets/images/hoteles/nh_cali_royale.jpg",
        "assets/images/hoteles/nh_cali_royale/nh_cali_royale_2.jpg",
        "assets/images/hoteles/nh_cali_royale/nh_cali_royale_3.jpg",
        "assets/images/hoteles/nh_cali_royale/nh_cali_royale_4.jpg",
        "assets/images/hoteles/nh_cali_royale/nh_cali_royale_5.jpg",
        "assets/images/hoteles/nh_cali_royale/nh_cali_royale_6.jpg",
        "assets/images/hoteles/nh_cali_royale/nh_cali_royale_7.jpg",
        "assets/images/hoteles/nh_cali_royale/nh_cali_royale_8.jpg",
        "assets/images/hoteles/nh_cali_royale/nh_cali_royale_9.jpg",
      ],
      "servicios": ["wifi", "parking", "restaurante", "aire", "gym"],
    },
    {
      "nombre": "AQUAMARE",
      "ubicación": "SAN ANDRÉS",
      "puntuacion": 4.5,
      "precioBase": 195000,
      "direccion":
          "Carrera 1 #2-84, San Andrés Isla, San Andrés y Providencia, Colombia",
      "descripcion":
          '''Alojamientos Cómodos: Aquamare Hotel en San Andrés ofrece habitaciones familiares con aire acondicionado, balcones y vistas al jardín. Cada habitación incluye TV y WiFi gratis, asegurando una estancia agradable.

Servicios Excepcionales: Los huéspedes pueden disfrutar de una piscina en la azotea, restaurante, bar y recepción 24 horas. Los servicios adicionales incluyen ascensor, servicio de limpieza diario, servicio de habitaciones y un mostrador de información turística.

Experiencia Gastronómica: El restaurante familiar ofrece cocina internacional con opciones vegetarianas. Cada mañana se sirve un desayuno buffet, muy elogiado por los huéspedes.

Ubicación Privilegiada: Situado a 2 km del Aeropuerto Internacional Gustavo Rojas Pinilla, el hotel está a un corto paseo de la Playa Spratt Bight y la Bahía de San Andrés. Las atracciones cercanas incluyen la Cueva de Morgan y The Hill. El buceo está disponible en los alrededores.
          ''',
      "imagenes": [
        "assets/images/hoteles/aquamare.jpg",
        "assets/images/hoteles/aquamare/aquamare_2.jpg",
        "assets/images/hoteles/aquamare/aquamare_3.jpg",
        "assets/images/hoteles/aquamare/aquamare_4.jpg",
        "assets/images/hoteles/aquamare/aquamare_5.jpg",
        "assets/images/hoteles/aquamare/aquamare_6.jpg",
        "assets/images/hoteles/aquamare/aquamare_7.jpg",
        "assets/images/hoteles/aquamare/aquamare_8.jpg",
        "assets/images/hoteles/aquamare/aquamare_9.jpg",
        "assets/images/hoteles/aquamare/aquamare_10.jpg",
      ],
      "servicios": ["wifi", "piscina", "playa", "spa", "bar"],
    },
    {
      "nombre": "COUNTRY INTERNATIONAL",
      "ubicación": "BARRANQUILLA",
      "puntuacion": 4.5,
      "precioBase": 480000,
      "direccion": "Carrera 52 #75-30, Barranquilla, Atlántico, Colombia",
      "descripcion":
          '''El Country International cuenta con piscina grande con terraza solárium, habitaciones con TV por cable, conexión WiFi gratuita y aparcamiento gratuito.

El hotel Country Internacional, de 5 estrellas, ofrece habitaciones con aire acondicionado y zona de estar. Cuenta con caja fuerte, minibar y prensa diaria.

Se proporcionan servicios de lavandería y de limpieza en seco. La recepción abre las 24 horas y permite a los huéspedes utilizar el teléfono para realizar llamadas ilimitadas. Hay instalaciones para reuniones, así como artículos de primeros auxilios y asistencia médica.

La cafetería del hotel sirve aperitivos y bebidas. El bar ofrece una selección de cervezas y licores fuertes.

La zona circundante está llena de tiendas, bares y restaurantes.''',
      "imagenes": [
        "assets/images/hoteles/country_intrnational.jpg",
        "assets/images/hoteles/country_international/country_international_2.jpg",
        "assets/images/hoteles/country_international/country_international_3.jpg",
        "assets/images/hoteles/country_international/country_international_4.jpg",
        "assets/images/hoteles/country_international/country_international_5.jpg",
        "assets/images/hoteles/country_international/country_international_6.jpg",
        "assets/images/hoteles/country_international/country_international_7.jpg",
        "assets/images/hoteles/country_international/country_international_8.jpg",
        "assets/images/hoteles/country_international/country_international_9.jpg",
        "assets/images/hoteles/country_international/country_international_10.jpg",
      ],
      "servicios": ["wifi", "parking", "gym", "restaurante"],
    },
    {
      "nombre": "ESTELAR ALTAMIRA",
      "ubicación": "IBAGUÉ",
      "puntuacion": 4.5,
      "precioBase": 150000,
      "direccion": "Carrera 1 #45-50, Ibagué, Tolima, Colombia",
      "descripcion":
          '''Junto al centro financiero de Ibagué, a 20 minutos en coche del aeropuerto, Estelar Altamira ofrece alojamiento con Wi-Fi gratuito y aparcamiento gratuitos. Cuenta con pistas de tenis, gimnasio y piscina.

Las habitaciones de 5 estrellas del Hotel Estelar Altamira son espaciosas y luminosas, con televisión por cable, minibar y aire acondicionado. Hay un circuito de televisión privado disponible.

Los huéspedes de Estelar Altamira disponen de una sala de juegos para el entretenimiento, y también se pueden solicitar servicios de lavandería y transporte.

El hotel ofrece una variedad de opciones gastronómicas. Los huéspedes pueden disfrutar de cocina italiana, japonesa y a la parrilla en Tonnarello, la terraza del asador y el Maki Bar.

El Hotel Estelar Altamira está situado a 10 manzanas del popular Estadio Manuel Murillo Toro.''',
      "imagenes": [
        "assets/images/hoteles/estelar_altamira.jpg",
        "assets/images/hoteles/estelar_altamira/estelar_altamira_2.jpg",
        "assets/images/hoteles/estelar_altamira/estelar_altamira_3.jpg",
        "assets/images/hoteles/estelar_altamira/estelar_altamira_4.jpg",
        "assets/images/hoteles/estelar_altamira/estelar_altamira_5.jpg",
        "assets/images/hoteles/estelar_altamira/estelar_altamira_6.jpg",
        "assets/images/hoteles/estelar_altamira/estelar_altamira_7.jpg",
        "assets/images/hoteles/estelar_altamira/estelar_altamira_8.jpg",
        "assets/images/hoteles/estelar_altamira/estelar_altamira_9.jpg",
        "assets/images/hoteles/estelar_altamira/estelar_altamira_10.jpg",
      ],
      "servicios": ["wifi", "parking", "desayuno", "gym"],
    },
    {
      "nombre": "IROTAMA LAGO",
      "ubicación": "SANTA MARTA",
      "puntuacion": 4.5,
      "precioBase": 290000,
      "direccion": "Km 14 Vía Ciénaga, Santa Marta, Magdalena, Colombia",
      "descripcion":
          '''El Hotel Irotama Lago, situado a 100 metros de la playa, ofrece 3 piscinas al aire libre, un spa y centro de fitness e instalaciones para practicar actividades acuáticas. Se ofrece wifi. Se organizan actividades infantiles. Se proporciona servicio gratuito de recogida en el aeropuerto.

Los bungalows del Hotel Irotama Lago disponen de baño privado y TV vía satélite. Algunas habitaciones ofrecen vistas al mar. Se ofrece servicio de habitaciones.

Los huéspedes del Irotama pueden organizar partidos de tenis. Se puede comer en uno de los 9 restaurantes del complejo. Bajo petición, el complejo organiza sesiones de masajes y servicios de alquiler de coches.

Algunos de nuestros entornos y restaurantes pueden no estar siempre disponibles o en funcionamiento, por lo que invitamos a consultar la programación diaria durante la estancia.

El aeropuerto Simón Bolívar queda a 2 km. Hay aparcamiento privado gratuito disponible.''',
      "imagenes": [
        "assets/images/hoteles/irotama_lago.jpg",
        "assets/images/hoteles/irotama_lago/irotama_lago_2.jpg",
        "assets/images/hoteles/irotama_lago/irotama_lago_3.jpg",
        "assets/images/hoteles/irotama_lago/irotama_lago_4.jpg",
        "assets/images/hoteles/irotama_lago/irotama_lago_5.jpg",
        "assets/images/hoteles/irotama_lago/irotama_lago_6.jpg",
        "assets/images/hoteles/irotama_lago/irotama_lago_7.jpg",
        "assets/images/hoteles/irotama_lago/irotama_lago_8.jpg",
        "assets/images/hoteles/irotama_lago/irotama_lago_9.jpg",
        "assets/images/hoteles/irotama_lago/irotama_lago_10.jpg",
      ],
      "servicios": ["wifi", "playa", "piscina", "spa"],
    },
    {
      "nombre": "LAS AMÉRICAS TORRE DEL MAR",
      "ubicación": "CARTAGENA",
      "puntuacion": 4.5,
      "precioBase": 240000,
      "direccion":
          "Anillo Vial Sector Cielo Mar, Cartagena de Indias, Bolívar, Colombia",
      "descripcion":
          '''El complejo de lujo Las Américas Torre del Mar está frente al mar, en la parte norte de Cartagena y cerca de la playa de La Boquilla. El hotel cuenta con 5 piscinas, servicios de spa, centro de fitness e instalaciones de minigolf. El establecimiento dispone de tiendas de ropa y cafetería. Hay WiFi gratuita en todo el establecimiento. El establecimiento dispone de 2 bares: Aqua Lounge Bar e Infinito.

Las habitaciones del complejo Las Américas Torre del Mar tienen aire acondicionado, minibar, TV de pantalla plana y balcón con vistas al lago, al mar o a la ciudad.

Todos los días se sirve un desayuno buffet con fruta tropical. Los huéspedes también pueden disfrutar de zumos naturales en la zona de playa privada o un cóctel junto a la piscina con vistas a Cartagena. Las Américas Torre del Mar cuenta con dos conocidos restaurantes: "Columbus Al Forno", que sirve platos internacionales, y "ERRE", de Ramón Freixa, el chef galardonado con 2 estrellas Michelin. Dicho restaurante se encuentra en la 10ª planta y goza de vistas al océano.

El complejo Las Américas Torre del Mar dispone de club infantil, tienda de regalos y recepción 24 horas. El aeropuerto internacional Rafael Núñez se halla a 5 minutos en coche.''',
      "imagenes": [
        "assets/images/hoteles/las_americas_torre_del_mar.jpg",
        "assets/images/hoteles/las_americas_torre_del_mar/las_americas_torre_del_mar_2.jpg",
        "assets/images/hoteles/las_americas_torre_del_mar/las_americas_torre_del_mar_3.jpg",
        "assets/images/hoteles/las_americas_torre_del_mar/las_americas_torre_del_mar_4.jpg",
        "assets/images/hoteles/las_americas_torre_del_mar/las_americas_torre_del_mar_5.jpg",
        "assets/images/hoteles/las_americas_torre_del_mar/las_americas_torre_del_mar_6.jpg",
        "assets/images/hoteles/las_americas_torre_del_mar/las_americas_torre_del_mar_7.jpg",
        "assets/images/hoteles/las_americas_torre_del_mar/las_americas_torre_del_mar_8.jpg",
        "assets/images/hoteles/las_americas_torre_del_mar/las_americas_torre_del_mar_9.jpg",
        "assets/images/hoteles/las_americas_torre_del_mar/las_americas_torre_del_mar_10.jpg",
      ],
      "servicios": ["wifi", "playa", "piscina", "spa", "bar"],
    },
    {
      "nombre": "SAN FERNANDO PLAZA",
      "ubicación": "MEDELLÍN",
      "puntuacion": 4.5,
      "precioBase": 390000,
      "direccion": "Carrera 43A #1A Sur-150, Medellín, Antioquia, Colombia",
      "descripcion":
          '''El complejo de lujo Las Américas Torre del Mar está frente al mar, en la parte norte de Cartagena y cerca de la playa de La Boquilla. El hotel cuenta con 5 piscinas, servicios de spa, centro de fitness e instalaciones de minigolf. El establecimiento dispone de tiendas de ropa y cafetería. Hay WiFi gratuita en todo el establecimiento. El establecimiento dispone de 2 bares: Aqua Lounge Bar e Infinito.

Las habitaciones del complejo Las Américas Torre del Mar tienen aire acondicionado, minibar, TV de pantalla plana y balcón con vistas al lago, al mar o a la ciudad.

Todos los días se sirve un desayuno buffet con fruta tropical. Los huéspedes también pueden disfrutar de zumos naturales en la zona de playa privada o un cóctel junto a la piscina con vistas a Cartagena. Las Américas Torre del Mar cuenta con dos conocidos restaurantes: "Columbus Al Forno", que sirve platos internacionales, y "ERRE", de Ramón Freixa, el chef galardonado con 2 estrellas Michelin. Dicho restaurante se encuentra en la 10ª planta y goza de vistas al océano.

El complejo Las Américas Torre del Mar dispone de club infantil, tienda de regalos y recepción 24 horas. El aeropuerto internacional Rafael Núñez se halla a 5 minutos en coche.''',
      "imagenes": [
        "assets/images/hoteles/san_fernando_plaza.jpg",
        "assets/images/hoteles/san_fernando_plaza/san_fernando_plaza_2.jpg",
        "assets/images/hoteles/san_fernando_plaza/san_fernando_plaza_3.jpg",
        "assets/images/hoteles/san_fernando_plaza/san_fernando_plaza_4.jpg",
        "assets/images/hoteles/san_fernando_plaza/san_fernando_plaza_5.jpg",
        "assets/images/hoteles/san_fernando_plaza/san_fernando_plaza_6.jpg",
        "assets/images/hoteles/san_fernando_plaza/san_fernando_plaza_7.jpg",
        "assets/images/hoteles/san_fernando_plaza/san_fernando_plaza_8.jpg",
        "assets/images/hoteles/san_fernando_plaza/san_fernando_plaza_9.jpg",
        "assets/images/hoteles/san_fernando_plaza/san_fernando_plaza_10.jpg",
      ],
      "servicios": ["wifi", "parking", "gym", "restaurante"],
    },
    {
      "nombre": "SONESTA BOGOTÁ",
      "ubicación": "BOGOTÁ",
      "puntuacion": 4.9,
      "precioBase": 185000,
      "direccion": "Carrera 15A #125-26, Bogotá, Colombia",
      "descripcion":
          '''El Sonesta Hotel Bogotá ofrece habitaciones de diseño elegantes y acceso directo al centro comercial y de ocio Metro 127. Se facilita aparcamiento gratuito.

Las habitaciones del Sonesta Hotel presentan una decoración en tonos grises acogedores e incorporan una iluminación innovadora. Todas están equipadas con cama extragrande, TV LCD con canales por cable y soporte para iPod. Hay WiFi gratuita.

El restaurante Cooks sirve un delicioso buffet de postres, así como un desayuno a diario con cruasanes, mermelada y fruta de temporada. El bar salón ofrece una gran variedad de cócteles exóticos y vinos excelentes. Este hotel tiene servicio de masajes y sesiones de relajación. Se debe preguntar en la recepción para obtener más información.

El Sonesta Hotel Bogotá está situado frente al centro comercial Unicentro y a 50 minutos en coche del aeropuerto internacional El Dorado. Se proporciona un servicio de enlace con el aeropuerto por un suplemento.''',
      "imagenes": [
        "assets/images/hoteles/sonesta_bogota.jpg",
        "assets/images/hoteles/sonesta_bogota/sonesta_bogota_2.jpg",
        "assets/images/hoteles/sonesta_bogota/sonesta_bogota_3.jpg",
        "assets/images/hoteles/sonesta_bogota/sonesta_bogota_4.jpg",
        "assets/images/hoteles/sonesta_bogota/sonesta_bogota_5.jpg",
        "assets/images/hoteles/sonesta_bogota/sonesta_bogota_6.jpg",
        "assets/images/hoteles/sonesta_bogota/sonesta_bogota_7.jpg",
        "assets/images/hoteles/sonesta_bogota/sonesta_bogota_8.jpg",
        "assets/images/hoteles/sonesta_bogota/sonesta_bogota_9.jpg",
        "assets/images/hoteles/sonesta_bogota/sonesta_bogota_10.jpg",
      ],
      "servicios": ["wifi", "gym", "restaurante", "parking"],
    },
    {
      "nombre": "SUMA WASI",
      "ubicación": "PUTUMAYO",
      "puntuacion": 4.0,
      "precioBase": 340000,
      "direccion": "Calle 12 #10-22, Mocoa, Putumayo, Colombia",
      "descripcion":
          '''Alojamientos Cómodos: Hotel Suma Wasi en Mocoa ofrece habitaciones familiares con aire acondicionado, baños privados y vistas al jardín. Cada habitación incluye un escritorio, TV y armario, asegurando una estancia agradable.

Servicios Excepcionales: Los huéspedes pueden disfrutar de una piscina al aire libre durante todo el año, una terraza y un exuberante jardín. El hotel cuenta con un restaurante, bar y WiFi gratis, ofreciendo muchas opciones de ocio.

Experiencia Gastronómica: El restaurante familiar sirve desayunos americanos y a la carta, brunch, almuerzos, cenas, té de la tarde y cócteles en un ambiente tradicional, moderno y romántico.

Ubicación Conveniente: Situado a 22 km del Aeropuerto de Villa Garzón, el hotel es elogiado por su personal atento, ubicación conveniente y habitaciones cómodas.

''',
      "imagenes": [
        "assets/images/hoteles/suma_wasi.jpg",
        "assets/images/hoteles/suma_wasi/suma_wasi_2.jpg",
        "assets/images/hoteles/suma_wasi/suma_wasi_3.jpg",
        "assets/images/hoteles/suma_wasi/suma_wasi_4.jpg",
        "assets/images/hoteles/suma_wasi/suma_wasi_5.jpg",
        "assets/images/hoteles/suma_wasi/suma_wasi_6.jpg",
        "assets/images/hoteles/suma_wasi/suma_wasi_7.jpg",
        "assets/images/hoteles/suma_wasi/suma_wasi_8.jpg",
        "assets/images/hoteles/suma_wasi/suma_wasi_9.jpg",
        "assets/images/hoteles/suma_wasi/suma_wasi_10.jpg",
      ],
      "servicios": ["wifi", "parking", "mascotas"],
    },
    {
      "nombre": "SONESTA IBAGUÉ",
      "ubicación": "IBAGUÉ",
      "puntuacion": 5.0,
      "precioBase": 365000,
      "direccion": "Carrera 46 Sur #87-05, Ibagué, Tolima, Colombia",
      "descripcion": '''
Descubre cómo se sienten las estrellas con el mejor servicio en el Sonesta Hotel Ibagué

Alojamiento Elegante:
Sonesta Hotel Ibagué en Ibagué ofrece una experiencia de 5 estrellas con una piscina en la azotea, restaurante y WiFi gratis. Los huéspedes disfrutan de habitaciones con aire acondicionado, baños privados, vistas a la ciudad y equipamiento moderno.

Gastronomía y Ocio:
El restaurante familiar sirve brunch, almuerzo y cena en un ambiente tradicional y moderno. El desayuno incluye especialidades locales, platos calientes, zumo, queso y frutas. Los servicios adicionales incluyen una terraza y un área de negocios.

Servicios Convenientes:
El hotel ofrece un servicio de traslado al aeropuerto de pago, ascensor, recepción 24 horas, servicio de limpieza, servicio de habitaciones, mostrador de información turística y consigna de equipaje. El aparcamiento gratuito en el lugar y el desayuno buffet son muy valorados por los huéspedes.
''',

      "imagenes": [
        "assets/images/hoteles/sonesta_ibague.jpg",
        "assets/images/hoteles/sonesta_ibague/sonesta_ibague_2.jpg",
        "assets/images/hoteles/sonesta_ibague/sonesta_ibague_3.jpg",
        "assets/images/hoteles/sonesta_ibague/sonesta_ibague_4.jpg",
        "assets/images/hoteles/sonesta_ibague/sonesta_ibague_5.jpg",
        "assets/images/hoteles/sonesta_ibague/sonesta_ibague_6.jpg",
        "assets/images/hoteles/sonesta_ibague/sonesta_ibague_7.jpg",
        "assets/images/hoteles/sonesta_ibague/sonesta_ibague_8.jpg",
        "assets/images/hoteles/sonesta_ibague/sonesta_ibague_9.jpg",
        "assets/images/hoteles/sonesta_ibague/sonesta_ibague_10.jpg",
      ],
      "servicios": ["wifi", "gym", "restaurante", "parking"],
    },
  ];

  void moverDerecha() {
    _controller.animateTo(
      _controller.offset + 260,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  void moverIzquierda() {
    _controller.animateTo(
      _controller.offset - 260,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Hoteles",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(onPressed: () {}, child: const Text("Ver más")),
            ],
          ),
        ),
        SizedBox(
          height: 260,
          child: Stack(
            children: [
              ListView.builder(
                controller: _controller,
                scrollDirection: Axis.horizontal,
                itemCount: hoteles.length,
                itemBuilder: (_, index) {
                  final hotel = hoteles[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => HotelDetallePage(hotel: hotel),
                          ),
                        );
                      },
                      child: Container(
                        width: 220,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 6,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(16),
                              ),
                              child: Image.asset(
                                hotel["imagenes"][0],
                                height: 140,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                hotel["nombre"],
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              child: Text(
                                "⭐ ${hotel["puntuacion"]}\n${hotel["ubicación"]}",
                                style: const TextStyle(fontSize: 13),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              Positioned(
                left: 0,
                top: 100,
                child: _flecha(Icons.arrow_back_ios, moverIzquierda),
              ),
              Positioned(
                right: 0,
                top: 100,
                child: _flecha(Icons.arrow_forward_ios, moverDerecha),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _flecha(IconData icon, VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.4),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white),
        onPressed: onPressed,
      ),
    );
  }
}

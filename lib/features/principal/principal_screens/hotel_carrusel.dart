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
      "precios": {
        "2026-02-09": 220000,
        "2026-02-10": 220000,
        "2026-02-11": 220000,
        "2026-02-12": 225000,
        "2026-02-13": 240000,
        "2026-02-14": 260000,
        "2026-02-15": 235000,
        "2026-02-16": 220000,
        "2026-02-17": 220000,
        "2026-02-18": 220000,
        "2026-02-19": 225000,
        "2026-02-20": 255000,
        "2026-02-21": 255000,
        "2026-02-22": 230000,
        "2026-02-23": 220000,
        "2026-02-24": 220000,
        "2026-02-25": 220000,
        "2026-02-26": 225000,
        "2026-02-27": 255000,
        "2026-02-28": 260000,

        "2026-03-01": 260000,
        "2026-03-02": 225000,
        "2026-03-03": 225000,
        "2026-03-04": 225000,
        "2026-03-05": 230000,
        "2026-03-06": 255000,
        "2026-03-07": 270000,
        "2026-03-08": 245000,
        "2026-03-09": 225000,
        "2026-03-10": 225000,
        "2026-03-11": 225000,
        "2026-03-12": 230000,
        "2026-03-13": 260000,
        "2026-03-14": 275000,
        "2026-03-15": 265000,
        "2026-03-16": 235000,
        "2026-03-17": 235000,
        "2026-03-18": 235000,
        "2026-03-19": 240000,
        "2026-03-20": 260000,
        "2026-03-21": 280000,
        "2026-03-22": 255000,
        "2026-03-23": 235000,
        "2026-03-24": 235000,
        "2026-03-25": 235000,
        "2026-03-26": 240000,
        "2026-03-27": 260000,
        "2026-03-28": 285000,
        "2026-03-29": 265000,
        "2026-03-30": 245000,
        "2026-03-31": 255000,
      },
    },
    {
      "nombre": "AQUAMARE",
      "ubicación": "SAN ANDRÉS",
      "puntuacion": 4.5,
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
      "precios": {
        "2026-02-09": 180000,
        "2026-02-10": 180000,
        "2026-02-11": 180000,
        "2026-02-12": 185000,
        "2026-02-13": 200000,
        "2026-02-14": 215000,
        "2026-02-15": 195000,
        "2026-02-16": 180000,
        "2026-02-17": 180000,
        "2026-02-18": 180000,
        "2026-02-19": 185000,
        "2026-02-20": 210000,
        "2026-02-21": 210000,
        "2026-02-22": 190000,
        "2026-02-23": 180000,
        "2026-02-24": 180000,
        "2026-02-25": 180000,
        "2026-02-26": 185000,
        "2026-02-27": 210000,
        "2026-02-28": 215000,

        "2026-03-01": 215000,
        "2026-03-02": 185000,
        "2026-03-03": 185000,
        "2026-03-04": 185000,
        "2026-03-05": 190000,
        "2026-03-06": 210000,
        "2026-03-07": 225000,
        "2026-03-08": 205000,
        "2026-03-09": 185000,
        "2026-03-10": 185000,
        "2026-03-11": 185000,
        "2026-03-12": 190000,
        "2026-03-13": 215000,
        "2026-03-14": 230000,
        "2026-03-15": 220000,
        "2026-03-16": 195000,
        "2026-03-17": 195000,
        "2026-03-18": 195000,
        "2026-03-19": 200000,
        "2026-03-20": 215000,
        "2026-03-21": 235000,
        "2026-03-22": 210000,
        "2026-03-23": 195000,
        "2026-03-24": 195000,
        "2026-03-25": 195000,
        "2026-03-26": 200000,
        "2026-03-27": 215000,
        "2026-03-28": 240000,
        "2026-03-29": 220000,
        "2026-03-30": 205000,
        "2026-03-31": 215000,
      },
    },
    {
      "nombre": "COUNTRY INTERNATIONAL",
      "ubicación": "BARRANQUILLA",
      "puntuacion": 4.5,
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
      "precios": {
        "2026-02-09": 420000,
        "2026-02-10": 420000,
        "2026-02-11": 420000,
        "2026-02-12": 430000,
        "2026-02-13": 460000,
        "2026-02-14": 520000,
        "2026-02-15": 480000,
        "2026-02-16": 430000,
        "2026-02-17": 430000,
        "2026-02-18": 430000,
        "2026-02-19": 440000,
        "2026-02-20": 500000,
        "2026-02-21": 500000,
        "2026-02-22": 460000,
        "2026-02-23": 430000,
        "2026-02-24": 430000,
        "2026-02-25": 430000,
        "2026-02-26": 440000,
        "2026-02-27": 500000,
        "2026-02-28": 520000,

        "2026-03-01": 520000,
        "2026-03-02": 440000,
        "2026-03-03": 440000,
        "2026-03-04": 440000,
        "2026-03-05": 450000,
        "2026-03-06": 500000,
        "2026-03-07": 540000,
        "2026-03-08": 490000,
        "2026-03-09": 440000,
        "2026-03-10": 440000,
        "2026-03-11": 440000,
        "2026-03-12": 450000,
        "2026-03-13": 520000,
        "2026-03-14": 560000,
        "2026-03-15": 530000,
        "2026-03-16": 470000,
        "2026-03-17": 470000,
        "2026-03-18": 470000,
        "2026-03-19": 480000,
        "2026-03-20": 520000,
        "2026-03-21": 580000,
        "2026-03-22": 520000,
        "2026-03-23": 470000,
        "2026-03-24": 470000,
        "2026-03-25": 470000,
        "2026-03-26": 480000,
        "2026-03-27": 520000,
        "2026-03-28": 600000,
        "2026-03-29": 550000,
        "2026-03-30": 500000,
        "2026-03-31": 520000,
      },
    },
    {
      "nombre": "ESTELAR ALTAMIRA",
      "ubicación": "IBAGUÉ",
      "puntuacion": 4.5,
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
      "precios": {
        "2026-02-09": 120000,
        "2026-02-10": 120000,
        "2026-02-11": 120000,
        "2026-02-12": 125000,
        "2026-02-13": 140000,
        "2026-02-14": 155000,
        "2026-02-15": 135000,
        "2026-02-16": 120000,
        "2026-02-17": 120000,
        "2026-02-18": 120000,
        "2026-02-19": 125000,
        "2026-02-20": 150000,
        "2026-02-21": 150000,
        "2026-02-22": 130000,
        "2026-02-23": 120000,
        "2026-02-24": 120000,
        "2026-02-25": 120000,
        "2026-02-26": 125000,
        "2026-02-27": 150000,
        "2026-02-28": 155000,

        "2026-03-01": 155000,
        "2026-03-02": 125000,
        "2026-03-03": 125000,
        "2026-03-04": 125000,
        "2026-03-05": 130000,
        "2026-03-06": 150000,
        "2026-03-07": 165000,
        "2026-03-08": 145000,
        "2026-03-09": 125000,
        "2026-03-10": 125000,
        "2026-03-11": 125000,
        "2026-03-12": 130000,
        "2026-03-13": 155000,
        "2026-03-14": 170000,
        "2026-03-15": 160000,
        "2026-03-16": 135000,
        "2026-03-17": 135000,
        "2026-03-18": 135000,
        "2026-03-19": 140000,
        "2026-03-20": 155000,
        "2026-03-21": 175000,
        "2026-03-22": 150000,
        "2026-03-23": 135000,
        "2026-03-24": 135000,
        "2026-03-25": 135000,
        "2026-03-26": 140000,
        "2026-03-27": 155000,
        "2026-03-28": 180000,
        "2026-03-29": 160000,
        "2026-03-30": 145000,
        "2026-03-31": 155000,
      },
    },
    {
      "nombre": "IROTAMA LAGO",
      "ubicación": "SANTA MARTA",
      "puntuacion": 4.5,
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
      "precios": {
        "2026-02-09": 255000,
        "2026-02-10": 255000,
        "2026-02-11": 255000,
        "2026-02-12": 260000,
        "2026-02-13": 285000,
        "2026-02-14": 310000,
        "2026-02-15": 290000,
        "2026-02-16": 260000,
        "2026-02-17": 260000,
        "2026-02-18": 260000,
        "2026-02-19": 265000,
        "2026-02-20": 300000,
        "2026-02-21": 300000,
        "2026-02-22": 275000,
        "2026-02-23": 260000,
        "2026-02-24": 260000,
        "2026-02-25": 260000,
        "2026-02-26": 265000,
        "2026-02-27": 300000,
        "2026-02-28": 315000,

        "2026-03-01": 315000,
        "2026-03-02": 265000,
        "2026-03-03": 265000,
        "2026-03-04": 265000,
        "2026-03-05": 270000,
        "2026-03-06": 300000,
        "2026-03-07": 325000,
        "2026-03-08": 295000,
        "2026-03-09": 265000,
        "2026-03-10": 265000,
        "2026-03-11": 265000,
        "2026-03-12": 270000,
        "2026-03-13": 315000,
        "2026-03-14": 335000,
        "2026-03-15": 320000,
        "2026-03-16": 285000,
        "2026-03-17": 285000,
        "2026-03-18": 285000,
        "2026-03-19": 290000,
        "2026-03-20": 315000,
        "2026-03-21": 345000,
        "2026-03-22": 315000,
        "2026-03-23": 285000,
        "2026-03-24": 285000,
        "2026-03-25": 285000,
        "2026-03-26": 290000,
        "2026-03-27": 315000,
        "2026-03-28": 360000,
        "2026-03-29": 320000,
        "2026-03-30": 295000,
        "2026-03-31": 315000,
      },
    },
    {
      "nombre": "LAS AMÉRICAS TORRE DEL MAR",
      "ubicación": "CARTAGENA",
      "puntuacion": 4.5,
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
      "precios": {
        "2026-02-09": 198000,
        "2026-02-10": 198000,
        "2026-02-11": 198000,
        "2026-02-12": 205000,
        "2026-02-13": 225000,
        "2026-02-14": 245000,
        "2026-02-15": 230000,
        "2026-02-16": 205000,
        "2026-02-17": 205000,
        "2026-02-18": 205000,
        "2026-02-19": 210000,
        "2026-02-20": 235000,
        "2026-02-21": 235000,
        "2026-02-22": 215000,
        "2026-02-23": 205000,
        "2026-02-24": 205000,
        "2026-02-25": 205000,
        "2026-02-26": 210000,
        "2026-02-27": 235000,
        "2026-02-28": 245000,

        "2026-03-01": 245000,
        "2026-03-02": 210000,
        "2026-03-03": 210000,
        "2026-03-04": 210000,
        "2026-03-05": 215000,
        "2026-03-06": 235000,
        "2026-03-07": 255000,
        "2026-03-08": 230000,
        "2026-03-09": 210000,
        "2026-03-10": 210000,
        "2026-03-11": 210000,
        "2026-03-12": 215000,
        "2026-03-13": 245000,
        "2026-03-14": 265000,
        "2026-03-15": 255000,
        "2026-03-16": 225000,
        "2026-03-17": 225000,
        "2026-03-18": 225000,
        "2026-03-19": 230000,
        "2026-03-20": 245000,
        "2026-03-21": 275000,
        "2026-03-22": 245000,
        "2026-03-23": 225000,
        "2026-03-24": 225000,
        "2026-03-25": 225000,
        "2026-03-26": 230000,
        "2026-03-27": 245000,
        "2026-03-28": 280000,
        "2026-03-29": 255000,
        "2026-03-30": 230000,
        "2026-03-31": 245000,
      },
    },
    {
      "nombre": "SAN FERNANDO PLAZA",
      "ubicación": "MEDELLÍN",
      "puntuacion": 4.5,
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
      "precios": {
        "2026-02-09": 340000,
        "2026-02-10": 340000,
        "2026-02-11": 340000,
        "2026-02-12": 350000,
        "2026-02-13": 390000,
        "2026-02-14": 450000,
        "2026-02-15": 420000,
        "2026-02-16": 350000,
        "2026-02-17": 350000,
        "2026-02-18": 350000,
        "2026-02-19": 360000,
        "2026-02-20": 420000,
        "2026-02-21": 420000,
        "2026-02-22": 390000,
        "2026-02-23": 350000,
        "2026-02-24": 350000,
        "2026-02-25": 350000,
        "2026-02-26": 360000,
        "2026-02-27": 420000,
        "2026-02-28": 450000,

        "2026-03-01": 450000,
        "2026-03-02": 360000,
        "2026-03-03": 360000,
        "2026-03-04": 360000,
        "2026-03-05": 370000,
        "2026-03-06": 420000,
        "2026-03-07": 480000,
        "2026-03-08": 410000,
        "2026-03-09": 360000,
        "2026-03-10": 360000,
        "2026-03-11": 360000,
        "2026-03-12": 370000,
        "2026-03-13": 450000,
        "2026-03-14": 490000,
        "2026-03-15": 460000,
        "2026-03-16": 395000,
        "2026-03-17": 395000,
        "2026-03-18": 395000,
        "2026-03-19": 405000,
        "2026-03-20": 450000,
        "2026-03-21": 510000,
        "2026-03-22": 450000,
        "2026-03-23": 395000,
        "2026-03-24": 395000,
        "2026-03-25": 395000,
        "2026-03-26": 405000,
        "2026-03-27": 450000,
        "2026-03-28": 540000,
        "2026-03-29": 470000,
        "2026-03-30": 420000,
        "2026-03-31": 450000,
      },
    },
    {
      "nombre": "SONESTA BOGOTÁ",
      "ubicación": "BOGOTÁ",
      "puntuacion": 4.9,
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
      "precios": {
        "2026-02-09": 165000,
        "2026-02-10": 165000,
        "2026-02-11": 165000,
        "2026-02-12": 170000,
        "2026-02-13": 185000,
        "2026-02-14": 205000,
        "2026-02-15": 190000,
        "2026-02-16": 170000,
        "2026-02-17": 170000,
        "2026-02-18": 170000,
        "2026-02-19": 175000,
        "2026-02-20": 195000,
        "2026-02-21": 195000,
        "2026-02-22": 180000,
        "2026-02-23": 170000,
        "2026-02-24": 170000,
        "2026-02-25": 170000,
        "2026-02-26": 175000,
        "2026-02-27": 195000,
        "2026-02-28": 205000,

        "2026-03-01": 205000,
        "2026-03-02": 175000,
        "2026-03-03": 175000,
        "2026-03-04": 175000,
        "2026-03-05": 180000,
        "2026-03-06": 195000,
        "2026-03-07": 215000,
        "2026-03-08": 190000,
        "2026-03-09": 175000,
        "2026-03-10": 175000,
        "2026-03-11": 175000,
        "2026-03-12": 180000,
        "2026-03-13": 205000,
        "2026-03-14": 220000,
        "2026-03-15": 210000,
        "2026-03-16": 185000,
        "2026-03-17": 185000,
        "2026-03-18": 185000,
        "2026-03-19": 190000,
        "2026-03-20": 205000,
        "2026-03-21": 230000,
        "2026-03-22": 205000,
        "2026-03-23": 185000,
        "2026-03-24": 185000,
        "2026-03-25": 185000,
        "2026-03-26": 190000,
        "2026-03-27": 205000,
        "2026-03-28": 240000,
        "2026-03-29": 210000,
        "2026-03-30": 190000,
        "2026-03-31": 205000,
      },
    },
    {
      "nombre": "SUMA WASI",
      "ubicación": "PUTUMAYO",
      "puntuacion": 4.0,
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
      "precios": {
        "2026-02-09": 295000,
        "2026-02-10": 295000,
        "2026-02-11": 295000,
        "2026-02-12": 305000,
        "2026-02-13": 340000,
        "2026-02-14": 380000,
        "2026-02-15": 360000,
        "2026-02-16": 305000,
        "2026-02-17": 305000,
        "2026-02-18": 305000,
        "2026-02-19": 315000,
        "2026-02-20": 360000,
        "2026-02-21": 360000,
        "2026-02-22": 335000,
        "2026-02-23": 305000,
        "2026-02-24": 305000,
        "2026-02-25": 305000,
        "2026-02-26": 315000,
        "2026-02-27": 360000,
        "2026-02-28": 385000,

        "2026-03-01": 385000,
        "2026-03-02": 315000,
        "2026-03-03": 315000,
        "2026-03-04": 315000,
        "2026-03-05": 325000,
        "2026-03-06": 360000,
        "2026-03-07": 395000,
        "2026-03-08": 350000,
        "2026-03-09": 315000,
        "2026-03-10": 315000,
        "2026-03-11": 315000,
        "2026-03-12": 325000,
        "2026-03-13": 385000,
        "2026-03-14": 420000,
        "2026-03-15": 400000,
        "2026-03-16": 345000,
        "2026-03-17": 345000,
        "2026-03-18": 345000,
        "2026-03-19": 355000,
        "2026-03-20": 385000,
        "2026-03-21": 430000,
        "2026-03-22": 385000,
        "2026-03-23": 345000,
        "2026-03-24": 345000,
        "2026-03-25": 345000,
        "2026-03-26": 355000,
        "2026-03-27": 385000,
        "2026-03-28": 450000,
        "2026-03-29": 400000,
        "2026-03-30": 350000,
        "2026-03-31": 385000,
      },
    },
    {
      "nombre": "SONESTA IBAGUÉ",
      "ubicación": "IBAGUÉ",
      "puntuacion": 5.0,
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
      "precios": {
        "2026-02-09": 295000,
        "2026-02-10": 295000,
        "2026-02-11": 295000,
        "2026-02-12": 305000,
        "2026-02-13": 340000,
        "2026-02-14": 380000,
        "2026-02-15": 360000,
        "2026-02-16": 305000,
        "2026-02-17": 305000,
        "2026-02-18": 305000,
        "2026-02-19": 315000,
        "2026-02-20": 360000,
        "2026-02-21": 360000,
        "2026-02-22": 335000,
        "2026-02-23": 305000,
        "2026-02-24": 305000,
        "2026-02-25": 305000,
        "2026-02-26": 315000,
        "2026-02-27": 360000,
        "2026-02-28": 385000,

        "2026-03-01": 385000,
        "2026-03-02": 315000,
        "2026-03-03": 315000,
        "2026-03-04": 315000,
        "2026-03-05": 325000,
        "2026-03-06": 360000,
        "2026-03-07": 395000,
        "2026-03-08": 350000,
        "2026-03-09": 315000,
        "2026-03-10": 315000,
        "2026-03-11": 315000,
        "2026-03-12": 325000,
        "2026-03-13": 385000,
        "2026-03-14": 420000,
        "2026-03-15": 400000,
        "2026-03-16": 345000,
        "2026-03-17": 345000,
        "2026-03-18": 345000,
        "2026-03-19": 355000,
        "2026-03-20": 385000,
        "2026-03-21": 430000,
        "2026-03-22": 385000,
        "2026-03-23": 345000,
        "2026-03-24": 345000,
        "2026-03-25": 345000,
        "2026-03-26": 355000,
        "2026-03-27": 385000,
        "2026-03-28": 450000,
        "2026-03-29": 400000,
        "2026-03-30": 350000,
        "2026-03-31": 385000,
      },
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
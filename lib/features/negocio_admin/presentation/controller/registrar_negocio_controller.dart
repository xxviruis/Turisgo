import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/negocio_admin/data/repositories/ciudad_repository_impl.dart';
import 'package:flutter_application_1/features/negocio_admin/domain/dtos/create_negocio_dto.dart';
import 'package:flutter_application_1/features/negocio_admin/domain/entities/ciudad.dart';
import 'package:flutter_application_1/features/negocio_admin/domain/entities/tipo_negocio.dart';
import 'package:flutter_application_1/features/negocio_admin/domain/repositories/ciudad_repository.dart';
import 'package:flutter_application_1/features/negocio_admin/domain/repositories/tipo_negocio_repository.dart';
import 'package:flutter_application_1/features/negocio_admin/domain/usecases/crear_negocio_usecase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegistrarNegocioController extends ChangeNotifier {
  final CrearNegocioUseCase crearNegocioUseCase;
  final TipoNegocioRepository tipoNegocioRepository;
  final CiudadRepository ciudadRepository;

  RegistrarNegocioController(
    this.crearNegocioUseCase,
    this.tipoNegocioRepository,
    this.ciudadRepository,
  ) {
    cargarTipos();
  }

  final formKey = GlobalKey<FormState>();

  String nombre = '';
  String descripcion = '';
  String direccion = '';
  String telefono = '';
  String email = '';
  int? ciudadSeleccionadaId;
  String ciudadTexto = "";
  List<String> imagenesUrls = [];
  List<TipoNegocio> tipos = [];
  int? tipoSeleccionadoId;
  bool isLoading = false;
  List<String> amenidadesSeleccionadas = [];

  final List<String> amenidadesBase = ["Wifi", "Gym", "Piscina", "Parqueadero"];

  void toggleAmenidad(String amenidad) {
    if (amenidadesSeleccionadas.contains(amenidad)) {
      amenidadesSeleccionadas.remove(amenidad);
    } else {
      amenidadesSeleccionadas.add(amenidad);
    }
    notifyListeners();
  }

  void agregarAmenidadPersonalizada(String amenidad) {
    if (amenidad.isNotEmpty && !amenidadesSeleccionadas.contains(amenidad)) {
      amenidadesSeleccionadas.add(amenidad);
      notifyListeners();
    }
  }

  void eliminarAmenidad(String amenidad) {
    amenidadesSeleccionadas.remove(amenidad);
    notifyListeners();
  }

  Future<void> cargarTipos() async {
    tipos = await tipoNegocioRepository.obtenerTipos();
    notifyListeners();
  }

  bool validarFormulario() {
    final isFormValid = formKey.currentState?.validate() ?? false;
    final isTipoValid = tipoSeleccionadoId != null;

    return isFormValid && isTipoValid;
  }

  Future<List<Ciudad>> buscarCiudades(String query) async {
    return await ciudadRepository.buscarCiudades(query);
  }

  Future<void> guardar() async {
    if (!validarFormulario()) return;

    try {
      isLoading = true;
      notifyListeners();

      final userId = Supabase.instance.client.auth.currentUser!.id;

      final dto = CreateNegocioDto(
        nombre: nombre,
        descripcion: descripcion,
        direccion: direccion,
        ciudadId: ciudadSeleccionadaId!,
        telefono: telefono,
        emailNegocio: email,
        imagenes: imagenesUrls,
        propietarioId: userId,
        amenidades: amenidadesSeleccionadas,
        tipoId: tipoSeleccionadoId!,
        metodosPago: [],
      );

      await crearNegocioUseCase.call(dto);
    } catch (e) {
      print("ERROR AL GUARDAR: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}

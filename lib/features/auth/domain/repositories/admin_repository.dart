import 'package:flutter_application_1/features/usuario/data/models/negocio_model.dart';
import 'package:flutter_application_1/features/auth/data/models/usuario_model.dart';

// Interfaz para cumplir con el Principio de Inversión de Dependencias
abstract class IAdminRepository {
  Future<List<UsuarioModel>> getTodosLosUsuarios();
  Future<void> cambiarEstadoUsuario(String id, bool nuevoEstado);
  Future<List<Negocio>> getTodosLosNegocios();
  Future<void> actualizarNegocio(Negocio negocio);
  Future<void> eliminarNegocio(String id);
}

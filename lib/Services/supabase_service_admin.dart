import 'package:flutter_application_1/Services/admin_repository.dart';
import 'package:flutter_application_1/models/negocio_model.dart';
import 'package:flutter_application_1/models/usuario_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAdminService implements IAdminRepository {
  final _supabase = Supabase.instance.client;

  @override
  Future<List<Negocio>> getTodosLosNegocios() async {
    final response = await _supabase.from('negocios').select();
    return (response as List).map((n) => Negocio.fromMap(n)).toList();
  }

  @override
  Future<void> eliminarNegocio(String id) async {
    await _supabase.from('negocios').delete().eq('id', id);
  }

  @override
  Future<void> actualizarNegocio(Negocio negocio) async {
    await _supabase
        .from('negocios')
        .update(negocio.toMap())
        .eq('id', negocio.id);
  }

  @override
  Future<void> cambiarEstadoUsuario(String id, bool nuevoEstado) {
    // TODO: implement cambiarEstadoUsuario
    throw UnimplementedError();
  }

  @override
  Future<List<UsuarioModel>> getTodosLosUsuarios() async {
    try {
      // 1. Hacemos la consulta
      final List<dynamic> data = await _supabase
          .from('perfiles')
          .select()
          .order('nombre', ascending: true); // Ordenamos de la A a la Z

      // 2. Mapeamos los datos al modelo
      // Usamos .toList() al final para asegurar el tipo de retorno
      return data.map((u) => UsuarioModel.fromMap(u)).toList();
    } catch (e) {
      // 3. Si algo falla (ej. no hay internet), lanzamos el error o retornamos lista vacía
      print("Error en getTodosLosUsuarios: $e");
      return [];
    }
  }
}

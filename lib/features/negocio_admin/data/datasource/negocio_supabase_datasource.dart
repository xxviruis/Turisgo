import 'package:supabase_flutter/supabase_flutter.dart';

class NegocioSupabaseDataSource {
  final SupabaseClient client;

  NegocioSupabaseDataSource(this.client);

  Future<void> crearNegocio(Map<String, dynamic> data) async {
    await client.from('negocios').insert(data);
  }

  Future<Map<String, dynamic>?> obtenerPorId(String id) async {
    final response = await client
        .from('negocios')
        .select()
        .eq('id', id)
        .maybeSingle();

    return response;
  }

  Future<List<Map<String, dynamic>>> fetchTipos() async {
    final response = await client.from('tipo_negocios').select();

    return List<Map<String, dynamic>>.from(response);
  }

  Future<List<Map<String, dynamic>>> obtenerPorPropietario(
    String propietarioId,
  ) async {
    final response = await client
        .from('negocios')
        .select()
        .eq('propietario_id', propietarioId);

    return List<Map<String, dynamic>>.from(response);
  }
}

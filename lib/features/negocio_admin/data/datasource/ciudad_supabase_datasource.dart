import 'package:supabase_flutter/supabase_flutter.dart';

class CiudadSupabaseDataSource {
  final SupabaseClient client;

  CiudadSupabaseDataSource(this.client);

  Future<List<Map<String, dynamic>>> buscar(String query) async {
    final response = await client
        .from('ciudades')
        .select()
        .ilike('nombre', '%$query%')
        .limit(10);

    return List<Map<String, dynamic>>.from(response);
  }

  Future<List<Map<String, dynamic>>> obtenerCiudadesPorDepartamento(
    int departamentoId,
  ) async {
    final response = await client
        .from('ciudades')
        .select()
        .eq('departamento_id', departamentoId)
        .order('nombre');

    return List<Map<String, dynamic>>.from(response);
  }
}

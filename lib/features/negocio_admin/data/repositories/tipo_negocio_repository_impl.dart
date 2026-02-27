import '../../domain/entities/tipo_negocio.dart';
import '../../domain/repositories/tipo_negocio_repository.dart';
import '../datasource/negocio_supabase_datasource.dart';

class TipoNegocioRepositoryImpl implements TipoNegocioRepository {
  final NegocioSupabaseDataSource dataSource;

  TipoNegocioRepositoryImpl(this.dataSource);

  @override
  Future<List<TipoNegocio>> obtenerTipos() async {
    final response = await dataSource.fetchTipos();

    return response
        .map<TipoNegocio>(
          (e) => TipoNegocio(id: e['id'] as int, nombre: e['nombre'] as String),
        )
        .toList();
  }
}

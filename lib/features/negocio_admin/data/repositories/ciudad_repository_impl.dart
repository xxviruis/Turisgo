import 'package:flutter_application_1/features/negocio_admin/data/datasource/ciudad_supabase_datasource.dart';
import 'package:flutter_application_1/features/negocio_admin/domain/entities/ciudad.dart';
import 'package:flutter_application_1/features/negocio_admin/domain/repositories/ciudad_repository.dart';

class CiudadRepositoryImpl implements CiudadRepository {
  final CiudadSupabaseDataSource dataSource;

  CiudadRepositoryImpl(this.dataSource);

  @override
  Future<List<Ciudad>> buscarCiudades(String query) async {
    final response = await dataSource.buscar(query);

    return response
        .map(
          (e) => Ciudad(
            id: e['id'],
            nombre: e['nombre'],
            departamento: e['departamento'],
          ),
        )
        .toList();
  }
}

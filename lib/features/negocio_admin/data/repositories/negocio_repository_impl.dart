import 'package:flutter_application_1/features/negocio_admin/data/datasource/negocio_supabase_datasource.dart';
import 'package:flutter_application_1/features/negocio_admin/data/models/create_negocio_mapper.dart';
import 'package:flutter_application_1/features/negocio_admin/data/models/negocio_model.dart';
import 'package:flutter_application_1/features/negocio_admin/domain/dtos/create_negocio_dto.dart';
import 'package:flutter_application_1/features/negocio_admin/domain/entities/negocio.dart';
import 'package:flutter_application_1/features/negocio_admin/domain/repositories/negocio_repository.dart';

class NegocioRepositoryImpl implements NegocioRepository {
  final NegocioSupabaseDataSource dataSource;

  NegocioRepositoryImpl(this.dataSource);

  @override
  Future<void> crearNegocio(CreateNegocioDto dto) async {
    final map = CreateNegocioMapper.toMap(dto);
    await dataSource.crearNegocio(map);
  }

  @override
  Future<Negocio?> obtenerNegocioPorId(String id) async {
    final response = await dataSource.obtenerPorId(id);

    if (response == null) return null;

    return NegocioModel.fromMap(response);
  }

  @override
  Future<List<Negocio>> obtenerNegociosPorPropietario(
    String propietarioId,
  ) async {
    final response = await dataSource.obtenerPorPropietario(propietarioId);

    return response.map((e) => NegocioModel.fromMap(e)).toList();
  }
}

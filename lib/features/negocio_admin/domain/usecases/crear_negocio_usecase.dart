import 'package:flutter_application_1/features/negocio_admin/domain/dtos/create_negocio_dto.dart';
import 'package:flutter_application_1/features/negocio_admin/domain/repositories/negocio_repository.dart';

class CrearNegocioUseCase {
  final NegocioRepository repository;

  CrearNegocioUseCase(this.repository);

  Future<void> call(CreateNegocioDto dto) async {
    await repository.crearNegocio(dto);
  }
}

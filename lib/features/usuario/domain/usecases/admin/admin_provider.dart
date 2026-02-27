import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/auth/domain/repositories/admin_repository.dart';
import 'package:flutter_application_1/features/negocio_admin/domain/entities/negocio.dart';

class AdminProvider extends ChangeNotifier {
  final IAdminRepository repository;

  List<Negocio> _negocios = [];
  List<Negocio> get negocios => _negocios;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  AdminProvider({required this.repository});

  Future<void> cargarDatos() async {
    _isLoading = true;
    notifyListeners();
    try {
      _negocios = await repository.getTodosLosNegocios();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> delete(String id) async {
    await repository.eliminarNegocio(id);
    _negocios.removeWhere((n) => n.id == id);
    notifyListeners();
  }

  void update(Negocio negocioActualizado) {}
}

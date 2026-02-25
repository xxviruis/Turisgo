abstract class PrestadorDao {
  Future<int> obtenerTotalNegocios(String userId);
  Future<int> obtenerSolicitudesPendientes(String userId);
  Future<int> obtenerNotificacionesNoLeidas(String userId);
}

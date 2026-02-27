import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/admin/presentation/admin_screens/edit_negocios_screens.dart';
import 'package:flutter_application_1/features/usuario/domain/usecases/admin/admin_provider.dart';
import 'package:flutter_application_1/core/widgets/danger_sheets.dart';
import 'package:flutter_application_1/features/negocio_admin/domain/entities/negocio.dart';
import 'package:provider/provider.dart';

class AdminNegociosScreen extends StatelessWidget {
  const AdminNegociosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Escuchamos el provider para redibujar si cambia la lista o loading
    final adminProv = Provider.of<AdminProvider>(context);

    return Scaffold(
      backgroundColor: Colors.grey[50], // Un fondo gris claro se ve más moderno
      appBar: AppBar(
        title: const Text(
          'Gestión de Negocios',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: adminProv.isLoading
          ? const Center(child: CircularProgressIndicator())
          : adminProv.negocios.isEmpty
          ? _buildEmptyState() // UI por si no hay datos
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: adminProv.negocios.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, i) {
                final negocio = adminProv.negocios[i];
                return _buildNegocioCard(context, negocio, adminProv);
              },
            ),
    );
  }

  // --- WIDGET DE LA TARJETA (UI Bonita) ---
  Widget _buildNegocioCard(
    BuildContext context,
    Negocio negocio,
    AdminProvider provider,
  ) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: ListTile(
          leading: CircleAvatar(
            radius: 24,
            backgroundColor: Colors.indigo.withOpacity(0.1),
            backgroundImage: negocio.imagenes.isNotEmpty
                ? NetworkImage(
                    negocio.imagenes.first,
                  ) // Muestra la 1ra foto si existe
                : null,
            child: negocio.imagenes.isEmpty
                ? const Icon(Icons.store, color: Colors.indigo)
                : null,
          ),
          title: Text(
            negocio.nombre,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Text(
                negocio.tipoId.toString(),
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
              Text(
                negocio.ciudad,
                style: const TextStyle(color: Colors.black54, fontSize: 13),
              ),
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Botón Editar (Estilo suave)
              IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: Colors.blue.withOpacity(0.1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                icon: const Icon(
                  Icons.edit_rounded,
                  color: Colors.blueAccent,
                  size: 20,
                ),
                onPressed: () => _abrirEditor(context, negocio),
              ),
              const SizedBox(width: 8),
              // Botón Borrar (Estilo suave)
              IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: Colors.red.withOpacity(0.1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                icon: const Icon(
                  Icons.delete_outline_rounded,
                  color: Colors.redAccent,
                  size: 20,
                ),
                onPressed: () =>
                    _mostrarConfirmacionBonita(context, negocio, provider),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- LÓGICA DE NAVEGACIÓN Y ACCIONES ---

  // 1. Abrir el Danger Sheet
  void _mostrarConfirmacionBonita(
    BuildContext context,
    Negocio negocio,
    AdminProvider provider,
  ) {
    showModalBottomSheet(
      context: context,
      backgroundColor:
          Colors.transparent, // Clave para ver los bordes redondeados del sheet
      isScrollControlled: true,
      builder: (context) => DangerSheet(
        title: "¿Eliminar Negocio?",
        message: "Esta acción borrará permanentemente de la base de datos a:",
        itemName: negocio.nombre,
        onConfirm: () {
          // Llamamos al Provider (Lógica)
          provider.delete(negocio.id);
        },
      ),
    );
  }

  // 2. Abrir el Editor
  void _abrirEditor(BuildContext context, Negocio negocio) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => EditNegocioForm(
          negocio: negocio,
          onSave: (negocioActualizado) {
            // Usamos read porque estamos fuera del árbol de renderizado directo
            context.read<AdminProvider>().update(negocioActualizado);

            // Feedback visual
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Negocio actualizado correctamente'),
              ),
            );
          },
        ),
      ),
    );
  }

  // 3. Estado Vacío (Opcional pero recomendado)
  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.folder_off_outlined, size: 60, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            "No hay negocios registrados",
            style: TextStyle(color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}

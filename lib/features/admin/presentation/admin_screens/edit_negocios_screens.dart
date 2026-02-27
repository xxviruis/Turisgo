import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/negocio_admin/domain/entities/negocio.dart';

class EditNegocioForm extends StatefulWidget {
  final Negocio negocio;
  final Function(Negocio) onSave;

  const EditNegocioForm({
    super.key,
    required this.negocio,
    required this.onSave,
  });

  @override
  State<EditNegocioForm> createState() => _EditNegocioFormState();
}

class _EditNegocioFormState extends State<EditNegocioForm> {
  final _formKey = GlobalKey<FormState>();

  // Controllers para cada campo de tu tabla de Supabase
  late TextEditingController _nombreCtrl;
  late TextEditingController _descCtrl;
  late TextEditingController _ciudadCtrl;
  late TextEditingController _telCtrl;
  late TextEditingController _emailCtrl;

  @override
  void initState() {
    super.initState();
    _nombreCtrl = TextEditingController(text: widget.negocio.nombre);
    _descCtrl = TextEditingController(text: widget.negocio.descripcion);
    _ciudadCtrl = TextEditingController(text: widget.negocio.ciudad);
    _telCtrl = TextEditingController(text: widget.negocio.telefono);
    _emailCtrl = TextEditingController(text: widget.negocio.emailNegocio);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Editar ${widget.negocio.nombre}')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildTextField(_nombreCtrl, 'Nombre del Negocio', Icons.business),
            _buildTextField(
              _descCtrl,
              'Descripción',
              Icons.description,
              maxLines: 3,
            ),
            _buildTextField(_ciudadCtrl, 'Ciudad', Icons.location_city),
            _buildTextField(
              _telCtrl,
              'Teléfono',
              Icons.phone,
              keyboard: TextInputType.phone,
            ),
            _buildTextField(
              _emailCtrl,
              'Email de contacto',
              Icons.email,
              keyboard: TextInputType.emailAddress,
            ),

            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: _submit,
              child: const Text('Guardar Cambios'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController ctrl,
    String label,
    IconData icon, {
    int maxLines = 1,
    TextInputType keyboard = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: ctrl,
        maxLines: maxLines,
        keyboardType: keyboard,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: const OutlineInputBorder(),
        ),
        validator: (value) => value!.isEmpty ? 'Campo obligatorio' : null,
      ),
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      // Creamos una nueva instancia con los datos actualizados (Inmutabilidad)
      final updatedNegocio = Negocio(
        id: widget.negocio.id,
        nombre: _nombreCtrl.text,
        descripcion: _descCtrl.text,
        tipoId: widget.negocio.tipoId, // Mantener igual o añadir selector
        direccion: widget.negocio.direccion,
        ciudad: _ciudadCtrl.text,
        telefono: _telCtrl.text,
        emailNegocio: _emailCtrl.text,
        imagenes: widget.negocio.imagenes,
        propietarioId: widget.negocio.propietarioId,
        createdAt: widget.negocio.createdAt,
        puntuacion: widget.negocio.puntuacion,
        amenidades: [],
        metodosPago: [],
      );

      widget.onSave(updatedNegocio);
      Navigator.pop(context);
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Screens/await_screen.dart';
import 'package:flutter_application_1/Services/scripts.dart';
import 'package:flutter_application_1/Widgets/Boton_carga.dart';
import 'package:flutter_application_1/Widgets/colors.dart';
import 'package:flutter_application_1/Widgets/Visual_utils.dart';
import 'package:flutter_application_1/Widgets/app_inputs.dart'; // Importamos tu nueva función

class Registrarse extends StatefulWidget {
  const Registrarse({super.key});

  @override
  State<Registrarse> createState() => _RegistrarseState();
}

class _RegistrarseState extends State<Registrarse> {
  final ScriptsRegistrarse logic = ScriptsRegistrarse();
  bool isLoading = false;
  bool _mostrarPassword = true;

  @override
  void dispose() {
    logic.dispose();
    super.dispose();
  }

  Future<void> _onRegistrar() async {
    if (isLoading) return;
    setState(() => isLoading = true);

    final mensaje = await logic.registrar();
    if (mounted) setState(() => isLoading = false);

    if (mensaje != null) {
      VisualUtils.mostrarErrorDialog(context, mensaje);
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => AwaitConfirm(scripts: logic)),
    );
  }

  final List<String> roles = ['Turista', 'Prestador de servicios'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. FONDO CON GRADIENTE
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [kTealColor, kMintColor],
              ),
            ),
          ),

          // 2. BOTÓN REGRESAR
          Positioned(
            top: 50,
            left: 20,
            child: Container(
              decoration: BoxDecoration(
                color: kWhiteColor.withValues(alpha: 0.2),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: kWhiteColor,
                  size: 20,
                ),
                onPressed: () => Navigator.maybePop(context),
              ),
            ),
          ),

          // 3. FORMULARIO
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
              child: Form(
                key: logic.key,
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 450),
                  padding: const EdgeInsets.symmetric(
                    vertical: 40,
                    horizontal: 30,
                  ),
                  decoration: BoxDecoration(
                    color: kWhiteColor.withValues(alpha: 0.92),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 25,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Crear Cuenta",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: kTealColor,
                        ),
                      ),
                      const SizedBox(height: 35),

                      // ROL (Usando tu inputStyle)
                      DropdownButtonFormField<String>(
                        value: logic.rolSeleccionado,
                        decoration: inputStyle(
                          label: "Rol",
                          icon: Icons.person_outline,
                        ),
                        items: roles
                            .map(
                              (r) => DropdownMenuItem(value: r, child: Text(r)),
                            )
                            .toList(),
                        onChanged: (value) =>
                            setState(() => logic.rolSeleccionado = value),
                        validator: (value) =>
                            value == null ? 'Seleccione un rol' : null,
                      ),
                      const SizedBox(height: 18),

                      // EMAIL
                      TextFormField(
                        controller: logic.txtEmail,
                        decoration: inputStyle(
                          label: "Correo Electrónico",
                          icon: Icons.email_outlined,
                        ),
                        validator: logic.gmailValidator,
                      ),
                      const SizedBox(height: 18),

                      // CELULAR
                      TextFormField(
                        controller: logic.txtPhone,
                        keyboardType: TextInputType.phone,
                        decoration: inputStyle(
                          label: "Celular (Opcional)",
                          icon: Icons.phone_android_outlined,
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(10),
                        ],
                      ),
                      const SizedBox(height: 18),

                      // PASSWORD (Usando copyWith para el ojito)
                      TextFormField(
                        controller: logic.txtPassword,
                        obscureText: _mostrarPassword,
                        decoration:
                            inputStyle(
                              label: "Contraseña",
                              icon: Icons.lock_outline,
                            ).copyWith(
                              suffixIcon: IconButton(
                                onPressed: () => setState(
                                  () => _mostrarPassword = !_mostrarPassword,
                                ),
                                icon: Icon(
                                  _mostrarPassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: kTealColor.withValues(alpha: 0.5),
                                ),
                              ),
                            ),
                        validator: logic.passwordValidator,
                      ),
                      const SizedBox(height: 18),

                      // CONFIRM PASSWORD
                      TextFormField(
                        controller: logic.txtConfirmPassword,
                        obscureText: true,
                        decoration: inputStyle(
                          label: "Confirmar Contraseña",
                          icon: Icons.lock_reset_outlined,
                        ),
                        validator: logic.passwordValidator,
                      ),
                      const SizedBox(height: 35),

                      // BOTÓN ACCIÓN
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kPeachColor,
                            foregroundColor: kWhiteColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 4,
                          ),
                          onPressed: isLoading ? null : _onRegistrar,
                          child: isLoading
                              ? const ButtonOrbitingLoader()
                              : const Text(
                                  "Registrarse",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

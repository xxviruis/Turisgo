import 'package:flutter/material.dart';
import 'package:flutter_application_1/Logic/login/logic_login.dart';
import 'package:flutter_application_1/Screens/usuario_screens/screen_usuario.dart';
import 'package:flutter_application_1/Widgets/Colors.dart';
import 'package:flutter_application_1/Widgets/Visual_utils.dart';
import 'package:flutter_application_1/Widgets/app_inputs.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final logic = LogicLogin();
  bool mostrarPassword = true;
  bool isLoading = false;

  @override
  void dispose() {
    logic.dispose();
    super.dispose();
  }

  Future<void> _onLogin() async {
    if (isLoading) return;
    setState(() => isLoading = true);

    final String? mensajeError = await logic.validar();

    if (!mounted) return;
    setState(() => isLoading = false);

    if (mensajeError != null) {
      VisualUtils.mostrarErrorDialog(context, mensajeError);
    } else {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const PantallaHomeAutenticada()),
        (Route<dynamic> route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Usamos Stack para que el botón de regresar flote sobre el fondo
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

          // 2. BOTÓN DE REGRESAR (Aparece arriba a la izquierda)
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

          // 3. CONTENIDO PRINCIPAL (Formulario)
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Form(
                key: logic.key,
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 400),
                  padding: const EdgeInsets.symmetric(
                    vertical: 40,
                    horizontal: 30,
                  ),
                  decoration: BoxDecoration(
                    color: kWhiteColor.withValues(alpha: 0.9),
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
                      // Logo Circular
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: kTealColor.withValues(alpha: 0.1),
                        child: const Icon(
                          Icons.travel_explore,
                          color: kTealColor,
                          size: 45,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Turisgo",
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: kTealColor,
                          letterSpacing: -0.5,
                        ),
                      ),
                      const Text(
                        "Explora el mundo con nosotros",
                        style: TextStyle(color: Colors.black54, fontSize: 14),
                      ),
                      const SizedBox(height: 40),

                      // INPUT EMAIL
                      TextFormField(
                        controller: logic.email,
                        keyboardType: TextInputType.emailAddress,
                        decoration: inputStyle(
                          label: "Correo Electrónico",
                          icon: Icons.email_outlined,
                        ),
                        validator: (value) => value == null || value.isEmpty
                            ? "Ingresa tu correo"
                            : null,
                      ),
                      const SizedBox(height: 18),

                      // INPUT PASSWORD
                      TextFormField(
                        controller: logic.password,
                        obscureText: mostrarPassword,
                        decoration:
                            inputStyle(
                              label: "Contraseña",
                              icon: Icons.lock_outline,
                            ).copyWith(
                              suffixIcon: IconButton(
                                onPressed: () => setState(
                                  () => mostrarPassword = !mostrarPassword,
                                ),
                                icon: Icon(
                                  mostrarPassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: kTealColor.withValues(alpha: 0.5),
                                ),
                              ),
                            ),
                        validator: (value) => value == null || value.isEmpty
                            ? "Ingresa tu contraseña"
                            : null,
                      ),

                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "¿Olvidaste tu clave?",
                            style: TextStyle(
                              color: kTealColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),

                      // BOTÓN INGRESAR
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kPeachColor,
                            foregroundColor: kWhiteColor,
                            elevation: 4,
                            shadowColor: kPeachColor.withValues(alpha: 0.4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onPressed: isLoading ? null : _onLogin,
                          child: isLoading
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                )
                              : const Text(
                                  "Iniciar Sesión",
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

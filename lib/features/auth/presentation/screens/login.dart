import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/widgets/login_background.dart';
import 'package:flutter_application_1/features/auth/presentation/widgets/animated_form_card.dart';
import 'package:flutter_application_1/features/auth/presentation/widgets/login_form_widgets.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

// Imports de lógica
import 'package:flutter_application_1/features/auth/domain/usecases/login_usecase.dart';
import 'package:flutter_application_1/core/theme/visual_utils.dart';
import 'package:flutter_application_1/core/theme/app_spacing.dart';
import 'package:flutter_application_1/core/theme/colors.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isPasswordHidden = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _onLogin() async {
    if (_isLoading || !_formKey.currentState!.validate()) return;

    final loginUseCase = context.read<LoginUseCase>();
    setState(() => _isLoading = true);

    try {
      await loginUseCase.execute(
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );
      if (!mounted) return;
      context.go('/home');
    } catch (e) {
      if (!mounted) return;
      final errorMessage = e.toString().contains('network')
          ? 'Sin conexión a internet'
          : 'Credenciales incorrectas';
      VisualUtils.mostrarErrorDialog(context, errorMessage);
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          const GradientBackground(),
          const BackgroundCircle(
            top: -50,
            right: -50,
            size: 200,
            opacity: 0.1,
            color: kWhiteColor,
          ),
          const BackgroundCircle(
            bottom: -60,
            left: -60,
            size: 180,
            opacity: 0.08,
            color: kWhiteColor,
          ),

          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: AnimatedFormCard(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const LogoSection(),
                      AppSpacing.h35,
                      EmailField(controller: _emailController),
                      AppSpacing.h18,
                      PasswordField(
                        controller: _passwordController,
                        isHidden: _isPasswordHidden,
                        onToggleVisibility: () => setState(
                          () => _isPasswordHidden = !_isPasswordHidden,
                        ),
                      ),
                      AppSpacing.h10,
                      const ForgotPasswordButton(),
                      AppSpacing.h25,
                      LoginButton(isLoading: _isLoading, onPressed: _onLogin),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const LoginBackButton(),
        ],
      ),
    );
  }
}

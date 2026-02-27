import 'package:flutter_application_1/core/routher/auth_notifier.dart';
import 'package:flutter_application_1/features/admin/presentation/admin_screens/admin_dashboard.dart';
import 'package:flutter_application_1/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:flutter_application_1/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:flutter_application_1/features/auth/presentation/screens/login.dart';
import 'package:flutter_application_1/features/auth/presentation/screens/register.dart';
import 'package:flutter_application_1/features/principal/principal_screens/principal.dart';
import 'package:flutter_application_1/features/usuario/presentation/screen_usuario_turista.dart';
import 'package:go_router/go_router.dart';

// 🔹 Importa tus pantallas reales aquí

GoRouter createRouter(
  GetCurrentUserUseCase getCurrentUserUseCase,
  AuthNotifier authNotifier,
) {
  return GoRouter(
    refreshListenable: authNotifier,
    initialLocation: '/',
    redirect: (context, state) async {
      final user = await getCurrentUserUseCase.execute();
      final location = state.fullPath;

      final isPublicRoute =
          location == '/' ||
          location == '/login' ||
          location == '/register' ||
          location == '/forgot-password';

      if (user == null) {
        return isPublicRoute ? null : '/login';
      }

      if (!user.activo) {
        return '/';
      }

      if (user.rol == 'admin') {
        if (location == '/' || location == '/home') {
          return '/admin';
        }
      }

      if (user.rol == 'prestador') {
        if (location == '/' || location == '/admin') {
          return '/home';
        }
      }

      return null;
    },

    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const PantallaPrincipal(),
      ),
      GoRoute(path: '/login', builder: (context, state) => const Login()),
      GoRoute(
        path: '/forgot-password',
        builder: (context, state) => ForgotPasswordScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const PantallaHomeAutenticada(),
      ),
      GoRoute(
        path: '/admin',
        builder: (context, state) => const AdminDashboard(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const Registrarse(),
      ),
    ],
  );
}

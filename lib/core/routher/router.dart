import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/admin/presentation/admin_screens/admin_dashboard.dart';
import 'package:flutter_application_1/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:flutter_application_1/features/auth/presentation/screens/login.dart';
import 'package:flutter_application_1/features/principal/principal_screens/principal.dart';
import 'package:flutter_application_1/features/usuario/presentation/screen_usuario.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../features/auth/domain/entities/user_entity.dart';

// 🔹 Importa tus pantallas reales aquí

GoRouter createRouter(BuildContext context) {
  final getCurrentUserUseCase = Provider.of<GetCurrentUserUseCase>(
    context,
    listen: false,
  );

  return GoRouter(
    initialLocation: '/',

    redirect: (context, state) async {
      final user = await getCurrentUserUseCase.execute();

      final isRoot = state.fullPath == '/';
      final isLogin = state.fullPath == '/login';
      final isAdminRoute = state.fullPath == '/admin';
      final isHomeRoute = state.fullPath == '/home';

      // 🔴 No autenticado
      if (user == null) {
        if (isRoot) return null; // Deja ver PantallaPrincipal
        return isLogin ? null : '/login';
      }

      // 🔴 Bloqueado
      if (!user.activo) {
        return '/login';
      }

      // 👑 Admin
      if (user.rol == 'admin') {
        if (isRoot || isHomeRoute) return '/admin';
        return null;
      }

      // 🧑‍💼 Prestador
      if (user.rol == 'prestador') {
        if (isRoot || isAdminRoute) return '/home';
        return null;
      }

      return null;
    },
    routes: [
      GoRoute(path: '/login', builder: (context, state) => const Login()),
      GoRoute(
        path: '/home',
        builder: (context, state) => const PantallaHomeAutenticada(),
      ),
      GoRoute(
        path: '/admin',
        builder: (context, state) => const AdminDashboard(),
      ),
      GoRoute(
        path: '/',
        builder: (context, state) => const PantallaPrincipal(),
      ),
    ],
  );
}

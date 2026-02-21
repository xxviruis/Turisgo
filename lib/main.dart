import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/routher/auth_notifier.dart';
import 'package:flutter_application_1/core/routher/router.dart';
import 'package:flutter_application_1/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:flutter_application_1/features/auth/domain/usecases/login_usecase.dart';
import 'package:flutter_application_1/features/auth/presentation/controllers/forgot_password_controller.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_application_1/l10n/generated/app_localizations.dart';

// AUTH
import 'features/auth/data/datasource/auth_dao.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';

// ADMIN
import 'features/auth/data/services/supabase_service_admin.dart';
import 'features/usuario/domain/usecases/admin/admin_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: "https://jssaanajelfxnjyjqceq.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Impzc2FhbmFqZWxmeG5qeWpxY2VxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjQxNDUwMzAsImV4cCI6MjA3OTcyMTAzMH0.FFR-5zZlIzGybC5cMrfpRn_RdgOjfNbM4h_IxWLEXws",
  );

  final supabaseClient = Supabase.instance.client;

  // 🔹 AUTH
  final authDAO = AuthDAO(supabaseClient);
  final authRepository = AuthRepositoryImpl(authDAO);
  final loginUseCase = LoginUseCase(authRepository);
  final getCurrentUserUseCase = GetCurrentUserUseCase(authRepository);

  runApp(
    MultiProvider(
      providers: [
        Provider<LoginUseCase>.value(value: loginUseCase),
        Provider<GetCurrentUserUseCase>.value(value: getCurrentUserUseCase),

        ChangeNotifierProvider(
          create: (_) => ForgotPasswordController(authRepository),
        ),

        ChangeNotifierProvider(
          create: (_) => AdminProvider(repository: SupabaseAdminService()),
        ),

        ChangeNotifierProvider(create: (_) => AuthNotifier()),
      ],
      child: const Principal(),
    ),
  );
}

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    final getCurrentUserUseCase = context.read<GetCurrentUserUseCase>();

    final authNotifier = context.read<AuthNotifier>();

    final router = createRouter(getCurrentUserUseCase, authNotifier);

    return MaterialApp.router(
      routerConfig: router,
      locale: const Locale('es'),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
    );
  }
}

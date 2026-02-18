import 'package:flutter/material.dart'; // 1. IMPORTANTE
import 'package:flutter_application_1/features/auth/data/services/supabase_service_admin.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_application_1/Screens/wrapped.dart';
import 'package:flutter_application_1/l10n/generated/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// Importa tus servicios y providers
import 'package:flutter_application_1/Logic/admin/admin_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: "https://jssaanajelfxnjyjqceq.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Impzc2FhbmFqZWxmeG5qeWpxY2VxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjQxNDUwMzAsImV4cCI6MjA3OTcyMTAzMH0.FFR-5zZlIzGybC5cMrfpRn_RdgOjfNbM4h_IxWLEXws", // Mantén tu key aquí
    authOptions: const FlutterAuthClientOptions(
      autoRefreshToken: true,
      authFlowType: AuthFlowType.pkce,
    ),
  );

  runApp(
    // 2. Envolvemos la app con MultiProvider (SOLID: Inyección de dependencias)
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AdminProvider(
            repository:
                (SupabaseAdminService()), // Le pasamos la implementación de Supabase
          ),
        ),
        // Aquí puedes añadir más providers en el futuro (UserProvider, etc.)
      ],
      child: const Principal(),
    ),
  );
}

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('es'),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: const WrapperScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

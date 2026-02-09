import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/wrapped.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_application_1/l10n/generated/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart'; // Añade esta línea

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: "https://jssaanajelfxnjyjqceq.supabase.co",
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...", // Tu clave completa
    authOptions: const FlutterAuthClientOptions(
      autoRefreshToken: true,
      authFlowType: AuthFlowType.pkce,
    ),
  );

  runApp(const Principal());
}

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('en'),
      // Configuración de idiomas (Delegados)
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // Idiomas que soporta TurisGo
      supportedLocales: AppLocalizations.supportedLocales,

      // Pantalla inicial
      home: const WrapperScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

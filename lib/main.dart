import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/wrapped.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 🔹 NECESARIO para español
  await initializeDateFormatting('es_ES', null);

  await Supabase.initialize(
    url: "https://jssaanajelfxnjyjqceq.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Impzc2FhbmFqZWxmeG5qeWpxY2VxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjQxNDUwMzAsImV4cCI6MjA3OTcyMTAzMH0.FFR-5zZlIzGybC5cMrfpRn_RdgOjfNbM4h_IxWLEXws",
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
      debugShowCheckedModeBanner: false,

      // 🔹 IDIOMA
      locale: const Locale('es', 'ES'),
      supportedLocales: const [
        Locale('es', 'ES'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      home: WrapperScreen(),
    );
  }
}

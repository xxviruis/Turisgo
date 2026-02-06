import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/wrapped.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: "https://jssaanajelfxnjyjqceq.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Impzc2FhbmFqZWxmeG5qeWpxY2VxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjQxNDUwMzAsImV4cCI6MjA3OTcyMTAzMH0.FFR-5zZlIzGybC5cMrfpRn_RdgOjfNbM4h_IxWLEXws",
    authOptions: const FlutterAuthClientOptions(
      autoRefreshToken: true,
      authFlowType: AuthFlowType.pkce, // importante para Web
    ),
  );

  runApp(const Principal());
}

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WrapperScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/negocio_admin/data/datasource/ciudad_supabase_datasource.dart';
import 'package:flutter_application_1/features/negocio_admin/data/datasource/negocio_supabase_datasource.dart';
import 'package:flutter_application_1/features/negocio_admin/data/repositories/ciudad_repository_impl.dart';
import 'package:flutter_application_1/features/negocio_admin/data/repositories/negocio_repository_impl.dart';
import 'package:flutter_application_1/features/negocio_admin/data/repositories/tipo_negocio_repository_impl.dart';
import 'package:flutter_application_1/features/negocio_admin/domain/usecases/crear_negocio_usecase.dart';
import 'package:flutter_application_1/features/negocio_admin/presentation/controller/registrar_negocio_controller.dart';
import 'package:flutter_application_1/features/negocio_admin/presentation/pages/registrar_negocio_page.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: "https://jssaanajelfxnjyjqceq.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Impzc2FhbmFqZWxmeG5qeWpxY2VxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjQxNDUwMzAsImV4cCI6MjA3OTcyMTAzMH0.FFR-5zZlIzGybC5cMrfpRn_RdgOjfNbM4h_IxWLEXws",
  );

  final supabaseClient = Supabase.instance.client;

  // Data sources
  final ciudadDatasource = CiudadSupabaseDataSource(supabaseClient);
  final negocioDatasource = NegocioSupabaseDataSource(supabaseClient);

  // Repositories
  final ciudadRepository = CiudadRepositoryImpl(ciudadDatasource);
  final negocioRepository = NegocioRepositoryImpl(negocioDatasource);
  final tipoNegocioRepository = TipoNegocioRepositoryImpl(
    negocioDatasource,
  ); // Si tiene datasource propio

  // UseCase
  final crearNegocioUseCase = CrearNegocioUseCase(negocioRepository);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => RegistrarNegocioController(
            crearNegocioUseCase,
            tipoNegocioRepository,
            ciudadRepository,
          ),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: RegistrarNegocioPage(),
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_spacing.dart';
import 'package:flutter_application_1/features/negocio_admin/presentation/widgets/amenidades_selector.dart';
import 'package:flutter_application_1/features/negocio_admin/presentation/widgets/ciudad_selector.dart';
import 'package:flutter_application_1/features/negocio_admin/presentation/widgets/tipo_negocio_selector.dart';
import 'package:provider/provider.dart';
import '../controller/registrar_negocio_controller.dart';
import '../widgets/header_registro.dart';
import '../widgets/progress_indicator_registro.dart';
import '../widgets/informacion_general_card.dart';
import '../widgets/multimedia_card.dart';
import '../widgets/operaciones_card.dart';
import '../widgets/bottom_actions.dart';
import '../../../../core/theme/colors.dart';

class RegistrarNegocioPage extends StatelessWidget {
  const RegistrarNegocioPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<RegistrarNegocioController>();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            const HeaderRegistro(),
            const ProgressIndicatorRegistro(progress: 0.3),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: const [
                      InformacionGeneralCard(),
                      AppSpacing.h16,
                      TipoNegocioSelector(),
                      AppSpacing.h16,
                      AmenidadesSelector(),
                      AppSpacing.h16,
                      MultimediaCard(),
                      OperacionesCard(),
                    ],
                  ),
                ),
              ),
            ),
            const BottomActions(),
          ],
        ),
      ),
    );
  }
}

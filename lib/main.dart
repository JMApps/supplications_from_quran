import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'core/strings/app_constraints.dart';
import 'data/repositories/supplication_data_repository.dart';
import 'data/services/database_service.dart';
import 'domain/usecases/supplication_use_case.dart';
import 'presentation/pages/root_page.dart';
import 'presentation/state/content_settings_state.dart';
import 'presentation/state/main_app_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DatabaseService databaseService = DatabaseService();
  await databaseService.initializeDatabase();

  await Hive.initFlutter();
  await Hive.openBox(AppConstraints.keyMainAppSettings);
  await Hive.openBox(AppConstraints.keyFavoriteSupplications);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MainAppState(
            SupplicationUseCase(
              SupplicationDataRepository(databaseService),
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => ContentSettingsState(),
        ),
      ],
      child: const RootPage(),
    ),
  );
}

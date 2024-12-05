import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'application/constraints/app_constraints.dart';
import 'application/state/content_settings_state.dart';
import 'application/state/main_app_state.dart';
import 'data/services/database_helper.dart';
import 'presentation/pages/root_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DatabaseService databaseHelper = DatabaseService();
  await databaseHelper.initializeDatabase();

  await Hive.initFlutter();
  await Hive.openBox(AppConstraints.keyMainAppSettings);
  await Hive.openBox(AppConstraints.keyFavoriteSupplications);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MainAppState(),
        ),
        ChangeNotifierProvider(
          create: (_) => ContentSettingsState(),
        ),
      ],
      child: const RootPage(),
    ),
  );
}

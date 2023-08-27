import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:supplications_from_quran/application/constraints/app_constraints.dart';
import 'package:supplications_from_quran/application/state/content_settings_state.dart';
import 'package:supplications_from_quran/application/state/main_app_state.dart';
import 'package:supplications_from_quran/data/services/database_helper.dart';
import 'package:supplications_from_quran/presentation/pages/root_page.dart';

void main() async {
  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
      ),
    );
  }
  WidgetsFlutterBinding.ensureInitialized();
  DatabaseHelper databaseHelper = DatabaseHelper();
  await databaseHelper.initializeDatabase();
  await Hive.initFlutter();
  await Hive.openBox(AppConstraints.keyMainAppSettings);
  await Hive.openBox(AppConstraints.keyFavoriteSupplicationIds);
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

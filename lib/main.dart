import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supplications_from_quran/provider/app_settings_state.dart';
import 'package:supplications_from_quran/provider/main_player_state.dart';

import 'router/app_router.dart';

void main() {
  var _appRouter = AppRouter();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MainPlayerState()),
        ChangeNotifierProvider(create: (_) => AppSettingsState()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Мольбы из Корана',
        initialRoute: '/',
        onGenerateRoute: _appRouter.onGeneratorRouter,
        theme: ThemeData(fontFamily: 'Gilroy'),
      ),
    ),
  );
}
import 'package:flutter/material.dart';
import 'package:supplications_from_quran/pages/main_content.dart';

import 'router/app_router.dart';

void main() {
  var _appRouter = AppRouter();
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Мольбы из Корана',
      initialRoute: '/',
      onGenerateRoute: _appRouter.onGeneratorRouter,
      theme: ThemeData(fontFamily: 'Gilroy'),
      home: MainContent()));
}
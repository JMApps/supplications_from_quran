import 'package:flutter/material.dart';
import 'package:supplications_from_quran/presentation/pages/main_page.dart';
import 'package:supplications_from_quran/until/route/app_route.dart';
import 'package:supplications_from_quran/until/theme/app_theme.dart';

class RootPage extends StatelessWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      onGenerateRoute: AppRoute().onGeneratorRoute,
      home: const MainPage(),
    );
  }
}

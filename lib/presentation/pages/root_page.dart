import 'package:flutter/material.dart';
import 'package:supplications_from_quran/application/strings/app_strings.dart';
import 'package:supplications_from_quran/application/themes/app_themes.dart';
import 'package:supplications_from_quran/presentation/pages/main_page.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      home: const MainPage(),
    );
  }
}

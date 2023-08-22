import 'package:flutter/material.dart';
import 'package:supplications_from_quran/application/strings/app_strings.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appName),
      ),
    );
  }
}

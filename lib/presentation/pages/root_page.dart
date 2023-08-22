import 'package:flutter/material.dart';
import 'package:supplications_from_quran/presentation/pages/main_page.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Мольбы из Корана',
      home: MainPage(),
    );
  }
}

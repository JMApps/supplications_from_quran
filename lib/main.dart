import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:supplications_from_quran/application/root_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(
    const RootPage(),
  );
}

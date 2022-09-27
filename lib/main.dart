import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:supplications_from_quran/application/root_page.dart';
import 'package:supplications_from_quran/until/constants.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  await Hive.initFlutter();
  await Hive.openBox(Constants.keyMainSettings);
  runApp(
    const RootPage(),
  );
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supplications_from_quran/pages/favorite_content.dart';
import 'package:supplications_from_quran/pages/main_content.dart';

class AppRouter {
  Route onGeneratorRouter(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MainContent());
      case '/favorite':
        return MaterialPageRoute(builder: (_) => FavoriteContent());
      default:
        throw Exception('Invalid route');
    }
  }
}

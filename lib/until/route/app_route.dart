import 'package:flutter/material.dart';
import 'package:supplications_from_quran/presentation/pages/favorite_page.dart';

class AppRoute {
  Route onGeneratorRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case 'favorite_page':
        return MaterialPageRoute(
          builder: (_) => const FavoritePage(),
        );
      default:
        throw Exception('Invalid route ${routeSettings.name}');
    }
  }
}

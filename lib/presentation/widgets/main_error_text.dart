import 'package:flutter/material.dart';

import '../../core/styles/app_styles.dart';

class MainErrorText extends StatelessWidget {
  const MainErrorText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: AppStyles.mainMarding,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18.0,
            color: Theme.of(context).colorScheme.error,
          ),
        ),
      ),
    );
  }
}

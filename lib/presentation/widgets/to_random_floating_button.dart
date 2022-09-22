import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supplications_from_quran/until/state/main_list_state.dart';
import 'package:supplications_from_quran/until/theme/app_theme.dart';

class ToRandomFloatingButton extends StatelessWidget {
  const ToRandomFloatingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).colorScheme.mainAccentColor,
      mini: true,
      elevation: 3,
      child: const Icon(
        CupertinoIcons.arrow_2_squarepath,
        color: Colors.white,
      ),
      onPressed: () {
        context.read<MainListState>().toRandomAyah();
      },
    );
  }
}

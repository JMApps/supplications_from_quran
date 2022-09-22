import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supplications_from_quran/until/theme/app_theme.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myColors = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          icon: CircleAvatar(
            radius: 25,
            backgroundColor: myColors.iconPrimaryColor,
            child: Icon(
              CupertinoIcons.doc_on_doc,
              color: myColors.mainPrimaryColor,
            ),
          ),
          onPressed: () {},
        ),
        IconButton(
          padding: EdgeInsets.zero,
          icon: CircleAvatar(
            radius: 25,
            backgroundColor: myColors.iconPrimaryColor,
            child: Icon(
              CupertinoIcons.share,
              color: myColors.mainPrimaryColor,
            ),
          ),
          onPressed: () {},
        ),
        IconButton(
          padding: EdgeInsets.zero,
          icon: CircleAvatar(
            radius: 25,
            backgroundColor: myColors.iconPrimaryColor,
            child: Icon(
              CupertinoIcons.photo,
              color: myColors.mainPrimaryColor,
            ),
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}

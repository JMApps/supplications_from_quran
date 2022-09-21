import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          splashRadius: 20,
          icon: const Icon(
            CupertinoIcons.doc_on_doc,
          ),
          onPressed: () {},
        ),
        IconButton(
          padding: EdgeInsets.zero,
          splashRadius: 20,
          icon: const Icon(
            CupertinoIcons.share,
          ),
          onPressed: () {},
        ),
        IconButton(
          padding: EdgeInsets.zero,
          splashRadius: 20,
          icon: const Icon(
            CupertinoIcons.photo,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}

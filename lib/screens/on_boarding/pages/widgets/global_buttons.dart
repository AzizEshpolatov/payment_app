import 'package:flutter/material.dart';
import 'package:my_utils/my_utils.dart';

class GlobalButtons extends StatelessWidget {
  const GlobalButtons({super.key, required this.title, required this.voidCallback});

  final String title;
  final VoidCallback voidCallback;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: voidCallback,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18.w,
          color: Colors.black,
        ),
      ),
    );
  }
}

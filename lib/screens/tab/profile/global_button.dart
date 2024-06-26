import 'package:flutter/material.dart';
import 'package:payment_app/utils/size/login_screen_size.dart';

import '../../../utils/colors/app_colors.dart';

class SaveButton extends StatelessWidget {
  const SaveButton(
      {super.key,
        required this.onTab,
        required this.loading,
        required this.active});

  final VoidCallback onTab;
  final bool loading;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20.wl, vertical: 8.hl),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: active ? Colors.blue : Colors.grey,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.wl)),
        ),
        onPressed: active ? onTab : null,
        child: Center(
          child: loading
              ? const CircularProgressIndicator.adaptive()
              : Text(
            "Save",
            style: TextStyle(
              color: AppColors.white,
              fontSize: 20.wl,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
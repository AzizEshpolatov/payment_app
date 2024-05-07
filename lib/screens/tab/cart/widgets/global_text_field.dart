import 'package:flutter/material.dart';
import '../../../../utils/colors/app_colors.dart';
import '../../../../utils/size/login_screen_size.dart';

class GlobalTextFormField extends StatelessWidget {
  const GlobalTextFormField({
    super.key,
    required this.labelText,
    required this.prefixIconPath,
    required this.controller,
    required this.typeText,
    required this.len,
  });

  final String labelText;
  final Icon prefixIconPath;
  final TextEditingController controller;
  final TextInputType typeText;
  final int len;

  @override
  Widget build(BuildContext context) {
    heightLogin = MediaQuery.of(context).size.height;
    widthLogin = MediaQuery.of(context).size.width;

    return TextFormField(
      keyboardType: typeText,
      controller: controller,
      maxLength: len,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9.wl),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9.wl),
          borderSide: BorderSide(
            width: 1.wl,
            color: AppColors.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9.wl),
          borderSide: BorderSide(
            width: 1.wl,
            color: AppColors.red,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9.wl),
          borderSide: BorderSide(
            width: 1.wl,
            color: AppColors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9.wl),
          borderSide: BorderSide(
            width: 1.wl,
            color: AppColors.red,
          ),
        ),
        contentPadding: EdgeInsets.zero,
        labelText: labelText,
        labelStyle: TextStyle(
          fontSize: 13.wl,
          color: AppColors.grey,
          fontWeight: FontWeight.w400,
        ),
        prefixIcon: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 12.wl,
              vertical: 12.hl,
            ),
            child: prefixIconPath),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your username';
        }
        RegExp regex = RegExp(r'^[a-zA-Z0-9_]+$');
        if (!regex.hasMatch(value)) {
          return 'Invalid username format';
        }
        return null;
      },
    );
  }
}

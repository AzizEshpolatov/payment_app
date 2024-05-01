import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../utils/colors/app_colors.dart';
import '../../../../utils/size/login_screen_size.dart';

class GlobalTextFormField extends StatelessWidget {
  const GlobalTextFormField({
    super.key,
    required this.hintText,
    required this.prefixIconPath,
    this.suffixIconPath,
    required this.controller,
    required this.typeText,
    required this.obscureText,
    this.onTap,
  });

  final String hintText;
  final String prefixIconPath;
  final String? suffixIconPath;
  final TextEditingController controller;
  final TextInputType typeText;
  final bool obscureText;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    heightLogin = MediaQuery.of(context).size.height;
    widthLogin = MediaQuery.of(context).size.width;

    return Container(
      height: 42.hl,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9.wl),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 3.hl),
            blurRadius: 3.hl,
            color: AppColors.black.withOpacity(.25),
          ),
        ],
      ),
      child: TextFormField(
        obscureText: obscureText,
        controller: controller,
        keyboardType: typeText,
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
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 13.wl,
            color: AppColors.c131212,
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 12.wl,
              vertical: 12.hl,
            ),
            child: SvgPicture.asset(
              prefixIconPath,
              width: 17.wl,
              colorFilter: const ColorFilter.mode(
                AppColors.c1317DD,
                BlendMode.srcIn,
              ),
            ),
          ),
          suffixIcon: GestureDetector(
            onTap: onTap,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12.wl,
                vertical: 12.hl,
              ),
              child: suffixIconPath != null
                  ? SizedBox(
                child: !obscureText
                    ? SvgPicture.asset(
                  suffixIconPath!,
                  width: 17.wl,
                  colorFilter: const ColorFilter.mode(
                    AppColors.c1317DD,
                    BlendMode.srcIn,
                  ),
                )
                    : const Icon(
                  Icons.visibility_off_sharp,
                  color: AppColors.c1317DD,
                ),
              )
                  : const SizedBox(),
            ),
          ),
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
      ),
    );
  }
}

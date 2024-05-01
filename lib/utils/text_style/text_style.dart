import 'package:flutter/material.dart';
import '../colors/app_colors.dart';

abstract class AppStyle {
  static const TextStyle splashWelcome = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: AppColors.splashWelcome,
  );
  static const TextStyle loginAccountStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: AppColors.loginAccountColor);
  static const TextStyle loginIn = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: AppColors.loginInColor,
  );
  static const TextStyle hintTextStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: AppColors.hintTextColor,
  );
  static const TextStyle elevatedButtonStyle = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w900,
    color: AppColors.elevatedButtonColor,
  );
  static const TextStyle telegramGroup = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: AppColors.telegramGroupColor,
  );
  static const TextStyle editProfileText = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.editProfile,
  );
  static const TextStyle profileName = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.editProfile,
  );
  static const TextStyle profileContainer = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.editProfile,
  );
}

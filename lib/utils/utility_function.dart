import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payment_app/utils/size/login_screen_size.dart';

import 'colors/app_colors.dart';

SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
  statusBarColor: AppColors.transparent,
  statusBarBrightness: Brightness.dark,
  statusBarIconBrightness: Brightness.dark,
);

void methodPrint(dynamic data) {
  debugPrint("\$\$\$\$\$\$\n$data\n\$\$\$\$\$\$");
}

showSnackBar({
  required BuildContext context,
  required String message,
  Color? color,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color ?? Colors.blue,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(
            16,
          ),
          topLeft: Radius.circular(
            16,
          ),
        ),
      ),
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20.wl,
          color: Colors.black,
        ),
      ),
    ),
  );
}

showErrorForRegister(
    String code,
    BuildContext context,
    ) {
  if (code == 'weak-password') {
    debugPrint('The password provided is too weak.');
    if (!context.mounted) return;
    showSnackBar(
      color: Colors.red,
      context: context,
      message: "Passwordni xato kiritdingiz!!!",
    );
  } else if (code == 'email-already-in-use') {
    debugPrint('The account already exists for that email.');
    if (!context.mounted) return;
    showSnackBar(
      color: Colors.red,
      context: context,
      message: "Bu e-pochta uchun hisob allaqachon mavjud!!!",
    );
  }
}

showErrorForLogin(
    String code,
    BuildContext context,
    ) {
  if (code == 'wrong-password') {
    debugPrint('The password provided is wrong.');
    if (!context.mounted) return;
    showSnackBar(
      color: Colors.red,
      context: context,
      message: "Passwordni xato kiritdingiz!!!",
    );
  } else if (code == 'invalid-email') {
    debugPrint('The e-mail is invalid!!!');
    if (!context.mounted) return;
    showSnackBar(
      color: Colors.red,
      context: context,
      message: "Bu e-pochta yaqroqsiz!!!",
    );
  } else if (code == 'user-disabled') {
    debugPrint('The user is blocked.');
    if (!context.mounted) return;
    showSnackBar(
      color: Colors.red,
      context: context,
      message: "Foydalanuvchi bloklangan!!!",
    );
  } else if (code == "user not found") {
    debugPrint('The user is not found.');
    if (!context.mounted) return;
    showSnackBar(
      color: Colors.red,
      context: context,
      message: "Foydalanuvchi topilmadi!!!",
    );
  } else {
    debugPrint('The user is not found.');
    if (!context.mounted) return;
    showSnackBar(
      color: Colors.red,
      context: context,
      message: "Noma'lum xatolik!!!",
    );
  }
}
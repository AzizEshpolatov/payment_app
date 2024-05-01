import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment_app/utils/size/login_screen_size.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../../../utils/app_icon/app_icons.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.voidCallback});

  final VoidCallback voidCallback;

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: voidCallback,
      child: Container(
        width: widthLogin,
        margin: EdgeInsets.symmetric(horizontal: 12.wl),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22.wl),
          color: Colors.grey,
        ),
        child: Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              margin: EdgeInsets.symmetric(horizontal: 15.wl),
              padding: EdgeInsets.symmetric(horizontal: 10.wl, vertical: 13.hl),
              child: SvgPicture.asset(
                AppIcons.googleIcon,
                width: 24,
              ),
            ),
            10.getWL(),
            Text(
              "Google",
              style: TextStyle(
                fontSize: 16.wl,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

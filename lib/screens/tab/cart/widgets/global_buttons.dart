import 'package:flutter/material.dart';
import 'package:payment_app/utils/size/login_screen_size.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class GlobalButtons extends StatelessWidget {
  const GlobalButtons({
    super.key,
    required this.icons,
    required this.voidCallback,
    required this.title,
  });

  final Icon icons;
  final VoidCallback voidCallback;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ZoomTapAnimation(
          onTap: voidCallback,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.wl, vertical: 15.hl),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.wl),
              color: Colors.deepPurple,
            ),
            child: icons,
          ),
        ),
        3.getHL(),
        Text(
          title,
          style: TextStyle(
            fontSize: 14.wl,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}



import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_utils/my_utils.dart';
import 'package:payment_app/utils/size/login_screen_size.dart';

import '../../../../utils/colors/app_colors.dart';

class RowItems extends StatelessWidget {
  const RowItems(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap});

  final String title;
  final String icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: const Color(0xFF23265A),
            padding: EdgeInsets.symmetric(
              horizontal: 14.w,
              vertical: 21.h,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: onTap,
          child: SvgPicture.asset(icon),
        ),
        12.getHL(),
        Text(
          title,
          style: TextStyle(
            color: AppColors.white,
            fontSize: 12.w,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

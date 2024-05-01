import 'package:flutter/material.dart';

import '../../../../utils/colors/app_colors.dart';
import '../../../../utils/size/login_screen_size.dart';

class GlobalButtonNews extends StatefulWidget {
  const GlobalButtonNews({
    super.key,
    required this.titleOne,
    required this.titleTwo,
    required this.onTap,
  });

  final String titleOne;
  final String titleTwo;
  final VoidCallback onTap;

  @override
  State<GlobalButtonNews> createState() => _GlobalButtonNewsState();
}

class _GlobalButtonNewsState extends State<GlobalButtonNews> {
  @override
  Widget build(BuildContext context) {
    heightLogin = MediaQuery.of(context).size.height;
    widthLogin = MediaQuery.of(context).size.width;

    return IconButton(
      onPressed: widget.onTap,
      icon: RichText(
        text: TextSpan(
          text: widget.titleOne,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: AppColors.c131212,
            fontSize: 12.wl,
          ),
          children: <TextSpan>[
            TextSpan(
              text: widget.titleTwo,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: AppColors.c1317DD,
                fontSize: 12.wl,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

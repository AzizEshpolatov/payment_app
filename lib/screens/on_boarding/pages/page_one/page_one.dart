import 'package:flutter/material.dart';
import 'package:my_utils/my_utils.dart';
import 'package:payment_app/utils/app_img/app_img.dart';

class BoardingPageOne extends StatelessWidget {
  const BoardingPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        children: [
          SizedBox(height: 80.h),
          Center(child: Image.asset(AppImages.img)),
          SizedBox(height: 50.h),
          Text(
            "The right relationship is everything.",
            style: TextStyle(
              fontSize: 30.w,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 25.h),
          Text(
            "Your Trusted Partner in Financial Success",
            style: TextStyle(
              fontSize: 14.w,
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

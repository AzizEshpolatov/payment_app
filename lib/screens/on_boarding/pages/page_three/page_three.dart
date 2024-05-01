import 'package:flutter/material.dart';
import 'package:my_utils/my_utils.dart';
import '../../../../utils/app_img/app_img.dart';

class BoardingPageThree extends StatelessWidget {
  const BoardingPageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        children: [
          SizedBox(height: 80.h),
          Center(child: Image.asset(AppImages.imgTwo)),
          SizedBox(height: 50.h),
          Text(
            "Your Comprehensive Resource for Financial Success",
            style: TextStyle(
              fontSize: 25.w,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 25.h),
          Text(
            "Choosing the Right Bank for Your Financial Goals",
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

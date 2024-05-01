import 'package:flutter/material.dart';
import 'package:my_utils/my_utils.dart';
import '../../../../utils/app_img/app_img.dart';

class BoardingPageTwo extends StatelessWidget {
  const BoardingPageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        children: [
          SizedBox(height: 80.h),
          Center(child: Image.asset(AppImages.imgOne)),
          SizedBox(height: 50.h),
          Text(
            "Your Financial Partner for Life: Citibank",
            style: TextStyle(
              fontSize: 30.w,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 25.h),
          Text(
            "Where Your Financial Goals Become Reality",
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

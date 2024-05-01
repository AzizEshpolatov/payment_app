import 'package:flutter/material.dart';
import 'package:my_utils/my_utils.dart';
import 'package:payment_app/screens/on_boarding/pages/page_one/page_one.dart';
import 'package:payment_app/screens/on_boarding/pages/page_three/page_three.dart';
import 'package:payment_app/screens/on_boarding/pages/page_two/page_two.dart';
import 'package:payment_app/screens/on_boarding/pages/widgets/global_buttons.dart';
import '../../data/local/storage_repo.dart';
import '../routes.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController controller = PageController();
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 50),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GlobalButtons(
                  title: "BACK",
                  voidCallback: () {
                    if (activeIndex > 0) {
                      activeIndex -= 1;
                      controller.animateToPage(
                        activeIndex,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.linear,
                      );
                    }
                  },
                ),
                GlobalButtons(
                  title: "SKIP",
                  voidCallback: () {
                    StorageRepository.setBool(
                      key: "is_new_user",
                      value: true,
                    ).then(
                      (value) {
                        Navigator.pushReplacementNamed(
                            context, RouteNames.loginRoute);
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              controller: controller,
              onPageChanged: (index) {},
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                BoardingPageOne(),
                BoardingPageTwo(),
                BoardingPageThree(),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              if (activeIndex == 2) {
                StorageRepository.setBool(
                  key: "is_new_user",
                  value: true,
                ).then(
                  (value) {
                    Navigator.pushReplacementNamed(
                      context,
                      RouteNames.loginRoute,
                    );
                  },
                );
              } else {
                activeIndex += 1;
                controller.animateToPage(
                  activeIndex,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.linear,
                );
              }
            },
            child: Container(
              width: width,
              padding: EdgeInsets.symmetric(vertical: 15.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13.w),
                color: Colors.blue,
              ),
              child: Center(
                child: Text(
                  "Next page",
                  style: TextStyle(
                    fontSize: 17.w,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

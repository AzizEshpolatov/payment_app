import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../data/local/storage_repo.dart';
import '../../utils/colors/app_colors.dart';
import '../routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _init() async {
    await Future.delayed(
      const Duration(seconds: 4),
    );
    if (!mounted) return;

    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      bool isNewUser = StorageRepository.getBool(key: "is_new_user");
      if (isNewUser) {
        Navigator.pushReplacementNamed(context, RouteNames.loginRoute);
      } else {
        Navigator.pushReplacementNamed(context, RouteNames.onBoardingRoute);
      }
    } else {
      Navigator.pushReplacementNamed(context, RouteNames.tabRoute);
    }
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/lottie/splash_lottie.json'),
            const SizedBox(height: 30),
            const Text(
              'Welcome',
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

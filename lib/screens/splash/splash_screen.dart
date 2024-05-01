import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:payment_app/blocs/auth/auth_bloc.dart';
import 'package:payment_app/blocs/auth/auth_state.dart';
import 'package:payment_app/data/models/form_status.dart';
import '../../data/local/storage_repo.dart';
import '../../utils/colors/app_colors.dart';
import '../routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _init(bool isAuthenticated) async {
    await Future.delayed(
      const Duration(seconds: 4),
    );
    if (!mounted) return;

    if (isAuthenticated == false) {
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.formStatus == FormStatus.authenticated) {
            _init(true);
          } else {
            _init(false);
          }
        },
        child: Center(
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
      ),
    );
  }
}

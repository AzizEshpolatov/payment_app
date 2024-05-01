import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_utils/my_utils.dart';
import 'package:payment_app/screens/auth/login/widgets/global_button.dart';
import 'package:payment_app/screens/auth/login/widgets/global_text_field.dart';
import 'package:payment_app/screens/auth/login/widgets/login_global_button_news.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../../utils/app_icon/app_icons.dart';
import '../../../utils/app_img/app_img.dart';
import '../../../utils/colors/app_colors.dart';
import '../../../utils/size/login_screen_size.dart';
import '../../routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscureText = false;

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    heightLogin = MediaQuery.of(context).size.height;
    widthLogin = MediaQuery.of(context).size.width;

    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.white,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 35.wl),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(AppImages.loginImage),
                17.getHL(),
                Text(
                  "Login",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 23.wl,
                    color: AppColors.black,
                  ),
                ),
                17.getHL(),
                GlobalTextFormField(
                  hintText: "Login",
                  prefixIconPath: AppIcons.messageIcon,
                  controller: usernameController,
                  typeText: TextInputType.text,
                  obscureText: false,
                ),
                7.getHL(),
                GlobalTextFormField(
                  hintText: "Password",
                  prefixIconPath: AppIcons.lockIcon,
                  suffixIconPath: AppIcons.eyeIcon,
                  controller: passwordController,
                  typeText: TextInputType.text,
                  onTap: () {
                    obscureText = !obscureText;
                    setState(() {});
                  },
                  obscureText: obscureText,
                ),
                14.getHL(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Remember Me",
                      style: TextStyle(
                        fontSize: 14.wl,
                        fontWeight: FontWeight.w400,
                        color: AppColors.c131212.withOpacity(0.8),
                      ),
                    ),
                    Text(
                      "Forgot Password?",
                      style: TextStyle(
                        fontSize: 14.wl,
                        fontWeight: FontWeight.w400,
                        color: AppColors.c131212.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
                25.getHL(),
                GlobalButton(
                  text: "Login",
                  onTap: () {},
                ),
                14.getHL(),
                Text(
                  "OR",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: AppColors.c131212,
                    fontSize: 14.wl,
                  ),
                ),
                7.getHL(),
                Text(
                  "Log in with",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: AppColors.c131212,
                    fontSize: 14.wl,
                  ),
                ),
                10.getHL(),
                ZoomTapAnimation(
                  onTap: () {},
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
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.wl, vertical: 13.hl),
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
                ),
                20.getHL(),
                GlobalButtonNews(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RouteNames.registerRoute,
                    );
                  },
                  titleOne: "Don’t have an account? ",
                  titleTwo: "Register now",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

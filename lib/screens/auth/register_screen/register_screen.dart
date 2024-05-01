import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/blocs/auth/auth_bloc.dart';
import 'package:payment_app/blocs/auth/auth_event.dart';
import 'package:payment_app/blocs/auth/auth_state.dart';
import 'package:payment_app/data/models/user_model.dart';
import 'package:payment_app/screens/auth/register_screen/widgets/global_button.dart';
import 'package:payment_app/screens/auth/register_screen/widgets/global_text_field.dart';
import '../../../data/models/form_status.dart';
import '../../../utils/app_icon/app_icons.dart';
import '../../../utils/app_img/app_img.dart';
import '../../../utils/colors/app_colors.dart';
import '../../../utils/size/login_screen_size.dart';
import '../../routes.dart';
import '../register_screen/widgets/register_global_button_news.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  bool obscureText = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
        body: BlocConsumer<AuthBloc, AuthState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 35.wl),
                child: Form(
                  key: _formKey,
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        15.getHL(),
                        Image.asset(AppImages.registerImage),
                        25.getHL(),
                        Text(
                          "Sign Up",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 23.wl,
                            color: AppColors.black,
                          ),
                        ),
                        15.getHL(),
                        GlobalTextFormField(
                          hintText: "First Name",
                          prefixIconPath: AppIcons.personIcon,
                          controller: firstNameController,
                          typeText: TextInputType.text,
                          obscureText: false,
                        ),
                        7.getHL(),
                        GlobalTextFormField(
                          hintText: "Last Name",
                          prefixIconPath: AppIcons.personIcon,
                          controller: lastNameController,
                          typeText: TextInputType.text,
                          obscureText: false,
                        ),
                        7.getHL(),
                        GlobalTextFormField(
                          hintText: "Email",
                          prefixIconPath: AppIcons.messageIcon,
                          controller: emailController,
                          typeText: TextInputType.text,
                          obscureText: false,
                        ),
                        7.getHL(),
                        GlobalTextFormField(
                          hintText: "Password",
                          prefixIconPath: AppIcons.lockIcon,
                          controller: passwordController,
                          typeText: TextInputType.text,
                          suffixIconPath: AppIcons.eyeIcon,
                          obscureText: obscureText,
                          onTap: () {
                            obscureText = !obscureText;
                            setState(() {});
                          },
                        ),
                        7.getHL(),
                        GlobalTextFormField(
                          hintText: "Confirm Password",
                          prefixIconPath: AppIcons.lockIcon,
                          controller: confirmController,
                          typeText: TextInputType.text,
                          suffixIconPath: AppIcons.eyeIcon,
                          obscureText: obscureText,
                          onTap: () {
                            obscureText = !obscureText;
                            setState(() {});
                          },
                        ),
                        32.getHL(),
                        RegisterGlobalButton(
                          onTap: () {
                            context.read<AuthBloc>().add(
                                  RegisterUserEvent(
                                    userModel: UserModel(
                                      username: firstNameController.text,
                                      lastname: lastNameController.text,
                                      password: passwordController.text,
                                      userId: "",
                                      imageUrl: '',
                                      phoneNumber: passwordController.text,
                                      email: emailController.text,
                                    ),
                                  ),
                                );
                          },
                          text: "Sign Up",
                        ),
                        22.getHL(),
                        GlobalButtonNews(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          titleOne: "Already have an account? ",
                          titleTwo: "Login",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          listener: (context, state) {
            if (state.formStatus == FormStatus.error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMessage)),
              );
            }
            if (state.formStatus == FormStatus.authenticated) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                RouteNames.tabRoute,
                (route) => false,
              );
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }
}

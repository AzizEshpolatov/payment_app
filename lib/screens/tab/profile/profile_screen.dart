import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_utils/my_utils.dart';
import 'package:payment_app/blocs/auth/auth_bloc.dart';
import 'package:payment_app/blocs/auth/auth_event.dart';
import 'package:payment_app/blocs/user_profile/user_profile_bloc.dart';
import 'package:payment_app/utils/size/login_screen_size.dart';
import '../../../utils/colors/app_colors.dart';
import '../../routes.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteNames.updateUser,
                  arguments: context.read<UserProfileBloc>().state.userModel);
            },
            icon: Icon(
              Icons.settings,
              size: 24.wl,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, RouteNames.loginRoute, (route) => false);
              context.read<AuthBloc>().add(LogOutUserEvent());
            },
            icon: Icon(
              Icons.exit_to_app,
              size: 24.wl,
            ),
          ),
        ],
      ),
      body: BlocBuilder<UserProfileBloc, UserProfileState>(
        builder: (BuildContext context, UserProfileState state) {
          debugPrint('============|${state.userModel.username}|============');
          debugPrint('============|${state.userModel.lastname}|============');
          debugPrint('============|${state.userModel.password}|============');
          debugPrint(
              '============|${state.userModel.phoneNumber}|============');
          debugPrint('============|${state.userModel.email}|============');
          debugPrint('============|${state.userModel.userId}|============');
          debugPrint('============|${state.userModel.imageUrl}|============');
          return Column(
            children: [
              SizedBox(height: 20.wl),
              Align(
                alignment: Alignment.center,
                child: state.userModel.imageUrl.isNotEmpty
                    ? Container(
                        height: 100.hl,
                        width: 100.wl,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: CircleAvatar(
                          radius: 60.wl,
                          backgroundImage:
                              NetworkImage(state.userModel.imageUrl),
                          backgroundColor: Colors.transparent,
                        ),
                      )
                    : Container(
                        height: 100.hl,
                        width: 100.wl,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.grey),
                        child: Icon(
                          Icons.person,
                          color: Colors.black,
                          size: 80.wl,
                        ),
                      ),
              ),
              SizedBox(height: 10.hl),
              Text(
                state.userModel.lastname,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.wl,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 20.hl),
              Expanded(
                child: Container(
                  padding:
                      EdgeInsets.only(left: 10.wl, right: 10.wl, top: 30.hl),
                  decoration: const BoxDecoration(color: Colors.white),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(width: double.infinity),
                        Text(
                          "Email: ${state.userModel.email}",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18.wl,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 10.hl),
                        Text(
                          "Last name: ${state.userModel.lastname}",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18.wl,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 10.hl),
                        Text(
                          "First name: ${state.userModel.username}",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18.wl,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 10.hl),
                        Text(
                          "Phone number: ${state.userModel.phoneNumber}",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18.wl,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        150.getHL(),
                        InkWell(onTap: (){
                          Navigator.pushNamed(context,RouteNames.securityRoute);
                        },
                          child: Container(
                            width: width,
                            padding: EdgeInsets.symmetric(horizontal:8.w,vertical:4.w),
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(width: 3.w,color: AppColors.black.withOpacity(0.4))
                            ),
                            child:Text(
                              "Security",
                              textAlign: TextAlign.center,
                              style: TextStyle
                                  (color: AppColors.black, fontSize: 24.w),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

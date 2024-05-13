import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:payment_app/blocs/cards/cards_bloc.dart';
import 'package:payment_app/blocs/cards/cards_state.dart';
import 'package:payment_app/screens/tab/cart/add_cards.dart';
import 'package:payment_app/screens/tab/cart/widgets/row_items.dart';
import 'package:payment_app/utils/size/size.dart';

import '../../../blocs/cards/cards_event.dart';
import '../../../blocs/user_profile/user_profile_bloc.dart';
import '../../../utils/app_img/app_img.dart';
import '../../../utils/colors/app_colors.dart';
import '../../transaction/transaction_screen.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  void initState() {
    context.read<CardsBloc>().add(GetCardsByUserIdEvent(
        userId: context.read<UserProfileBloc>().state.userModel.userId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF121433),
      body: BlocBuilder<CardsBloc, CardsState>(
        builder: (context, state) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                84.getH(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Text(
                    "Your Card",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 20.w,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                24.getH(),
                SizedBox(
                  height: 200.h,
                  child: PageView(
                    children: [
                      ...List.generate(
                        state.userCards.length,
                        (index) => Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(16),
                            onLongPress: () {
                              context.read<CardsBloc>().add(DeleteCardEvent(
                                  state.userCards[index].cardId));
                            },
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const TransactionScreen(),
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15.w, vertical: 10.h),
                              height: 100,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Color(
                                  int.parse(
                                      "0xFF${state.userCards[index].color}"),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "VISA",
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 36.w,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "Platinum",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.w,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    state.userCards[index].cardNumber,
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 24.w,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AddCards(),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 15.w,
                              vertical: 10.h,
                            ),
                            height: 100,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: AppColors.white,
                            ),
                            child: const Icon(
                              Icons.add,
                              size: 128,
                              color: Color(0xFF121433),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                40.getH(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RowItems(
                        title: "Sent",
                        icon: AppImages.arrowTop,
                        onTap: () {},
                      ),
                      RowItems(
                        title: "Receive",
                        icon: AppImages.arrowBottom,
                        onTap: () {},
                      ),
                      RowItems(
                        title: "Topup",
                        icon: AppImages.topup,
                        onTap: () {},
                      ),
                      RowItems(
                        title: "Payment",
                        icon: AppImages.payment,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                22.getH(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Recent Activities",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 20.w,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(AppImages.arrowRight),
                      ),
                    ],
                  ),
                ),
                24.getH(),
                ListTile(
                  onTap: () {},
                  leading: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 11.w,
                      vertical: 11.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 11.w,
                        vertical: 11.h,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF23265A),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SvgPicture.asset(AppImages.listtile),
                    ),
                  ),
                  title: Text(
                    "Food",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 16.w,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  subtitle: Text(
                    "15 Oct 2020",
                    style: TextStyle(
                      color: const Color(0xFFD9D9D9),
                      fontSize: 8.w,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  trailing: Text(
                    "- \$ 40,00",
                    style: TextStyle(
                      color: const Color(0xFFC7C7C7),
                      fontSize: 16.w,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/blocs/cards/cards_bloc.dart';
import 'package:payment_app/blocs/cards/cards_event.dart';
import 'package:payment_app/blocs/cards/cards_state.dart';
import 'package:payment_app/blocs/user_profile/user_profile_bloc.dart';
import 'package:payment_app/screens/routes.dart';
import 'package:payment_app/screens/tab/cart/widgets/global_buttons.dart';
import 'package:payment_app/utils/colors/app_colors.dart';
import 'package:payment_app/utils/size/login_screen_size.dart';

double wd = 0;

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  void initState() {
    debugPrint(
        '---------- ${context.read<UserProfileBloc>().state.userModel.userId} -----------');

    Future.microtask(() => {
          context.read<CardsBloc>().add(GetCardsByUserIdEvent(
              userId: context.read<UserProfileBloc>().state.userModel.userId)),
          context.read<CardsBloc>().add(GetCardsDatabaseEvent()),
        });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    wd = MediaQuery.of(context).size.width;
    debugPrint('=========== $wd ============');
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          "Bank Banktut",
          style: TextStyle(
            fontSize: 18.wl,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteNames.addCards);
            },
            icon: const Icon(Icons.add, color: Colors.black),
          ),
        ],
      ),
      body: BlocBuilder<CardsBloc, CardsState>(
        builder: (context, state) {
          if (state.userCards.isEmpty) {
            return Center(
                child: Icon(Icons.insert_emoticon_sharp, size: 150.wl));
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.getHL(),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    state.userCards.length,
                    (index) => Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 15.wl, vertical: 8.hl),
                      width: 280.wl,
                      padding: EdgeInsets.symmetric(
                          vertical: 15.hl, horizontal: 15.wl),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.wl),
                        color: state.userCards[index].color != ''
                            ? Color(int.parse(
                                "0xff${state.userCards[index].color}"))
                            : Colors.blue,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4.wl,
                            color: Colors.black.withOpacity(.8),
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          state.userCards[index].type == 1
                              ? Image.network(
                                  "https://humocard.uz/upload/medialibrary/208/8x0p9hi3h9jww0flwdm92dayhn0flulj/humo-logo-more.png",
                                  fit: BoxFit.cover,
                                  width: 40.wl,
                                  height: 30.hl,
                                )
                              : const SizedBox(),
                          10.getHL(),
                          Text(
                            state.userCards[index].cardNumber,
                            style: TextStyle(
                              fontSize: 18.wl,
                              color: Colors.white,
                            ),
                          ),
                          10.getHL(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Name",
                                    style: TextStyle(
                                      fontSize: 12.wl,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    state.userCards[index].cardHolder,
                                    style: TextStyle(
                                      fontSize: 18.wl,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "Valid Till",
                                    style: TextStyle(
                                      fontSize: 12.wl,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    state.userCards[index].expireDate,
                                    style: TextStyle(
                                      fontSize: 18.wl,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              10.getHL(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                    state.userCards.length,
                    (index) => Container(
                      height: 8.hl,
                      width: 8.wl,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              10.getHL(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.wl),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GlobalButtons(
                      icons: const Icon(
                        Icons.arrow_upward,
                        color: Colors.red,
                        size: 30,
                      ),
                      voidCallback: () {},
                      title: 'Sent',
                    ),
                    GlobalButtons(
                      icons: const Icon(
                        Icons.arrow_downward_rounded,
                        color: Colors.green,
                        size: 30,
                      ),
                      voidCallback: () {},
                      title: 'Receive',
                    ),
                    GlobalButtons(
                      icons: const Icon(
                        Icons.forward_5,
                        color: Colors.white,
                        size: 30,
                      ),
                      voidCallback: () {},
                      title: 'Top up',
                    ),
                    GlobalButtons(
                      icons: const Icon(
                        Icons.qr_code,
                        color: Colors.white,
                        size: 30,
                      ),
                      voidCallback: () {},
                      title: 'Payment',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 7.wl),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "  Recent Activities",
                      style: TextStyle(
                        fontSize: 22.wl,
                        color: Colors.black,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

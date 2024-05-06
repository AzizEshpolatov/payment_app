import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_utils/my_utils.dart';
import 'package:payment_app/blocs/cards/cards_bloc.dart';
import 'package:payment_app/blocs/cards/cards_state.dart';
import 'package:payment_app/utils/size/login_screen_size.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            onPressed: () {},
            icon: const Icon(Icons.notifications, color: Colors.black),
          ),
        ],
      ),
      body: BlocBuilder<CardsBloc, CardsState>(
        builder: (context, state) {
          return ListView(
            children: List.generate(
              state.userCards.length,
              (index) => Container(
                width: width,
                height: 100,
                color: Colors.black,
              ),
            ),
          );
        },
      ),
    );
  }
}

/*
return Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.wl),
            child: Column(
              children: [
                20.getHL(),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                        state.userCardsDB.length,
                        (index) => Container(
                          width: width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.w),
                            color: Color(int.parse(
                                "0xff${state.userCardsDB[index].color}")),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.w, vertical: 15.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.userCardsDB[index].cardHolder,
                                style: TextStyle(
                                  fontSize: 18.w,
                                  color: Colors.black,
                                ),
                              ),
                              10.getHL(),
                              Text(
                                state.userCards[index].cardNumber,
                                style: TextStyle(
                                  fontSize: 18.w,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
 */

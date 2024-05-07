import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/blocs/cards/cards_bloc.dart';
import 'package:payment_app/blocs/cards/cards_event.dart';
import 'package:payment_app/blocs/cards/cards_state.dart';
import 'package:payment_app/data/models/card_model.dart';
import 'package:payment_app/screens/tab/cart/widgets/global_text_field.dart';
import 'package:payment_app/utils/size/login_screen_size.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../blocs/user_profile/user_profile_bloc.dart';
import '../profile/global_button.dart';

class AddCards extends StatefulWidget {
  const AddCards({super.key});

  @override
  State<AddCards> createState() => _AddCardsState();
}

class _AddCardsState extends State<AddCards> {
  TextEditingController cardNumber = TextEditingController();
  TextEditingController expireDate = TextEditingController();
  TextEditingController cvc = TextEditingController();
  String cardColor = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Cards",
          style: TextStyle(
            fontSize: 18.wl,
            color: Colors.black,
          ),
        ),
      ),
      body: BlocConsumer<CardsBloc, CardsState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.wl),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GlobalTextFormField(
                  labelText: 'card number',
                  prefixIconPath:
                      const Icon(Icons.credit_card_sharp, color: Colors.black),
                  controller: cardNumber,
                  typeText: TextInputType.number,
                  len: 16,
                ),
                10.getHL(),
                GlobalTextFormField(
                  labelText: 'expire data',
                  prefixIconPath:
                      const Icon(Icons.date_range, color: Colors.black),
                  controller: expireDate,
                  typeText: TextInputType.number,
                  len: 5,
                ),
                10.getHL(),
                GlobalTextFormField(
                  labelText: 'cvc',
                  prefixIconPath:
                      const Icon(Icons.date_range, color: Colors.black),
                  controller: cvc,
                  typeText: TextInputType.text,
                  len: 10,
                ),
                10.getHL(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ...List.generate(
                      colors.length,
                      (index) => ZoomTapAnimation(
                          onTap: () {
                            cardColor = colors[index];
                          },
                          child: Container(
                              margin: EdgeInsets.only(right: 10.wl),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(int.parse("0xff${colors[index]}")),
                              ),
                              height: 40.hl,
                              width: 40.wl)),
                    ),
                  ],
                ),
                const Spacer(),
                // ZoomTapAnimation(
                //   onTap: () {
                //     List<CardModel> db = state.userCardsDB;
                //     List<CardModel> myCards = state.userCards;
                //     bool isExist = false;
                //     bool hasInDb = false;
                //
                //     for (var element in myCards) {
                //       if (element.cardNumber == cardNumber.text) {
                //         isExist = true;
                //         break;
                //       }
                //     }
                //
                //     for (var i in db) {
                //       if (i.cardNumber == cardNumber.text) {
                //         hasInDb = true;
                //         break;
                //       }
                //     }
                //
                //     if ((!isExist) && hasInDb == false) {
                //       context.read<CardsBloc>().add(
                //             AddCardEvent(
                //               CardModel(
                //                 cardHolder: '',
                //                 cardNumber: cardNumber.text,
                //                 expireDate: expireDate.text,
                //                 userId: '',
                //                 type: 1,
                //                 cardId: '',
                //                 icon: '',
                //                 cvc: cvc.text,
                //                 color: cardColor,
                //                 isMain: false,
                //                 balance: 0.0,
                //                 bank: '',
                //               ),
                //             ),
                //           );
                //     } else {
                //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                //           content: Text(
                //         "Karta bazada mavjud emas yoki allaqachon qoshilgan",
                //         style: TextStyle(
                //           fontSize: 18.wl,
                //           color: Colors.black,
                //         ),
                //       )));
                //     }
                //   },
                //   child: Container(
                //     width: widthLogin,
                //     padding: EdgeInsets.symmetric(vertical: 12.hl),
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(12.wl),
                //       color: Colors.blue,
                //     ),
                //     child: Center(
                //       child: Text(
                //         "Save Cards",
                //         style: TextStyle(
                //           fontSize: 18.wl,
                //           color: Colors.black,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                SaveButton(
                  onTab: () {
                    if (cardNumber.text.length == 16 &&
                        expireDate.text.length == 5) {
                      List<CardModel> myCards =
                          context.read<CardsBloc>().state.userCards;
                      List<CardModel> cards =
                          context.read<CardsBloc>().state.userCardsDB;
                      for (int i = 0; i < myCards.length; i++) {
                        if (myCards[i].cardNumber == cardNumber.text) {
                          cardNumber.clear();
                          expireDate.clear();
                          cvc.clear();
                          return;
                        }
                      }

                      for (int i = 0; i < cards.length; i++) {
                        debugPrint(cards[i].cardNumber);
                        if (cards[i].cardNumber == cardNumber.text &&
                            expireDate.text == cards[i].expireDate) {
                          context.read<CardsBloc>().add(
                                AddCardEvent(
                                  cards[i].copyWith(
                                      userId: context
                                          .read<UserProfileBloc>()
                                          .state
                                          .userModel
                                          .userId),
                                ),
                              );
                          cardNumber.clear();
                          expireDate.clear();
                          cvc.clear();
                          Navigator.pop(context);
                          return;
                        }
                      }
                    }

                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content:
                            Text("Card oldin qoshilgan yoki mavjud emas")));
                  },
                  loading: loading,
                  active: true,
                ),
                20.getHL(),
              ],
            ),
          );
        },
        listener: (context, state) {
          if (state.statusMessage == "added") {
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}

List<String> colors = [
  "FF1317DD",
  "FF131212",
  "FFAB9797",
  "FF406AD8",
  "FFC0C0C0",
];

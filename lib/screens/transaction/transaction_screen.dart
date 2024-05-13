import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/blocs/cards/cards_bloc.dart';
import 'package:payment_app/screens/transaction/widgets/amount_input.dart';
import 'package:payment_app/screens/transaction/widgets/card_item_view.dart';
import 'package:payment_app/screens/transaction/widgets/card_number_input.dart';
import 'package:payment_app/screens/transaction/widgets/custom_button.dart';
import 'package:payment_app/utils/size/size.dart';
import '../../blocs/cards/cards_state.dart';
import '../../blocs/transaction/transaction_bloc.dart';
import '../../data/models/card_model.dart';
import '../../utils/colors/app_colors.dart';
import '../../utils/text_format.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransactionScreen> {
  int selectedCardIndex = 0;

  final TextEditingController cardNumberController = TextEditingController();
  final FocusNode cardFocusNode = FocusNode();

  final TextEditingController amountController = TextEditingController();
  final FocusNode amountFocusNode = FocusNode();

  CardModel senderCard = CardModel.initial();
  CardModel receiverCard = CardModel.initial();

  @override
  void initState() {
    _init();
    super.initState();
  }

  _init() {
    senderCard = context.read<CardsBloc>().state.userCardsDB[0];
    List<CardModel> cards = context.read<CardsBloc>().state.activeCards;
    cardNumberController.addListener(
      () {
        String receiverCardNumber =
            cardNumberController.text.replaceAll(" ", "");
        if (receiverCardNumber.length == 16) {
          for (var element in cards) {
            if (element.cardNumber == receiverCardNumber &&
                senderCard.cardNumber != receiverCardNumber) {
              receiverCard = element;

              context
                  .read<TransactionBloc>()
                  .add(SetReceiverCardEvent(cardModel: receiverCard));
              context
                  .read<TransactionBloc>()
                  .add(SetSenderCardEvent(cardModel: senderCard));

              setState(() {});
              break;
            } else {
              receiverCard = CardModel.initial();
            }
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: BlocBuilder<CardsBloc, CardsState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              children: [
                10.getH(),
                Expanded(
                  child: ListView(
                    children: [
                      TextField(
                        controller: cardNumberController,
                        inputFormatters: [
                          AppInputFormatters.cardNumberFormatter,
                        ],
                        decoration: InputDecoration(
                          hintText: "Card Number",
                          hintStyle: TextStyle(
                            color: AppColors.c_7F8192,
                            fontSize: 14.w,
                            fontWeight: FontWeight.w400,
                          ),
                          filled: true,
                          fillColor: AppColors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: const Color(0xFF858BE9),
                              width: 1.w,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: const Color(0xFF858BE9),
                              width: 1.w,
                            ),
                          ),
                        ),
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 16.w,
                          fontWeight: FontWeight.w500,
                        ),
                        focusNode: cardFocusNode,
                        onChanged: (value) {
                          if (value.replaceAll(" ", "").length == 16) {
                            cardFocusNode.unfocus();
                          }
                          setState(() {});
                        },
                      ),
                      Visibility(
                        visible: cardNumberController.text.length == 19,
                        child: Row(
                          children: [
                            SizedBox(width: 24.w),
                            Text(
                              "Qabul qiluvchi: ${receiverCard.cardHolder.isEmpty ? "Topilmadi" : receiverCard.cardHolder}",
                              style: TextStyle(
                                fontSize: 14.w,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                      10.getH(),
                      Visibility(
                        child: AmountInput(
                          controller: amountController,
                          focusNode: amountFocusNode,
                          amount: (amount) {
                            if (amount >= 1000) {
                              context.read<TransactionBloc>().add(
                                    SetAmountEvent(amount: amount),
                                  );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                CarouselSlider(
                  items: List.generate(
                    state.userCards.length,
                    (index) {
                      CardModel cardModel = state.userCardsDB[index];
                      return CardItemView(
                        chipVisibility: false,
                        cardModel: cardModel,
                      );
                    },
                  ),
                  options: CarouselOptions(
                    aspectRatio: 16 / 7,
                    viewportFraction: 0.95,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    onPageChanged: (index, reason) {
                      selectedCardIndex = index;
                      debugPrint("INDEX:$index");
                      senderCard = state.userCards[index];
                    },
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.1,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                BlocListener<TransactionBloc, TransactionState>(
                  listener: (context, state) {
                    if (state.statusMessage == "not_validated") {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Ma'lumotlar xato!"),
                        ),
                      );
                    } else if (state.statusMessage == "validated") {
                      Navigator.pop(context);
                    }
                  },
                  child: MyCustomButton(
                    onTap: () {
                      context
                          .read<TransactionBloc>()
                          .add(CheckValidationEvent());
                    },
                    title: "Yuborish",
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

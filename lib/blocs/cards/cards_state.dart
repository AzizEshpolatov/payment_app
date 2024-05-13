import 'package:equatable/equatable.dart';
import 'package:payment_app/data/models/form_status.dart';
import '../../data/models/card_model.dart';

class CardsState extends Equatable {
  final String errorMessage;
  final String statusMessage;
  final FormStatus formStatus;
  final List<CardModel> userCards;
  final List<CardModel> userCardsDB;
  final List<CardModel> activeCards;

  const CardsState({
    required this.statusMessage,
    required this.errorMessage,
    required this.formStatus,
    required this.userCards,
    required this.userCardsDB,
    required this.activeCards,
  });

  CardsState copyWith({
    String? errorMessage,
    String? statusMessage,
    FormStatus? formStatus,
    List<CardModel>? userCards,
    List<CardModel>? userCardsDB,
    List<CardModel>? activeCards,
  }) {
    return CardsState(
      statusMessage: statusMessage ?? this.statusMessage,
      errorMessage: errorMessage ?? this.errorMessage,
      formStatus: formStatus ?? this.formStatus,
      userCards: userCards ?? this.userCards,
      userCardsDB: userCardsDB ?? this.userCardsDB,
      activeCards: activeCards ?? this.activeCards,
    );
  }

  @override
  List<Object?> get props => [
        statusMessage,
        errorMessage,
        formStatus,
        userCards,
        userCardsDB,
        activeCards,
      ];
}

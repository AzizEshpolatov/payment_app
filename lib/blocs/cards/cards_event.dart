import 'package:equatable/equatable.dart';
import 'package:payment_app/data/models/card_model.dart';

abstract class CardsEvent extends Equatable {}

class AddCardEvent extends CardsEvent {
  final CardModel cardModel;

  AddCardEvent(this.cardModel);

  @override
  List<Object?> get props => [cardModel];
}

class UpdateCardEvent extends CardsEvent {
  final CardModel cardModel;

  UpdateCardEvent(this.cardModel);

  @override
  List<Object?> get props => [cardModel];
}

class DeleteCardEvent extends CardsEvent {
  final String cardDocId;

  DeleteCardEvent(this.cardDocId);

  @override
  List<Object?> get props => [cardDocId];
}
class GetActiveCards extends CardsEvent {
  @override
  List<Object?> get props => [];
}

class GetCardsByUserIdEvent extends CardsEvent {
  GetCardsByUserIdEvent({required this.userId});

  final String userId;

  @override
  List<Object?> get props => [userId];
}

class GetCardsDatabaseEvent extends CardsEvent {
  GetCardsDatabaseEvent();

  @override
  List<Object?> get props => [];
}

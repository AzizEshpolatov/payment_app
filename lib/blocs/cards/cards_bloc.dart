import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/data/models/form_status.dart';
import 'package:payment_app/data/models/network_response.dart';
import 'package:payment_app/data/repositories/cards_repo/cards_repo.dart';
import '../../data/models/card_model.dart';
import 'cards_event.dart';
import 'cards_state.dart';

class CardsBloc extends Bloc<CardsEvent, CardsState> {
  CardsBloc({required this.cardRepository})
      : super(
          const CardsState(
            statusMessage: '',
            errorMessage: '',
            formStatus: FormStatus.pure,
            userCards: [],
            userCardsDB: [],
          ),
        ) {
    on<AddCardEvent>(_addCard);
    on<UpdateCardEvent>(_updateCard);
    on<DeleteCardEvent>(_deleteCard);
    on<GetCardsByUserIdEvent>(_listenCard);
    on<GetCardsDatabaseEvent>(_listenCardDatabase);
  }

  final CardRepository cardRepository;

  _addCard(AddCardEvent event, emit) async {
    NetworkResponse response = await cardRepository.addCard(event.cardModel);

    if (response.errorText.isEmpty) {
      emit(state.copyWith(formStatus: FormStatus.success));
    } else {
      emit(state.copyWith(
        errorMessage: response.errorText,
        formStatus: FormStatus.error,
      ));
    }
  }

  _updateCard(UpdateCardEvent event, emit) async {
    NetworkResponse response = await cardRepository.updateCard(event.cardModel);

    if (response.errorText.isEmpty) {
      emit(state.copyWith(formStatus: FormStatus.success));
    } else {
      emit(state.copyWith(
        errorMessage: response.errorText,
        formStatus: FormStatus.error,
      ));
    }
  }

  _deleteCard(DeleteCardEvent event, emit) async {
    NetworkResponse response = await cardRepository.deleteCard(event.cardDocId);

    if (response.errorText.isEmpty && response.errorCode.isEmpty) {
      emit(state.copyWith(formStatus: FormStatus.success));
    } else {
      emit(state.copyWith(
        errorMessage: response.errorText,
        formStatus: FormStatus.error,
      ));
    }
  }

  _listenCard(GetCardsByUserIdEvent event, emit) async {
    await emit.onEach(
      cardRepository.getCardsByUserId(event.userId),
      onData: (List<CardModel> userCards) {
        debugPrint(
            "================= user cards ============== ${userCards.length}");
        emit(state.copyWith(userCards: userCards));
      },
    );
  }

  _listenCardDatabase(GetCardsDatabaseEvent event, emit) async {
    debugPrint("===================Database===============");
    await emit.onEach(
      cardRepository.getCardsDatabase(),
      onData: (List<CardModel> db) {
        debugPrint("================= DB ============== ${db.length}");
        emit(state.copyWith(userCardsDB: db));
      },
    );
  }
}

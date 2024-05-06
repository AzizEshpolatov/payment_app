import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/data/models/form_status.dart';
import 'package:payment_app/data/models/network_response.dart';
import 'package:payment_app/data/models/user_model.dart';
import 'package:payment_app/data/repositories/user_profile_repo/user_profile_repo.dart';

part 'user_profile_event.dart';

part 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  UserProfileBloc(this.userProfileRepository)
      : super(
          UserProfileState(
            formStatus: FormStatus.pure,
            userModel: UserModel.initial(),
            errorMessage: '',
            statusMessage: '',
          ),
        ) {
    on<AddUserEvent>(_addUser);
    on<DeleteUserEvent>(_deleteUser);
    on<UpdateUserEvent>(_updateUser);
    on<GetUserByDocIdEvent>(_getUserByDocId);
    on<GetCurrentUserEvent>(_getUser);
  }

  final UserProfileRepository userProfileRepository;

  _addUser(AddUserEvent event, emit) async {
    emit(state.copyPath(formStatus: FormStatus.loading));

    NetworkResponse networkResponse =
        await userProfileRepository.addUser(event.userModel);

    if (networkResponse.errorCode.isEmpty) {
      emit(
        state.copyPath(
          formStatus: FormStatus.success,
          userModel: event.userModel,
        ),
      );
    } else {
      emit(state.copyPath(
        statusMessage: networkResponse.errorCode,
        formStatus: FormStatus.error,
      ));
    }
  }

  _deleteUser(DeleteUserEvent event, emit) async {
    emit(state.copyPath(formStatus: FormStatus.loading));

    NetworkResponse networkResponse =
        await userProfileRepository.deleteUser(event.userModel.userId);

    if (networkResponse.errorCode.isEmpty) {
      emit(
        state.copyPath(
          formStatus: FormStatus.success,
          userModel: UserModel.initial(),
        ),
      );
    } else {
      emit(state.copyPath(
        statusMessage: networkResponse.errorCode,
        formStatus: FormStatus.error,
      ));
    }
  }

  _updateUser(UpdateUserEvent event, emit) async {
    emit(state.copyPath(formStatus: FormStatus.loading));

    NetworkResponse networkResponse =
        await userProfileRepository.updateUser(event.userModel);

    if (networkResponse.errorCode.isEmpty) {
      emit(
        state.copyPath(
          formStatus: FormStatus.success,
          userModel: event.userModel,
        ),
      );
    } else {
      emit(state.copyPath(
        statusMessage: networkResponse.errorCode,
        formStatus: FormStatus.error,
      ));
    }
  }

  _getUserByDocId(GetUserByDocIdEvent event, emit) async {
    emit(state.copyPath(formStatus: FormStatus.loading));

    NetworkResponse networkResponse =
        await userProfileRepository.getUserByDocId(event.docId);

    if (networkResponse.errorCode.isEmpty) {
      emit(
        state.copyPath(
          formStatus: FormStatus.success,
          userModel: networkResponse.data as UserModel,
        ),
      );
    } else {
      emit(state.copyPath(
        statusMessage: networkResponse.errorCode,
        formStatus: FormStatus.error,
      ));
    }
  }

  _getUser(GetCurrentUserEvent event, emit) async {
    emit(state.copyPath(formStatus: FormStatus.loading));

    NetworkResponse networkResponse =
        await userProfileRepository.getUserByUid();

    if (networkResponse.errorCode.isEmpty) {
      emit(
        state.copyPath(
          formStatus: FormStatus.success,
          userModel: networkResponse.data as UserModel,
        ),
      );
    } else {
      emit(state.copyPath(
        statusMessage: networkResponse.errorCode,
        formStatus: FormStatus.error,
      ));
    }
  }
}

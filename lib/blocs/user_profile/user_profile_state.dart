part of 'user_profile_bloc.dart';

class UserProfileState extends Equatable {
  final UserModel userModel;
  final String errorMessage;
  final String statusMessage;
  final FormStatus formStatus;

  const UserProfileState({
    required this.formStatus,
    required this.userModel,
    required this.errorMessage,
    required this.statusMessage,
  });

  UserProfileState copyPath({
    UserModel? userModel,
    String? errorMessage,
    String? statusMessage,
    FormStatus? formStatus,
  }) =>
      UserProfileState(
        formStatus: formStatus ?? this.formStatus,
        userModel: userModel ?? this.userModel,
        errorMessage: errorMessage ?? this.errorMessage,
        statusMessage: statusMessage ?? this.statusMessage,
      );

  @override
  List<Object?> get props => [
        formStatus,
        userModel,
        errorMessage,
        statusMessage,
      ];
}

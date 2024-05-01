import 'package:equatable/equatable.dart';
import 'package:payment_app/data/models/form_status.dart';
import 'package:payment_app/data/models/user_model.dart';

class AuthState extends Equatable {
  final String errorMessage;
  final String statusMessage;
  final FormStatus formStatus;
  final UserModel userModel;

  const AuthState({
    required this.statusMessage,
    required this.formStatus,
    required this.errorMessage,
    required this.userModel,
  });

  AuthState copyWith({
    String? errorMessage,
    String? statusMessage,
    FormStatus? formStatus,
    UserModel? userCredential,
  }) {
    return AuthState(
      statusMessage: statusMessage ?? this.statusMessage,
      formStatus: formStatus ?? this.formStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      userModel: userCredential ?? this.userModel,
    );
  }

  @override
  List<Object?> get props => [
        statusMessage,
        errorMessage,
        formStatus,
        userModel,
      ];
}

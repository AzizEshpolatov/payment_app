import 'package:equatable/equatable.dart';
import 'package:payment_app/data/models/form_status.dart';

class AuthState extends Equatable {
  final String errorMessage;
  final String statusMessage;
  final FormStatus formStatus;

  const AuthState({
    required this.statusMessage,
    required this.formStatus,
    required this.errorMessage,
  });

  AuthState copyWith({
    String? errorMessage,
    String? statusMessage,
    FormStatus? formStatus,
  }) {
    return AuthState(
      statusMessage: statusMessage ?? this.statusMessage,
      formStatus: formStatus ?? this.formStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        statusMessage,
        errorMessage,
        formStatus,
      ];
}

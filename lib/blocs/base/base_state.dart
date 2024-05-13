import 'package:equatable/equatable.dart';
import '../../data/models/form_status.dart';

class BaseState extends Equatable {
  final FormStatus status;
  final String errorMessage;
  final String statusMessage;

  const BaseState({
    required this.status,
    required this.errorMessage,
    required this.statusMessage,
  });


  @override
  List<Object?> get props => [
        status,
        errorMessage,
        statusMessage,
      ];
}

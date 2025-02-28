
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../data/auth/responsesmodel/user_responses_model.dart';

@immutable
abstract class UserState extends Equatable {
  const UserState();
  
  @override
  List<Object?> get props => [];
}

/// State awal
class UserInitial extends UserState {}

/// State ketika data sedang dimuat
class UserLoading extends UserState {}

/// State ketika data berhasil diambil
class UserLoaded extends UserState {
  final UserResponsesModel userResponses;

  const UserLoaded({required this.userResponses});

  @override
  List<Object?> get props => [userResponses];
}

/// State ketika terjadi error
class UserError extends UserState {
  final String errorMessage;

  const UserError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

final class UpdateSelectedName extends UserState {
  final String text;

  const UpdateSelectedName(this.text);
}

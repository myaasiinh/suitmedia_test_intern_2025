import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class UserEvent extends Equatable {
  const UserEvent();
  
  @override
  List<Object?> get props => [];
}

/// Event untuk memuat data user
class LoadUserEvent extends UserEvent {
  final int page;
  final int perPage;

  const LoadUserEvent({
    required this.page,
    required this.perPage,
  });

  @override
  List<Object?> get props => [page, perPage];
}
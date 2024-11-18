// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'keyboard_cubit.dart';

sealed class KeyboardState {}

final class KeyboardInitial extends KeyboardState {}

class KeyboardError extends KeyboardState {}

class KeyboardSuccess extends KeyboardState {
  String message;
  KeyboardSuccess({
    required this.message,
  });
}

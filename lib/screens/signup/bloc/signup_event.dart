import 'package:equatable/equatable.dart';

part of 'signup_bloc.dart';

sealed class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

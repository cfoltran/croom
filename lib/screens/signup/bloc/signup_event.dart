part of 'signup_bloc.dart';

sealed class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

final class SignUpEmailChanged extends SignUpEvent {
  const SignUpEmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

final class SignUpUsernameChanged extends SignUpEvent {
  const SignUpUsernameChanged(this.username);

  final String username;

  @override
  List<Object> get props => [username];
}

final class SignUpPasswordChanged extends SignUpEvent {
  const SignUpPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

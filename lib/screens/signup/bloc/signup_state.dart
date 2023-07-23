part of 'signup_bloc.dart';

final class SignUpState extends Equatable {
  final FormzSubmissionStatus status;
  final Email email;
  final Username username;
  final Age age;
  final Password password;
  final bool isValid;

  const SignUpState({
    this.status = FormzSubmissionStatus.initial,
    this.email = const Email.pure(),
    this.username = const Username.pure(),
    this.age = const Age.pure(),
    this.password = const Password.pure(),
    this.isValid = false,
  });

  SignUpState copyWith({
    FormzSubmissionStatus? status,
    Email? email,
    Username? username,
    Password? password,
    Age? age,
    bool? isValid,
  }) {
    return SignUpState(
      status: status ?? this.status,
      email: email ?? this.email,
      username: username ?? this.username,
      age: age ?? this.age,
      password: password ?? this.password,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object> get props => [
        status,
        email,
        username,
        age,
        password,
      ];
}

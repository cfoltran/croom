part of 'signup_bloc.dart';

final class SignUpState extends Equatable {
  final FormzSubmissionStatus status;
  final Email email;
  final Username username;
  final Age age;
  final Password password;
  final bool isValid;
  final int currentPage;

  const SignUpState({
    this.status = FormzSubmissionStatus.initial,
    this.email = const Email.pure(),
    this.username = const Username.pure(),
    this.age = const Age.pure(),
    this.password = const Password.pure(),
    this.isValid = false,
    this.currentPage = 0,
  });

  SignUpState copyWith({
    FormzSubmissionStatus? status,
    Email? email,
    Username? username,
    Password? password,
    Age? age,
    bool? isValid,
    int? currentPage,
  }) {
    return SignUpState(
      status: status ?? this.status,
      email: email ?? this.email,
      username: username ?? this.username,
      age: age ?? this.age,
      password: password ?? this.password,
      isValid: isValid ?? this.isValid,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  @override
  List<Object> get props => [
        status,
        email,
        username,
        age,
        password,
        currentPage,
        isValid,
      ];

  @override
  String toString() {
    return '''SignUpState {
      status: $status,
      email: ${email.value},
      username: ${username.value},
      age: ${age.value},
      password: ${password.value},
      isValid: $isValid,      
    }''';
  }
}

import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:music_room/models/password.dart';
import 'package:music_room/models/username.dart';
import 'package:music_room/models/name.dart';

part of 'signup_bloc.dart';

final class SignUpState extends Equatable {
  const SignUpState({
    this.status = FormzSubmissionStatus.initial,
    this.username = const Username.pure(),
    this.firstname = const Name.pure(),
    this.lastname = const Name.pure(),
    // this.birthdate = const Birthdate.pure(),
    this.password = const Password.pure(),
    this.confirmPassword = const Password.pure(),
    this.isValid = false,
  });

  final FormzSubmissionStatus status;
  final Username username;
  final Name firstname;
  final Name lastname;
  // final Birthdate birthdate;
  final Password password;
  final Password confirmPassword;
  final bool isValid;

  SignUpState copyWith({
    FormzSubmissionStatus? status,
    Username? username,
    Name? firstname,
    Name? lastname,
    // Birthdate? birthdate,
    Password? password,
    Password? confirmPassword,
    bool? isValid,
  }) {
    return SignUpState(
      status: status ?? this.status,
      username: username ?? this.username,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      // birthdate: birthdate ?? this.birthdate,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object> get props => [status, username, firstname, lastname, birthdate, password, confirmPassword];
}
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:music_room/models/age.dart';
import 'package:music_room/models/email.dart';
import 'package:music_room/models/password.dart';
import 'package:music_room/models/username.dart';
import 'package:music_room/services/user_service.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(const SignUpState()) {
    on<SignUpEmailChanged>(_onEmailChanged);
    on<SignUpUsernameChanged>(_onUsernameChanged);
    on<SignUpPasswordChanged>(_onPasswordChanged);
    on<SignUpAgeChanged>(_onAgeChanged);
    on<SignUpSubmitted>(_onSubmitted);
  }

  void _onEmailChanged(
    SignUpEmailChanged event,
    Emitter<SignUpState> emit,
  ) {
    final email = Email.dirty(event.email);
    emit(state.copyWith(
      email: email,
      isValid: Formz.validate([state.email]),
    ));
  }

  void _onUsernameChanged(
    SignUpUsernameChanged event,
    Emitter<SignUpState> emit,
  ) {
    final username = Username.dirty(event.username);
    emit(state.copyWith(
      username: username,
    ));
  }

  void _onPasswordChanged(
    SignUpPasswordChanged event,
    Emitter<SignUpState> emit,
  ) {
    final password = Password.dirty(event.password);
    emit(state.copyWith(
      password: password,
      isValid: Formz.validate([state.password]),
    ));
  }

  void _onAgeChanged(
    SignUpAgeChanged event,
    Emitter<SignUpState> emit,
  ) {
    final age = Age.dirty(int.parse(event.age));
    emit(state.copyWith(
      age: age,
      isValid: Formz.validate([state.age]),
    ));
  }

  Future<void> _onSubmitted(
    SignUpSubmitted event,
    Emitter<SignUpState> emit,
  ) async {
    print(state.isValid);

    if (state.isValid || true) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      try {
        final res = await UserService.i.createUser(
          email: state.email.value,
          password: state.password.value,
          username: state.username.value,
          firstname: 'firstname',
          lastname: 'lastname',
          birthdate: '14/02/1998',
        );
        print('🔥');
        print(res);
        emit(state.copyWith(status: FormzSubmissionStatus.success));
      } catch (_) {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    }
  }
}

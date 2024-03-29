import 'package:flutter/widgets.dart';
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
  PageController pageController = PageController(initialPage: 0);

  SignUpBloc() : super(const SignUpState()) {
    on<SignUpEmailChanged>(_onEmailChanged);
    on<SignUpUsernameChanged>(_onUsernameChanged);
    on<SignUpPasswordChanged>(_onPasswordChanged);
    on<SignUpAgeChanged>(_onAgeChanged);
    on<SignUpSubmitted>(_onSubmitted);
    on<SignUpNextPage>(_onNextPage);
  }

  void _onNextPage(
    SignUpNextPage event,
    Emitter<SignUpState> emit,
  ) {
    pageController.nextPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
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
      isValid: Formz.validate([state.username]),
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
    print('state: $state');

    emit(state.copyWith(
      age: age,
      isValid: Formz.validate([state.age]),
    ));
  }

  Future<void> _onSubmitted(
    SignUpSubmitted event,
    Emitter<SignUpState> emit,
  ) async {
    if (state.age.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      try {
        await UserService.i.createUser(
          email: state.email.value,
          password: state.password.value,
          username: state.username.value,
          age: state.age.value,
        );
        emit(state.copyWith(status: FormzSubmissionStatus.success));
      } catch (error) {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    }
  }
}

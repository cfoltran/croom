import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_room/common/app_text_field.dart';
import 'package:music_room/screens/signup/bloc/signup_bloc.dart';

class PasswordForm extends StatelessWidget {
  const PasswordForm({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const PasswordForm());
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(child: Container()),
      const Text('Type a secret password 🤫',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      const SizedBox(height: 32),
      _PasswordForm(),
      const SizedBox(height: 32),
      const _NextButton(),
    ]);
  }
}

class _NextButton extends StatelessWidget {
  const _NextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return ElevatedButton(
          key: const Key('Passwordform_next_raisedButton'),
          onPressed: state.password.isValid
              ? () => context.read<SignUpBloc>().add(const SignUpNextPage())
              : null,
          child: const Text('Continue'),
        );
      },
    );
  }
}

class _PasswordForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return AppTextField(
          key: const Key('Passwordform_PasswordInput_textField'),
          hintText: 'Password',
          onChanged: (password) =>
              context.read<SignUpBloc>().add(SignUpPasswordChanged(password)),
          obscureText: true,
          autofocus: true,
          errorText: state.password.isValid
              ? null
              : 'Password must be at least 6 characters',
        );
      },
    );
  }
}

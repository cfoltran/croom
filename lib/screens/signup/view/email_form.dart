import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_room/common/app_text_field.dart';
import 'package:music_room/screens/signup/bloc/signup_bloc.dart';

class EmailForm extends StatelessWidget {
  const EmailForm({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const EmailForm());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Container()),
        const Text('What is your email address?',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 32),
        _EmailForm(),
        const SizedBox(height: 32),
        const _NextButton(),
      ],
    );
  }
}

class _NextButton extends StatelessWidget {
  const _NextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return ElevatedButton(
          key: const Key('emailform_next_raisedButton'),
          onPressed: state.email.isValid
              ? () => context.read<SignUpBloc>().add(const SignUpNextPage())
              : null,
          child: const Text('Continue'),
        );
      },
    );
  }
}

class _EmailForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return AppTextField(
          key: const Key('emailform_emailInput_textField'),
          onChanged: (email) =>
              context.read<SignUpBloc>().add(SignUpEmailChanged(email)),
          hintText: 'Email',
          autofocus: true,
          errorText: state.email.isValid ? null : 'Invalid email address',
        );
      },
    );
  }
}

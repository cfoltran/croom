import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_room/common/app_text_field.dart';
import 'package:music_room/common/common_page.dart';
import 'package:music_room/screens/signup/bloc/signup_bloc.dart';
import 'package:music_room/screens/signup/view/age_form.dart';

class UsernameForm extends StatelessWidget {
  const UsernameForm({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const UsernameForm());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(),
      child: CommonPage(
        appBar: AppBar(title: const Text('Create an account')),
        body: Column(children: [
          Expanded(child: Container()),
          const Text('Choose your username 🙋‍♂️',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 32),
          _UsernameForm(),
          const SizedBox(height: 32),
          const _NextButton(),
        ]),
      ),
    );
  }
}

class _NextButton extends StatelessWidget {
  const _NextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return ElevatedButton(
          key: const Key('Usernameform_next_raisedButton'),
          onPressed: state.username.isValid
              ? () {
                  Navigator.of(context).push<void>(AgeForm.route());
                }
              : null,
          child: const Text('Continue'),
        );
      },
    );
  }
}

class _UsernameForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return AppTextField(
          key: const Key('Usernameform_UsernameInput_textField'),
          onChanged: (username) =>
              context.read<SignUpBloc>().add(SignUpUsernameChanged(username)),
          hintText: 'Username',
          autofocus: true,
        );
      },
    );
  }
}

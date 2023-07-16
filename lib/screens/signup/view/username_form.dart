import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_room/common/common_page.dart';
import 'package:music_room/screens/signup/bloc/signup_bloc.dart';

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
          const Text('Enter a Username'),
          const SizedBox(height: 5.0),
          _UsernameForm(),
          const SizedBox(height: 10.0),
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
          onPressed: state.username.isValid ? () {} : null,
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
        return TextField(
          key: const Key('Usernameform_UsernameInput_textField'),
          onChanged: (username) =>
              context.read<SignUpBloc>().add(SignUpUsernameChanged(username)),
          decoration: InputDecoration(
            labelText: 'Username',
            errorText:
                state.username.displayError != null ? 'Invalid Username' : null,
            filled: true,
            fillColor: Colors.grey[200],
            border: InputBorder.none,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
          ),
        );
      },
    );
  }
}

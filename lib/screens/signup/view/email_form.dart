import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_room/common/common_page.dart';
import 'package:music_room/screens/signup/bloc/signup_bloc.dart';
import 'package:music_room/screens/signup/view/password_form.dart';

class EmailForm extends StatelessWidget {
  const EmailForm({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const EmailForm());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => SignUpBloc(),
        child: CommonPage(
          appBar: AppBar(title: const Text('Create an account')),
          body: Column(children: [
            const Text('What is your email address?'),
            const SizedBox(height: 5.0),
            _EmailForm(),
            const SizedBox(height: 10.0),
            const _NextButton(),
          ]),
        ));
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
              ? () => Navigator.of(context).push<void>(PasswordForm.route())
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
        return TextField(
          key: const Key('emailform_emailInput_textField'),
          onChanged: (email) =>
              context.read<SignUpBloc>().add(SignUpEmailChanged(email)),
          decoration: InputDecoration(
            labelText: 'Email',
            errorText:
                state.email.displayError != null ? 'Invalid email' : null,
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

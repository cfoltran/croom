import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_room/common/common_page.dart';
import 'package:music_room/screens/signup/bloc/signup_bloc.dart';

class AgeForm extends StatelessWidget {
  const AgeForm({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const AgeForm());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(),
      child: CommonPage(
        appBar: AppBar(title: const Text('Create an account')),
        body: Column(children: [
          const Text('Enter a Age'),
          const SizedBox(height: 5.0),
          _AgeForm(),
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
      buildWhen: (previous, current) => previous.age != current.age,
      builder: (context, state) {
        return ElevatedButton(
          key: const Key('Ageform_next_raisedButton'),
          onPressed: state.age.isValid ? () {} : null,
          child: const Text('Continue'),
        );
      },
    );
  }
}

class _AgeForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      buildWhen: (previous, current) => previous.age != current.age,
      builder: (context, state) {
        return TextField(
          key: const Key('Ageform_AgeInput_textField'),
          onChanged: (age) =>
              context.read<SignUpBloc>().add(SignUpAgeChanged(age)),
          keyboardType: TextInputType.number,
          maxLength: 2,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          decoration: InputDecoration(
            labelText: 'Age',
            errorText: state.age.displayError != null ? 'Invalid Age' : null,
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_room/screens/signup/bloc/signup_bloc.dart';
import 'package:music_room/screens/signup/view/signup_page.dart';

class SignUpWrapper extends StatelessWidget {
  const SignUpWrapper({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SignUpWrapper());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignUpBloc(),
      child: const SignupPage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_room/common/common_page.dart';
import 'package:music_room/screens/signup/bloc/signup_bloc.dart';
import 'package:music_room/screens/signup/view/age_form.dart';
import 'package:music_room/screens/signup/view/email_form.dart';
import 'package:music_room/screens/signup/view/password_form.dart';
import 'package:music_room/screens/signup/view/username_form.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpBloc, SignUpState>(
      listener: (context, state) {},
      builder: (context, state) {
        return CommonPage(
          appBar: AppBar(title: const Text('Create an account')),
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: context.read<SignUpBloc>().pageController,
            children: const [
              EmailForm(),
              PasswordForm(),
              UsernameForm(),
              AgeForm()
            ],
          ),
        );
      },
    );
  }
}

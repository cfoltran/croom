import 'package:flutter/material.dart';
import 'package:music_room/screens/login/view/login_page.dart';
import 'package:music_room/screens/signup/view/signup_wrapper.dart';

class LoginHomePage extends StatelessWidget {
  const LoginHomePage({Key? key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginHomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16.0),
            child: Column(children: [
              ElevatedButton(
                  onPressed: () => {
                        Navigator.of(context).push<void>(SignUpWrapper.route()),
                      },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50)),
                  child: const Text('Free sign up')),
              const SizedBox(height: 8.0),
              TextButton(
                onPressed: () =>
                    Navigator.of(context).push<void>(LoginPage.route()),
                child: const Text('Login'),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

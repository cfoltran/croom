import 'package:flutter/material.dart';

class CommonPage extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? bottomAppBar;
  final WillPopCallback? onWillPop;
  final EdgeInsets padding;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  const CommonPage({
    Key? key,
    required this.body,
    this.appBar,
    this.bottomAppBar,
    this.onWillPop,
    this.padding = const EdgeInsets.all(16.0),
    this.floatingActionButton,
    this.floatingActionButtonLocation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop != null ? onWillPop! : () async => true,
      child: Scaffold(
        appBar: appBar,
        body: SafeArea(
          child: Padding(
            padding: padding,
            child: body,
          ),
        ),
        bottomNavigationBar: bottomAppBar,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
      ),
    );
  }
}

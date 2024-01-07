import 'package:flutter/material.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key, required this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.fromLTRB(25.0, 80.0, 25.0, 20.0),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 50.0,
            child: child,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key, required this.child});

  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 20.0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - 50.0,
        child: child,
      ),
    );
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shoal_app/core/utils/storage_service.dart';
import 'package:shoal_app/globals.dart';

class SessionTimeoutListener extends StatefulWidget {
  Widget child;
  Duration duration;
  VoidCallback onTimeOut;
  VoidCallback? cancelTimer;
  SessionTimeoutListener(
      {super.key,
      required this.child,
      required this.duration,
      required this.onTimeOut,
      this.cancelTimer
      });

  @override
  State<SessionTimeoutListener> createState() => _SessionTimeoutListenerState();
}

class _SessionTimeoutListenerState extends State<SessionTimeoutListener> { 

  Timer? _timer;
  startTimer() {
    print('Start Timer');
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
    }
    _timer = Timer(widget.duration, () {
      print('Elaps time!');
      widget.onTimeOut();
    });
  }

  cancelTimer() {
    _timer!.cancel();
     _timer = null;
  }

  @override
  void initState() {

    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) {
        startTimer();
      },
      behavior: HitTestBehavior.translucent,
      child: widget.child,
    );
  }
}

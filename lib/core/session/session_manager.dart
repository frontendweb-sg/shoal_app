import 'dart:async';

import 'package:flutter/material.dart';

class SessionManager extends StatefulWidget {
  const SessionManager({
    super.key,
    required this.duration,
    required this.child,
    required this.onSessionExpired,
    required this.streamController,
  });

  final StreamController streamController;
  final VoidCallback onSessionExpired;
  final Duration duration;
  final Widget child;
  @override
  State<StatefulWidget> createState() {
    return _SessionManagerState();
  }
}

class _SessionManagerState extends State<SessionManager> {
  Timer? _timer;
  StreamController? streamController;
  void sessionStart() {
    startTimer();
    closeTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(widget.duration, (timer) {
      widget.onSessionExpired();
    });
  }

  void closeTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
  }

  @override
  void initState() {
    super.initState();
    streamController = StreamController();
    streamController = widget.streamController;
    if (streamController != null) {
      streamController!.stream.listen((event) {
        if (event != null && event['timer'] as bool) {
          sessionStart();
        } else {
          closeTimer();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) {
        sessionStart();
      },
      child: widget.child,
    );
  }
}

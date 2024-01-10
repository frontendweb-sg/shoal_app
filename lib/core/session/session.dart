import 'dart:async';

import 'package:flutter/material.dart';

class Session {
  BuildContext? context;
  StreamController? streamController;
  bool enableAuthPage = false;

  void startListener({
    required StreamController streamController,
    required BuildContext context,
  }) {
    this.context = context;
    this.streamController = streamController;
    Map<String, dynamic> map = {'context': context, 'timer': true};
    streamController.add(map);
  }

  void stopListener({
    required StreamController streamController,
    required BuildContext context,
  }) {
    this.context = context;
    this.streamController = streamController;
    Map<String, dynamic> map = {'context': context, 'timer': false};
    streamController.add(map);
  }
}

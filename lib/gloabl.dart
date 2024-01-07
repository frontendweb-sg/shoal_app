import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shoal_app/config/theme/colors.dart';
import 'package:shoal_app/core/utils/host_override_service.dart';
import 'package:shoal_app/core/utils/storage_service.dart';

class Global {
  static late StorageService storage;

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();

    if (Platform.isAndroid || Platform.isIOS) {
      HttpOverrides.global = HostOverrideService();
    }

    // initial hive
    await initHiveForFlutter();

    // lock screen to portrait orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    // change status bar color
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColor.kTransparent,
      ),
    );

    // initialize
    storage = await StorageService().init();
  }
}

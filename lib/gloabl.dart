import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shoal_app/config/theme/colors.dart';
import 'package:shoal_app/core/graphql/config.dart';
import 'package:shoal_app/core/utils/host_override_service.dart';
import 'package:shoal_app/core/utils/storage_service.dart';

const token =
    "eyJraWQiOiJxcjMwakptd0xWVU45TGM1YnpzWDNvaWJVSkRpMEdYcStGMmJ5aGlzZTlNPSIsImFsZyI6IlJTMjU2In0.eyJzdWIiOiJhNzA5MDk4My02NzZiLTQ0NTctYjc0OC1hN2E0M2FmZjA0ZjQiLCJpc3MiOiJodHRwczpcL1wvY29nbml0by1pZHAudXMtd2VzdC0yLmFtYXpvbmF3cy5jb21cL3VzLXdlc3QtMl9Kb2pnWkxEZFciLCJjbGllbnRfaWQiOiI2OG9obnYzYmhpNjRrMDhyaWlxZnUxYjFwayIsIm9yaWdpbl9qdGkiOiIyODI3ZjNlNi04YmUyLTQ1YWQtODU2NS1iOWJhYzc1MGI3YWYiLCJldmVudF9pZCI6IjdlZmQ1ZmU3LTQ1ZTYtNGFkYi1iMGY0LWMyZWYzZjRlMjhhYSIsInRva2VuX3VzZSI6ImFjY2VzcyIsInNjb3BlIjoiYXdzLmNvZ25pdG8uc2lnbmluLnVzZXIuYWRtaW4iLCJhdXRoX3RpbWUiOjE3MDQ0Mzg2MTMsImV4cCI6MTcwNDQ0MjIxMywiaWF0IjoxNzA0NDM4NjEzLCJqdGkiOiJkOWQ4MjBkYi04ZWNiLTQ1YTItYjc3ZS01YmQwNDc5YmZjYjMiLCJ1c2VybmFtZSI6InZpbmF5Lmx1bmF3YXQifQ.BjpM6CTCvJRIPhH2A8PO9q1GrZHusEjv4hQbfeUm8ayJEiCEGrsY-nkVeMqVEMEvLNPN7g1gxvf5q8-qecKrvVTjmQ6NsBUZ0LXqsUshKYv6TD-jo_lKd_Is0f6pQG_kBH1Tt5gosSLmc5fekTrxumT4DKSG7yNseUmYYR5J6qSZy4fHBGpl2W8POjGjqInaO8fa594x_9FBoGF59558sM9E5rqU84m2V6bmmO5DLep8eYO_RyMINGqYFtDrHzV970xA_ZMUGJn8NCjX8xsv4qdQ5Rtm_BY2dlqyvRU2a8UuYmyChW5Auw2vYyCcBXWalEJAqonLQcvEAAUqECQqFg";

class Global {
  static late StorageService storage;
  static late ValueNotifier<GraphQLClient> graphqlClient;

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

    graphqlClient = GraphQlConfig.init();
  }
}

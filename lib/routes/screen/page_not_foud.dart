import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shoal_app/routes/app_route.dart';
import 'package:shoal_app/routes/route_utils.dart';

class NotFoundScreen extends StatefulWidget {
  const NotFoundScreen({Key? key}) : super(key: key);

  @override
  State<NotFoundScreen> createState() => _NotFoundScreenState();
}

class _NotFoundScreenState extends State<NotFoundScreen> {
  @override
  Widget build(BuildContext context) {
    void submit () {
      AppRouter.router.go(PAGES.login.screenPath);
    }
    return Scaffold(
      appBar: AppBar(title: const Text('Page not Found!')),
      body: Center(
        child: Column(
          children: [
           const SizedBox(height: 50.0),  
           const  Text(
            'No Page Found'
          ),
          const SizedBox(height: 20.0),
          TextButton(
            onPressed: submit,
             child: const Text('Back to Login!'))
          ],
        ),
      ),
    );
  }
}

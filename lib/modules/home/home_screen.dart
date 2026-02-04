import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scan_it/app/routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            IconButton(
              onPressed: () {
                Get.toNamed(Routes.SCANNER);
              },
              icon: Icon(Icons.document_scanner),
            ),
          ],
        ),
      ),
    );
  }
}

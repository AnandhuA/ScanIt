import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:scan_it/utils/constants/sizes.dart';

class AppErrorWidget extends StatelessWidget {
  final String lottiePath;
  final VoidCallback refresh;
  const AppErrorWidget({
    super.key,
    required this.refresh,
    required this.lottiePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: .center,
      crossAxisAlignment: .center,
      children: [
        Lottie.asset(lottiePath),
        AppSpacing.h12(),
        TextButton.icon(
          onPressed: refresh,
          label: Text("Refresh"),
          icon: Icon(Icons.refresh),
        ),
      ],
    );
  }
}

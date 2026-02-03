import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:scan_it/app/routes/app_routes.dart';

import 'scanner_controller.dart';

class ScannerView extends GetView<ScannerController> {
  const ScannerView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        title: const Text("ScanIt"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return Stack(
          children: [
            MobileScanner(
              fit: BoxFit.cover,

              onDetect: (capture) async {
                final code = capture.barcodes.first.rawValue;

                if (code == null) return;

                await controller.fetchProduct(code);

                if (controller.product.value != null) {
                  Get.toNamed(
                    Routes.PRODUCT,
                    arguments: controller.product.value!,
                  );
                } else {
                  Get.snackbar("Not Found", "Product not available");
                }
              },
            ),

            Center(
              child: Container(
                width: size.width * 0.7,
                height: size.width * 0.7,

                decoration: BoxDecoration(
                  border: Border.all(color: Colors.greenAccent, width: 3),
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.transparent,
                ),
              ),
            ),

            Positioned(
              top: 30,
              left: 0,
              right: 0,

              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),

                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: const Text(
                    "Align barcode inside the box",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}

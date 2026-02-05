import 'package:get/get.dart';
import 'package:scan_it/modules/scanner/scanner_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ScannerController());
  }
}

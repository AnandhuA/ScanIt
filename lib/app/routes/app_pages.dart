import 'package:get/get.dart';
import 'package:scan_it/modules/product/product_view_screen.dart';
import 'package:scan_it/modules/scanner/scanner_screen.dart';

import '../../modules/scanner/scanner_binding.dart';

import 'app_routes.dart';

class AppPages {

  static const INITIAL = Routes.SCANNER;

  static final routes = [

    GetPage(
      name: Routes.SCANNER,
      page: () => const ScannerView(),
      binding: ScannerBinding(),
    ),

    GetPage(
      name: Routes.PRODUCT,
      page: () => const ProductView(),
    ),
  ];
}

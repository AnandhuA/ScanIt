import 'package:get/get.dart';
import 'package:scan_it/modules/home/home_screen.dart';
import 'package:scan_it/modules/product/product_view_screen.dart';
import 'package:scan_it/modules/scanner/scanner_screen.dart';

import '../../modules/scanner/scanner_binding.dart';
import 'app_routes.dart';

class AppPages {

  static const INITIAL = Routes.HOME;

  static final routes = [


    GetPage(
      name: Routes.HOME,
      page: () => const HomeScreen(),
      // binding: ScannerBinding(),
    ),

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

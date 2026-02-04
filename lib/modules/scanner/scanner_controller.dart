import 'package:get/get.dart';
import 'package:scan_it/data/models/product_model.dart';
import 'package:scan_it/data/repositories/api_repo.dart';

class ScannerController extends GetxController {

  final ApiRepo _api = ApiRepo();

  var isLoading = false.obs;
   Rx<ProductModel?> product = Rx<ProductModel?>(null);

  Future<void> fetchProduct(String code) async {

    isLoading.value = true;

    final result = await _api.getProduct(code);

    isLoading.value = false;

    if (result != null) {
      product.value = result;
    } else {
      product.value = null;
    }
  }
}

import 'package:get/get.dart';
import 'package:scan_it/data/providers/api_provider.dart';

class ScannerController extends GetxController {

  final ApiProvider _api = ApiProvider();

  var isLoading = false.obs;
  var product = Rxn<Map<String, dynamic>>();

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

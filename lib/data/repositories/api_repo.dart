import 'package:dio/dio.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:scan_it/data/models/product_model.dart';
import 'package:scan_it/data/network/dio_client.dart';
import 'package:scan_it/utils/helper_classes/error_helper.dart';

class ApiRepo {
  final Dio _dio = DioClient.instance;

  Future<ProductModel?> getProduct(String code) async {
    try {
      final response = await _dio.get('$code.json');

      final data = response.data;

      if (response.statusCode == 200 && data != null) {
        if (data['status'] == 1 && data['product'] != null) {
          return ProductModel.fromJson(data['product']);
        } else {
          Get.snackbar("Not Found", "Product not found");
        }
      }
    } on DioException catch (e) {
      Get.snackbar("Error", ErrorHelper.getErrorMessage(e));
    } catch (e) {
      Get.snackbar("Error", "Something went wrong");
    }

    return null;
  }

}

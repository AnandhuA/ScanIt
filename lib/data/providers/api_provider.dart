import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:scan_it/data/network/dio_client.dart';

class ApiProvider {
  final Dio _dio = DioClient.instance;

  Future<Map<String, dynamic>?> getProduct(String code) async {
    try {
      final response = await _dio.get('$code.json');

      if (response.statusCode == 200) {
        final data = response.data;

        if (data != null && data['status'] == 1) {
          return Map<String, dynamic>.from(data['product']);
        }
      }
    } catch (e) {
      log('API Error: $e');
    }

    return null;
  }
}

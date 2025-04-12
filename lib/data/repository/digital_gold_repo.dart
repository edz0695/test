import 'package:get/get.dart';

import '../../src/src.dart';
import '../api/api_client.dart';

class DigitalGoldRepo extends GetxService {
  final ApiClient apiClient;
  DigitalGoldRepo({required this.apiClient});

  Future<Response> getGoldProductAPI(Map<String, String> header) async {
    return apiClient.getData(
        '${AppConstants.goldProductAPIUrl}${"?page=1&count=30"}',
        headers: header);
  }

  Future<Response> getGoldAPIRates(Map<String, String> header) async {
    return apiClient.getData(AppConstants.goldRatesAPIUrl, headers: header);
  }

  Future<Response> addTOCART(Map<String, String> body) async =>
      await apiClient.postData(AppConstants.goldAddToCartAPIUrl, body);

  Future<Response> updateCART(
      {required Map<String, String> body, required String id}) async {
    return apiClient.putData(
        "${AppConstants.goldUpdateRemoveCartAPIUrl}/$id", body);
  }

  Future<Response> removeFromCART(String id) async {
    print(
        "${AppConstants.sambhavBaseUrl}${AppConstants.goldUpdateRemoveCartAPIUrl}/$id");
    return apiClient
        .deleteData("${AppConstants.goldUpdateRemoveCartAPIUrl}/$id");
  }
}

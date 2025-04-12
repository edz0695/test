import 'package:get/get.dart';

import '../../src/src.dart';
import '../api/api_client.dart';

class PODRepo extends GetxService {
  final ApiClient apiClient;
  PODRepo({required this.apiClient});

  Future<Response> getPODProductAPI(String id) async {
    return apiClient.getData(
      '${AppConstants.pODProductAPIUrl}$id',
    );
  }

  Future<Response> getPODCartProductAPI() async {
    return apiClient.getData(
      '${AppConstants.sambhavBaseUrl}${AppConstants.podGetCartAPIUrl}',
    );
  }

  Future<Response> addTOCART(Map<String, String> body) async {
    return apiClient.postData(AppConstants.podAddToCartAPIUrl, body);
  }

  Future<Response> updateCART(
      {required Map<String, String> body, required String id}) async {
    return apiClient.putData("${AppConstants.podUpdateCartAPIUrl}/$id", body);
  }

  Future<Response> removeFromCART(String id) async {
    return apiClient.deleteData("${AppConstants.podRemoveFromCartAPIUrl}/$id");
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:payapp/config/apiconfig.dart';
import 'package:payapp/services/apis/apiservice.dart';
import '../../../../models/ca_models/home_services_model.dart';

class RemoteCAServices {
  static Future<List<CAHomeServicesModel>> fetchCAHomeServices() async {
    try {
      print("Fetching CA Home Services...");

      // Construct the API URL
      var url = Uri.parse(Constants.services);
      final headers = {
        'Authorization': 'Bearer ${ApiService.amrToken}',
        'Content-Type': 'application/json',
      };
      final http.Response response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data
            .map((json) =>
                CAHomeServicesModel.fromJson(json as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('Failed to load home services');
      }
    } catch (e) {
      print("Error occurred: $e");
      return [];
    }
  }
}

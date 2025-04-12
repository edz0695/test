import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../src/src.dart';

class SambhavTubeController extends GetxController implements GetxService {

  Future<SambhavTubeCategoryModel?> fetchSambhavtubeCategories() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    final url = Uri.parse(AppConstants.sambhavTubeCategoriesAPIUrl);

    try {
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        printThis("Sambhav Tube Categories API response $data");
        return SambhavTubeCategoryModel.fromJson(data);
      } else {
        throw Exception(
            'Failed to fetch Sambhav Tube Categories Status Code: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error fetching  Sambhav Tube Categories: $e');
    }
    return null;
  }

  Future<SambhavTubeVideosModel?> fetchSambhavtubeVideos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    final url = Uri.parse(AppConstants.sambhavTubeVideoAPIUrl);

    try {
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        // Parse the response body into the model
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        return SambhavTubeVideosModel.fromJson(jsonResponse);
      } else {
        // Handle non-200 responses
        printThis(
            'Failed to fetch videos. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exceptions
      printThis('Error fetching Sambhav Tube Videos: $e');
    }
    return null;
  }

  // Fetch video details by id

  Future<SambhavTubeVideosData?> fetchSambhavtubeVideoById(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    final url = Uri.parse("${AppConstants.sambhavTubeVideoAPIUrl}/$id");

    try {
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        // Parse the response body into the model
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        printThis('fetch video by id. body: ${response.body}');
        return SambhavTubeVideosData.fromJson(jsonResponse);
      } else {
        // Handle non-200 responses
        printThis(
            'Failed to fetch video by id. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exceptions
      printThis('Error fetching Sambhav Tube Video by id: $e');
    }
    return null;
  }
}

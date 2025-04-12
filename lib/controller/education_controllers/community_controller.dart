import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../src/src.dart';

class CommunityController extends GetxController implements GetxService {
  var loading = false.obs;

  Future<void> addCommentsAPI(Map<String, String> map, String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    final headers = {'Authorization': 'Bearer $token'};
    try {
      var url = "${AppConstants.addCommunityCommentsAPIUrl}$id";
      final response =
          await http.put(Uri.parse(url), body: map, headers: headers);

      if (response.statusCode == 200) {
        Get.back();
      } else {
        toast(title: 'Error', message: 'Failed to add comment');
      }
    } catch (e) {
      debugPrint('Error adding comment: $e');
    }
    return;
  }

  Future<void> addLikesAPI(Map<String, String> map, String id) async {
    loading.value == true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    final headers = {'Authorization': 'Bearer $token'};
    try {
      var url = "${AppConstants.addCommunityLikeAPIUrl}$id";
      final response =
          await http.put(Uri.parse(url), body: map, headers: headers);

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);

        printThis(jsonData);
        loading.value == false;
      } else if (response.statusCode == 500) {
        toast(
            title: 'Error', message: 'Internal Server Error. Try again later');
        loading.value == false;
      } else {
        toast(title: 'Error', message: 'Failed to add like');
        loading.value == false;
      }
    } catch (e) {
      loading.value == false;
      debugPrint('Error likes api: $e');
    }
    return;
  }

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

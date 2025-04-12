import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../src/src.dart';

class JobController extends GetxController implements GetxService {
  Future<JobsModel?> fetchJob() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    final url = Uri.parse(AppConstants.jobsAPIUrl);

    try {
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        printThis("Jobs API response $data");
        return JobsModel.fromJson(data);
      } else {
        throw Exception(
            'Failed to fetch Jobs Status Code: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error fetching  Jobs: $e');
    }
    return null;
  }

  Future<RecruiterJobsModel?> fetchRecruiterJobs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    final url = Uri.parse(AppConstants.recruiterJobsAPIUrl);

    try {
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        printThis("Recruiter Job API response $data");
        return RecruiterJobsModel.fromJson(data);
      } else {
        throw Exception(
            'Failed to fetch Recruiter Jobs Status Code: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error fetching Recruiter Jobs: $e');
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

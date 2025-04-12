import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:payapp/core/services/image_picker_service.dart';
import 'package:payapp/models/ca_models/ca_history_model.dart';
import '../src/src.dart';

class CAServicesController extends GetxController implements GetxService {
  var cAServicesModel = Rx<CAServicesModel?>(null);
  var cAServiceFormModel = Rx<CAServiceFormModel?>(null);
  final loading = Rx<bool>(false);
  final formLoading = Rx<bool>(false);

  RxList<Map<String, dynamic>> formDetails = <Map<String, dynamic>>[].obs;

  RxMap<String, XFile?> fileData = <String, XFile?>{}.obs;

  Future<void> pickFile(String id, String label, String type) async {
    final XFile? result =
        await ImagePickerService.pickSingleImage(source: ImageSource.gallery);

    if (result != null && type == "file") {
      fileData[id] = result;
      formDetails.add({"label": label, "type": type, "value": result});
    }
  }

  void updateTextField(String label, String value, String type) {
    formDetails.add({"label": label, "type": type, "value": value});

    print(formDetails);
  }

  Future<void> fetchCAServices(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    final url = Uri.parse(
        "${AppConstants.sambhavBaseUrl}${AppConstants.caServicesAPIUrl}/$id");

    try {
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        printThis("CA Services API response $data");
        cAServicesModel.value = CAServicesModel.fromJson(data);
      } else {
        throw Exception(
            'Failed to fetch CA Services. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error fetching  CA Services: $e');
    }
  }

  Future<void> fetchCAServiceFormData(String serviceId) async {
    loading.value = true;
    try {
      var apiUrl = Uri.parse(
          'https://xyzabc.sambhavapps.com/v1/ca/service/form/service/$serviceId');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('auth-token') ?? '';

      var response = await http.get(
        apiUrl,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        loading.value = false;
        final jsonData = json.decode(response.body);
        printThis(jsonData);
        cAServiceFormModel.value = CAServiceFormModel.fromJson(jsonData);
      } else {
        loading.value = false;
        printThis('Failed to load data CA Service form');
      }
    } catch (e) {
      loading.value = false;
      printThis("Error: $e");
    }
  }

  Future<void> cAFormAPI(String price, String id, String title) async {
    formLoading.value = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString('token');
    if (token == null) {
      print("Authorization token not found.");
      return;
    }

    final headers = {'Authorization': 'Bearer $token'};
    const imageUrl = "${AppConstants.sambhavBaseUrl}/files/uploads";

    try {
      // Upload image
      final req = http.MultipartRequest('POST', Uri.parse(imageUrl));
      req.headers.addAll(headers);

      // Add image files to the request
      for (var i in formDetails.where((i) => i.containsValue("file"))) {
        if (i["value"] != null && i["value"] is XFile) {
          // Handle XFile
          final filePath = (i["value"] as XFile).path;
          final imageBytes = await File(filePath).readAsBytes();
          req.files.add(http.MultipartFile.fromBytes(
            "images",
            imageBytes,
            filename: filePath.split('/').last,
            contentType: MediaType('image', 'png'),
          ));
        } else if (i["value"] != null && i["value"] is String) {
          // Handle String file path
          final filePath = i["value"] as String;
          final imageBytes = await File(filePath).readAsBytes();
          req.files.add(http.MultipartFile.fromBytes(
            "images",
            imageBytes,
            filename: filePath.split('/').last,
            contentType: MediaType('image', 'png'),
          ));
        }
      }

      // Send the image request
      final imagesResponse = await req.send();
      final imagesBody = await imagesResponse.stream.bytesToString();

      if (imagesResponse.statusCode == 200) {
        // Process the image response
        final banners = jsonDecode(imagesBody);
        print("Uploaded Images: $banners");

        // Assign URLs to formDetails
        if (banners["data"] != null && banners["data"] is List) {
          int index = 0;
          for (var i
              in formDetails.where((value) => value.containsValue("file"))) {
            if (i["type"] == "file" && index < banners["data"].length) {
              i["value"] = banners["data"][index]; // Adjust key if needed
              index++;
            }
          }
        } else {
          print("Unexpected banners['data'] format: ${banners["data"]}");
          return;
        }

        // Prepare JSON for the final API call
        final json = {
          "title": title,
          "serviceid": id,
          "logo": "",
          "formdetails": formDetails,
          "orderid": "",
          "pay_price": "",
          "ca_remarks": "",
          "files": [],
          "servis_completed_details": "",
          "status": "1"
        };

        // Make the final API call to update the profile
        const apiUrl = "https://xyzabc.sambhavapps.com/v1/ca/orders";

        print("------------ JSON $json ------------------");
        final jsonResponse = await http.post(
          Uri.parse(apiUrl),
          body: jsonEncode(json),
          headers: {
            ...headers,
            'Content-Type': 'application/json',
          },
        );

        if (jsonResponse.statusCode == 200) {
          toast(title: 'Success', message: 'CA form updated successfully');
          print("CA form updated successfully ${jsonResponse.body}");
          formLoading.value = false;
        } else {
          print("Failed to update CA form. ${jsonResponse.body}");
          final body = jsonDecode(jsonResponse.body);
          toast(title: 'Error', message: body['error']);
          formLoading.value = false;
        }
      } else {
        print("Failed to upload images: $imagesBody");
        formLoading.value = false;
      }
    } catch (e) {
      print("Error during upload or post: $e");
      formLoading.value = false;
    }
  }

// CA History
  Future<CAHistoryModel?> fetchCAOrdersHistory() async {
    try {
      var apiUrl = Uri.parse('https://xyzabc.sambhavapps.com/v1/ca/orders');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('auth-token') ?? '';

      var response = await http.get(
        apiUrl,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        printThis(jsonData);
        return CAHistoryModel.fromJson(jsonData);
      } else {
        printThis('Failed to load data CA History form');
      }
    } catch (e) {
      printThis("Error: $e");
    }
    return null;
  }

  // CA History Details
  Future<CAOrderDetailsModel?> fetchCAOrdersHistoryDetails(String id) async {
    try {
      var apiUrl = Uri.parse('https://xyzabc.sambhavapps.com/v1/ca/orders/$id');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('auth-token') ?? '';

      var response = await http.get(
        apiUrl,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        printThis(jsonData);
        return CAOrderDetailsModel.fromJson(jsonData);
      } else {
        printThis('Failed to load data CA Orders details');
      }
    } catch (e) {
      printThis("Error: $e");
    }
    return null;
  }
}

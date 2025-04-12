import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import '../core/services/hiveDatabase.dart';
import '../src/src.dart';

class PODController extends GetxController implements GetxService {
  var podModel = Rx<PODModel?>(null);
  var podCartModel = Rx<PODCartModel?>(null);

  var sizeID = ''.obs;
  var colorID = ''.obs;

  var size = ''.obs;
  var color = ''.obs;

  final PODRepo repo;

  Uint8List? image;

  PODController({required this.repo});

  getSelectedColorID(String id) => colorID.value = id;

  getSelectedSizeID(String id) => sizeID.value = id;

  getSelectedSize(String sizeName) => size.value = sizeName;

  // getCacheImage() async {
  //   final box = Hive.box("images");
  //   HiveDataBase.getSingleItem(key: "image", box: box).then((i) {
  //     image = i.values.first;
  //     update();
  //   });
  // }

  Future<void> fetchPODProducts(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    final url = Uri.parse(
        "${AppConstants.sambhavBaseUrl}${AppConstants.pODProductAPIUrl}$id");

    try {
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        podModel.value = PODModel.fromJson(data);
      } else {
        throw Exception(
            'Failed to fetch products. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error fetching POD products: $e');
    }
  }

// POD Cart
  Future<void> fetchPODCartProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString('token');
    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    final url = Uri.parse(
        "${AppConstants.sambhavBaseUrl}${AppConstants.podGetCartAPIUrl}");

    try {
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        // printThis(
        //     "....................POD DATA.......................\n${response.body}");
        final data = json.decode(response.body);
        podCartModel.value = PODCartModel.fromJson(data);
      } else {
        throw Exception(
            'Failed to fetch POD Cart products. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error fetching POD Cart products: $e');
    }
  }

  Future<void> podAddToCartAPI({required String id, required int qty}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final Box box = await HiveDataBase.openBox(boxName: "images");

    String? token = prefs.getString('token');
    if (token == null) {
      printThis("Authorization token not found.");
      return;
    }

    final headers = {'Authorization': 'Bearer $token'};
    const imageUrl = "${AppConstants.sambhavBaseUrl}/media/uploads";

    try {
      final imageBytes =
          await HiveDataBase.getSingleItem(key: "image", box: box);
      if (imageBytes == null || imageBytes.isEmpty) {
        printThis("No image found in Hive.");
        toast(message: "No Edited image found.");
        return;
      }

      // Upload image
      final req = http.MultipartRequest('POST', Uri.parse(imageUrl));
      req.headers.addAll(headers);
      req.files.add(http.MultipartFile.fromBytes(
        "media",
        imageBytes,
        filename: "PODimage.png",
        contentType: MediaType('image', 'png'),
      ));

      final uploadResponse = await req.send();
      if (uploadResponse.statusCode == 200) {
        // Read the response only once
        final responseString = await uploadResponse.stream.bytesToString();
        printThis("Image uploaded successfully: $responseString");

        // Decode the JSON response
        final jsonString = jsonDecode(responseString);
        final imagrURL = jsonString['url'];

        // Debugging: Check the URL extracted from the response
        printThis("Image URL: $imagrURL");

        // Prepare the JSON body for the POST request
        final Map<String, String> json = {
          "productId": id,
          "quantity": qty.toString(),
          "size": sizeID.value.toString(),
          "color": colorID.value.toString(),
          "image": imagrURL
        };

        // Post JSON data to the cart API
        const url =
            "${AppConstants.sambhavBaseUrl}${AppConstants.podAddToCartAPIUrl}";
        final jsonResponse = await http.post(
          Uri.parse(url),
          body: jsonEncode(json),
          headers: {
            ...headers,
            'Content-Type': 'application/json',
          },
        );

        if (jsonResponse.statusCode == 200) {
          toast(title: 'Success', message: 'Product added to cart');
          await fetchPODCartProducts();
        } else {
          print("Failed to add product to cart. ${jsonResponse.body}");
          toast(title: 'Error', message: 'Failed to add product to cart');
        }
      } else {
        final error = await uploadResponse.stream.bytesToString();
        print(
            "Image upload failed. Status: ${uploadResponse.statusCode}, Error: $error");
      }
    } catch (e) {
      print("Error during upload or post: $e");
    }
  }

// create order
  Future<void> placeOrderAPI(Map<String, dynamic> map) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    printThis("ORDER TOKEN $token");
    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };
    try {
      const url =
          "${AppConstants.sambhavBaseUrl}${AppConstants.podPlaceOrderAPIUrl}";

      final String requestBody = jsonEncode(map);

      final res = await http.post(
        Uri.parse(url),
        body: requestBody,
        headers: headers,
      );
      if (res.statusCode == 200) {
        toast(title: 'Success', message: 'Order placed successfully');
      } else {
        printThis(
            ".................failed to order placed..................$requestBody");
        toast(message: "failed to order placed");
      }
    } catch (e) {
      debugPrint('Error adding product to cart: $e');
    }
  }

  Future<void> podUpdateCartAPI(
      {required Map<String, String> body, required String id}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      final headers = {'Authorization': 'Bearer $token'};
      final url =
          "${AppConstants.sambhavBaseUrl}${AppConstants.podUpdateCartAPIUrl}/$id";
      final res = await http.put(Uri.parse(url), body: body, headers: headers);
      if (res.statusCode == 200) {
        await fetchPODCartProducts();
      } else {
        toast(title: 'Error', message: 'Failed to update product to cart');
      }
    } catch (e) {
      debugPrint('Error updating product to cart: $e');
    }
  }

  Future<void> podRemoveFromCartAPI(String id) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      final headers = {'Authorization': 'Bearer $token'};
      final url =
          "${AppConstants.sambhavBaseUrl}${AppConstants.podRemoveFromCartAPIUrl}/$id";
      final res = await http.delete(Uri.parse(url), headers: headers);

      if (res.statusCode == 200) {
        await fetchPODCartProducts();
      } else {
        toast(title: 'Error', message: 'Failed to remove product from cart');
      }
    } catch (e) {
      debugPrint('Error removing product from cart: $e');
    }
  }
}

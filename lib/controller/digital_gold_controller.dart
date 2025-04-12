import 'dart:async';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../src/src.dart';

class DigitalGoldController extends GetxController implements GetxService {
  final DigitalGoldRepo repo;
  List<GoldProductModel> _goldProducts = [];

  var ratesResponse = Rxn<RatesResponse>();

  var goldCartModel = Rxn<GoldCartModel?>(null);

  var getGram = '100'.obs;
  var getIndex = 0.obs;

  DigitalGoldController({required this.repo});

  List<GoldProductModel> get goldProduct => _goldProducts;

  @override
  void onInit() {
    super.onInit();
    fetchRatesRealtime();
  }

  getGoldGram({required int currentIndex, required String gram}) {
    getIndex.value = currentIndex;
    getGram.value = gram;
  }

// merchantID 11508
  final goldToken =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiNDQ3N2ZhNmRiZmVkZDNhNWYzNTlkMTk1MWUxMTkzNTNkNDk5YjAxMTg2YTZhMTQ5ZjdiMGE2ODk4NzdhYzkwOGYxNWUyMGM4NmU5MTVkNmEiLCJpYXQiOjE3MzIyNzk3NjYsIm5iZiI6MTczMjI3OTc2NiwiZXhwIjoxNzM0ODcxNzY2LCJzdWIiOiI1MDAwMTM3NiIsInNjb3BlcyI6W119.IfuNIQXYsyJCq72B9pXkg9DH2f3p2M6mxyQkqv3TW3Y_TRGlHClta-ZklWKv6_gdjIbpkTYtGJhzlqm-Qq7eDLJLDLxh_11cmPEsyVr_ydWO22otXLrEBKxGUCnrtQmF8ObHgDGdjiNtjwbkfA5pg91h9oiaJU6hoyZ9QvUitm4sUta1paaOyD4YVwWuRiSvSb-RbMe2CuTrJaqA9aEqU3Sm3ZQWAl5EpjIkVH2oYJIbHHXYkLaoZduO2DwT18ggLsg80DZLBL47wzj08WLOb3yLaA-KgezE4Q8Sl3w2olm45pw8amXHm8owdyGs0ngvX9qPEeDXwU0F90B0py-nQ9GxlzE0k4nbH80r29j2P3VXGFyMpzE0iHdhVfSEliE85WZYzK9AXI_BRyLFhlJKtL7UosOBrFWwOATtOtP9olTPmPUXbbMIVr5M2oqOL0mCThW_6SHh-puL0Z5oP-YX0vMWC9BKRQu9Q5VOTsaIYox82J7T89iG8Dw3nGQHIhJZYm6MSPYdUYGrgEbuOoLfpRu9IbvfJpwA6KZdQhfPvfD58iyIxAJBm4aX3Xp_EzGKcET70WOzll1yvXPx-kA9i1-NKXfLTfUZg63lEEn87KeJjivBdkByep9YJpuTImBNgmJBPNvOxr_c8F9U_wxaEGSiTd0_ajaBSHSqKT5olzc';

  Future<List<GoldProductModel>> fetchGoldProducts() async {
    final headers = {
      'Authorization': 'Bearer $goldToken',
      'Content-Type': 'application/json',
    };

    try {
      final response = await http.get(
        Uri.parse(
            "${AppConstants.goldAPIBaseUrl}${AppConstants.goldProductAPIUrl}?page=1&count=30"),
        headers: headers,
      );

      if (response.statusCode == 200) {
        // Decode the JSON response
        final data = json.decode(response.body);

        if (data['result'] != null && data['result']["data"] != null) {
          final List dataList =
              data['result']["data"]; // Access the 'data' field correctly

          final List<GoldProductModel> goldProducts =
              dataList.map((item) => GoldProductModel.fromJson(item)).toList();

          _goldProducts = goldProducts;

          update();
          return goldProducts;
        } else {
          debugPrint("Error: 'result' or 'data' is null");
          return [];
        }
      } else {
        debugPrint("Failed to fetch data: ${response.statusCode}");
        return [];
      }
    } catch (e) {
      debugPrint("Error fetching data of Gold: $e");
      return [];
    }
  }

  Future<RatesResponse?> fetchRates() async {
    final headers = {
      'Authorization': 'Bearer $goldToken',
      'Content-Type': 'application/json',
    };

    try {
      final response = await http.get(
        Uri.parse(
            "${AppConstants.goldAPIBaseUrl}${AppConstants.goldRatesAPIUrl}"),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);

        final res = RatesResponse.fromJson(jsonData);
        ratesResponse.value = res;
        return res;
      } else {
        debugPrint("Failed to fetch data. Status code: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      debugPrint("Error fetching data Rates: $e");
      return null;
    }
  }

  void fetchRatesRealtime() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      final rates = await fetchRates();
      if (rates != null) {
        ratesResponse.value = rates;
      }
    });
  }

  // Gold Cart

// POD Cart
  Future<void> fetchGoldCartProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    final url = Uri.parse(
        "${AppConstants.sambhavBaseUrl}${AppConstants.goldGetCartAPIUrl}");

    try {
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        goldCartModel.value = GoldCartModel.fromJson(data);
      } else {
        throw Exception(
            'Failed to fetch Gold Cart products. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error fetching POD Cart products: $e');
    }
  }

  Future<void> goldAddToCartAPI(Map<String, String> map) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final headers = {'Authorization': 'Bearer $token'};
    try {
      const url =
          "${AppConstants.sambhavBaseUrl}${AppConstants.goldAddToCartAPIUrl}";
      final res = await http.post(Uri.parse(url), body: map, headers: headers);

      if (res.statusCode == 200) {
        toast(title: 'Success', message: 'Product added to cart');
        await fetchGoldCartProducts();
      } else if (res.statusCode == 400) {
        toast(title: 'Error', message: json.decode(res.body)["message"]);
      } else if (res.statusCode == 503) {
        toast(title: 'Error', message: 'Service Unavailable. Try again later.');
      } else {
        toast(title: 'Error', message: 'Failed to add product to cart');
      }
    } catch (e) {
      debugPrint('Error adding product to cart: $e');
    }
  }

  Future<void> buyGoldSilverAPI(Map<String, dynamic> map) async {
    final headers = {'Authorization': 'Bearer $goldToken'};
    try {
      const url =
          "${AppConstants.goldAPIBaseUrl}${AppConstants.buyGoldSilverAPIUrl}";
      final res = await http.post(Uri.parse(url), body: map, headers: headers);

      if (res.statusCode == 200) {
        toast(title: 'Success', message: 'You successfully purchased');
      }
    } catch (e) {
      debugPrint('Error purchasing gold/silver: $e');
    }
  }

  Future<void> sellGoldSilverAPI(Map<String, String> map) async {
    final headers = {'Authorization': 'Bearer $goldToken'};
    try {
      const url =
          "${AppConstants.goldAPIBaseUrl}${AppConstants.sellGoldSilverAPIUrl}";
      final res = await http.post(Uri.parse(url), body: map, headers: headers);

      if (res.statusCode == 200) {
        toast(title: 'Success', message: 'You sold successfully');
      }
    } catch (e) {
      debugPrint('Error selling gold/silver: $e');
    }
  }

  Future<void> goldUpdateCartAPI(
      {required Map<String, String> body, required String id}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final headers = {'Authorization': 'Bearer $token'};
    try {
      final url =
          "${AppConstants.sambhavBaseUrl}${AppConstants.goldUpdateRemoveCartAPIUrl}/$id";

      final res = await http.put(Uri.parse(url), body: body, headers: headers);
      if (res.statusCode == 200) {
        await fetchGoldCartProducts();
      } else {
        toast(title: 'Error', message: 'Failed to update product to cart');
      }
    } catch (e) {
      debugPrint('Error updating product to cart: $e');
    }
  }

  Future<void> goldRemoveFromCartAPI(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final headers = {'Authorization': 'Bearer $token'};
    final url =
        "${AppConstants.sambhavBaseUrl}${AppConstants.goldUpdateRemoveCartAPIUrl}/$id";
    try {
      final res = await http.delete(Uri.parse(url), headers: headers);
      if (res.statusCode == 200) {
        await fetchGoldCartProducts();
      } else {
        toast(title: 'Error', message: 'Failed to remove product from cart');
      }
    } catch (e) {
      debugPrint('Error removing product from cart: $e');
    }
  }
}

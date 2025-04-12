import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:connectivity/connectivity.dart';
import '../../../../../themes/colors.dart';
import '../widgets/widgets.dart';

class PODCategoryScreen extends StatefulWidget {
  final String categoryId;
  final String categoryName;

  const PODCategoryScreen(
      {super.key, required this.categoryId, required this.categoryName});

  @override
  State<PODCategoryScreen> createState() => _PODCategoryScreenState();
}

class _PODCategoryScreenState extends State<PODCategoryScreen> {
  List<dynamic> subcategories = [];
  List<Mug> products = [];
  bool isLoading = true;
  String errorMessage = '';
  // final Connectivity _connectivity = Connectivity();

  @override
  void initState() {
    super.initState();
    fetchSubcategoriesAndProducts();
    // initConnectivity();
    // _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  // Future<void> initConnectivity() async {
  //   ConnectivityResult result;
  //   try {
  //     result = await _connectivity.checkConnectivity();
  //     if (result == ConnectivityResult.none) {
  //       setState(() {
  //         errorMessage = 'No internet connection available.';
  //       });
  //     } else {
  //       fetchSubcategoriesAndProducts();
  //     }
  //   } on PlatformException catch (e) {
  //     setState(() {
  //       errorMessage = 'Failed to get connectivity: ${e.toString()}';
  //     });
  //   }
  // }

  // Future<void> _updateConnectionStatus(ConnectivityResult result) async {
  //   if (result != ConnectivityResult.none) {
  //     fetchSubcategoriesAndProducts();
  //   }
  // }

  Future<void> fetchSubcategoriesAndProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    if (token == null) {
      setState(() {
        errorMessage = 'Authentication token not found.';
      });
      return;
    }

    // try {

    var subcategoryUrl = Uri.parse(
        'https://xyzabc.sambhavapps.com/v1/pod/subcategory/cat/${widget.categoryId}');
    var productsUrl = Uri.parse(
        'https://xyzabc.sambhavapps.com/v1/pod/product/cat/${widget.categoryId}');
    var headers = {
      'Authorization': 'Bearer $token',
    };

    var subcategoryResponse = await http.get(subcategoryUrl, headers: headers);
    var productsResponse = await http.get(productsUrl, headers: headers);
    print(subcategoryResponse.statusCode);
    print(productsResponse.statusCode);

    print(subcategoryResponse.body);
    print(productsResponse.body);
    if (subcategoryResponse.statusCode == 200 &&
        productsResponse.statusCode == 200) {
      setState(() {
        subcategories = jsonDecode(subcategoryResponse.body)["data"];
        products = List<Mug>.from(jsonDecode(productsResponse.body)["data"]
            .map((model) => Mug.fromJson(model)));

        isLoading = false;
      });
    } else {
      throw Exception('Failed to load data from server.');
    }
    // } catch (e) {
    //   print(e);
    //   setState(() {
    //     errorMessage = e.toString();
    //     isLoading = false;
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName,
            style: const TextStyle(
                fontWeight: FontWeight.bold, letterSpacing: 2, fontSize: 20)),
        foregroundColor: ThemeColors.darkBlueColor,
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text(
                'All categories',
                style: TextStyle(color: Colors.grey.withOpacity(0.8)),
              ),
            ),
            if (isLoading)
              const CircularProgressIndicator(
                color: Colors.indigo,
                backgroundColor: Colors.indigoAccent,
              )
            else if (errorMessage.isNotEmpty)
              ListTile(title: Text(errorMessage))
            else
              for (var subcategory in subcategories)
                ListTile(
                    title: Text(subcategory['cat_name'],
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {
                      Get.to(() => PODSubCategoryScreen(
                            categoryId: subcategory['id'],
                            categoryName: subcategory['cat_name'],
                          ));
                    }),
          ],
        ),
      ),
      body: RefreshIndicator(
          color: Colors.indigo,
          onRefresh: fetchSubcategoriesAndProducts,
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Colors.indigo,
                  backgroundColor: Colors.indigoAccent,
                ))
              : errorMessage.isNotEmpty
                  ? Center(child: Text(errorMessage))
                  : PODCategoryWidget(
                      subcategories: subcategories, products: products)),
    );
  }

  @override
  void dispose() {
    // _connectivity.dispose();
    super.dispose();
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../../../themes/colors.dart';
import 'widgets.dart';

class PODSubCategoryScreen extends StatefulWidget {
  final String categoryId;
  final String categoryName;

  const PODSubCategoryScreen(
      {super.key, required this.categoryId, required this.categoryName});

  @override
  State<PODSubCategoryScreen> createState() => _PODSubCategoryScreenState();
}

class _PODSubCategoryScreenState extends State<PODSubCategoryScreen> {
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

    try {
      print("Fetching sub categories and products");
      print("category ID : ${widget.categoryId}");

      var subcategoryUrl = Uri.parse(
          'https://xyzabc.sambhavapps.com/v1/pod/sub1category/subcat/${widget.categoryId}');
      var productsUrl = Uri.parse(
          'https://xyzabc.sambhavapps.com/v1/pod/product/subcat/${widget.categoryId}');
      var headers = {
        'Authorization': 'Bearer $token',
      };

      var subcategoryResponse =
          await http.get(subcategoryUrl, headers: headers);
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
    } catch (e) {
      print(e);
      setState(() {
        errorMessage = e.toString();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName,
            style: const TextStyle(
                fontWeight: FontWeight.bold, letterSpacing: 2, fontSize: 18)),
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
                      Get.to(() => PODSub1CategoryScreen(
                            categoryId: subcategory['id'],
                            categoryName: subcategory['cat_name'],
                          ));
                    }),
          ],
        ),
      ),
      body: RefreshIndicator(
          onRefresh: fetchSubcategoriesAndProducts,
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Colors.indigo,
                  backgroundColor: Colors.indigoAccent,
                ))
              : errorMessage.isNotEmpty
                  ? Center(child: Text(errorMessage))
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                              height: 140,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: subcategories.length,
                                itemBuilder: (context, index) =>
                                    GestureDetector(
                                  onTap: () {
                                    Get.to(() => PODSubCategoryScreen(
                                          categoryId: subcategories[index]
                                              ['id'],
                                          categoryName: subcategories[index]
                                              ['cat_name'],
                                        ));
                                  },
                                  child: Card(
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          radius: 30,
                                          backgroundColor: Colors.transparent,
                                          child: Padding(
                                              padding: const EdgeInsets.all(5),
                                              child: Image.network(
                                                  subcategories[index]
                                                      ['cat_img'])),
                                        ),
                                        Text(subcategories[index]['cat_name'],
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12)),
                                      ],
                                    ),
                                  ),
                                ),
                              )),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.8,
                            child: GridView(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 10,
                                      childAspectRatio: 0.69 / 1),
                              children: products
                                  .map((mug) => MugCard(mug: mug))
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    )),
    );
  }

  @override
  void dispose() {
    // _connectivity.dispose();
    super.dispose();
  }
}

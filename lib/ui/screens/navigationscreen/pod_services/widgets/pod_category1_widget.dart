import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../../widgets/app_bar_widget.dart';
import 'widgets.dart';

class PODSub1CategoryScreen extends StatefulWidget {
  final String categoryId;
  final String categoryName;

  const PODSub1CategoryScreen(
      {super.key, required this.categoryId, required this.categoryName});

  @override
  State<PODSub1CategoryScreen> createState() => _PODSub1CategoryScreenState();
}

class _PODSub1CategoryScreenState extends State<PODSub1CategoryScreen> {
  List<Mug> products = [];
  bool isLoading = true;
  String errorMessage = '';
  // final Connectivity _connectivity = Connectivity();

  @override
  void initState() {
    super.initState();
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

      var productsUrl = Uri.parse(
          'https://xyzabc.sambhavapps.com/v1/pod/product/sub1cat/${widget.categoryId}');
      var headers = {
        'Authorization': 'Bearer $token',
      };

      var productsResponse = await http.get(productsUrl, headers: headers);

      print(productsResponse.statusCode);

      print(productsResponse.body);
      if (productsResponse.statusCode == 200) {
        setState(() {
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
      appBar: AppBarWidget(title: widget.categoryName),
      body: RefreshIndicator(
          onRefresh: fetchSubcategoriesAndProducts,
          child: isLoading
              ? Center(
                  child: CircularProgressIndicator(
                  color: Colors.indigo,
                  backgroundColor: Colors.indigoAccent,
                ))
              : errorMessage.isNotEmpty
                  ? Center(child: Text(errorMessage))
                  : GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.69 / 1),
                      children:
                          products.map((mug) => MugCard(mug: mug)).toList(),
                    )
          // ListView.builder(
          //             itemCount: products.length,
          //             itemBuilder: (context, index) {
          //               return ListTile(
          //                 title: Text(products[index]['name']),
          //                 subtitle: Text('Price: ${products[index]['price']}'),
          //               );
          //             },
          //           ),
          ),
    );
  }

  @override
  void dispose() {
    // _connectivity.dispose();
    super.dispose();
  }
}

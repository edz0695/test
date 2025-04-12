import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:payapp/core/animations/shimmer_animation.dart';
import 'package:payapp/core/components/app_decoration.dart';
import 'package:payapp/models/ca_models/home_services_model.dart';
import 'package:payapp/themes/colors.dart';
import 'package:payapp/ui/screens/navigationscreen/ca_services/screens/ca_service_categor_info_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import "package:flutter_animate/flutter_animate.dart";
import "package:auto_animated/auto_animated.dart";

import '../../../../widgets/app_bar_widget.dart';

class CaSubCategoryScreen extends StatefulWidget {
  const CaSubCategoryScreen(
      {super.key, required this.categoryId, required this.categorName});
  final String categoryId;
  final String categorName;

  @override
  State<CaSubCategoryScreen> createState() => _CaSubCategoryScreenState();
}

class _CaSubCategoryScreenState extends State<CaSubCategoryScreen> {
  String userToken = '';
  late Future<List<dynamic>> _subCategoryFuture;
  List subCategory2 = [];
  final ScrollController _scrollController = ScrollController();
  String selectedSubCategory = "";

  @override
  void initState() {
    super.initState();
    _loadToken();
    _subCategoryFuture = _loadSubCategory1();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _loadToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userToken = prefs.getString('token') ?? '';
      print("UserToken Hey $userToken");
    });
  }

  Future<List<dynamic>> _loadSubCategory1() async {
    await _loadToken();
    try {
      var apiUrl = Uri.parse(
          'https://xyzabc.sambhavapps.com/v1/ca/sub/category/cat/${widget.categoryId}');
      var response = await http.get(
        apiUrl,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $userToken',
        },
      );
      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);
        return decodedResponse["data"];
      } else {
        throw Exception(
            'API Request Failed with Status Code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error calling API: $error');
      rethrow;
    }
  }

  Future<List<dynamic>> _loadSubCategory2(String subCategoryId) async {
    await _loadToken();
    try {
      var apiUrl = Uri.parse(
          'https://xyzabc.sambhavapps.com/v1/ca/sub2/category/sub/$subCategoryId');
      var response = await http.get(
        apiUrl,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $userToken',
        },
      );
      print("Sub category 1 ID : $subCategoryId");
      print('API Request Status Code: ${response.statusCode}');
      print('Response Body: ${jsonDecode(response.body)["data"]}');
      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);
        return decodedResponse["data"];
      } else {
        print('API Request Failed with Status Code: ${response.statusCode}');
        print('Response Body: ${response.body}');
        throw Exception(
            'API Request Failed with Status Code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error calling API: $error');
      rethrow;
    }
  }

  Future<void> _refreshData() async {
    setState(() {
      _subCategoryFuture = _loadSubCategory1();
    });
  }

  final options = const LiveOptions(
    delay: Duration(milliseconds: 700),
    showItemInterval: Duration(milliseconds: 500),
    showItemDuration: Duration(seconds: 1),
    visibleFraction: 0.05,
    reAnimateOnVisibility: false,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: widget.categorName, size: 55),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: FutureBuilder<List<dynamic>>(
          future: _subCategoryFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error.toString()}'));
            } else {
              return RefreshIndicator(
                onRefresh: _refreshData,
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      LiveGrid.options(
                        options: options,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                        ),
                        itemCount: snapshot.data!.length,
                        itemBuilder:
                            (context, index, Animation<double> animation) {
                          return FadeTransition(
                            opacity: Tween<double>(
                              begin: 0,
                              end: 1,
                            ).animate(animation),
                            child: SlideTransition(
                              position: Tween<Offset>(
                                begin: const Offset(0, -0.1),
                                end: Offset.zero,
                              ).animate(animation),
                              child: buildCAServiceSubCategoryItem(
                                context,
                                model: CAHomeServicesModel(
                                    image: snapshot.data![index]["cat_img"],
                                    name: snapshot.data![index]['cat_name'],
                                    id: snapshot.data![index]["id"],
                                    status: 1),
                                onTap: () {
                                  _loadSubCategory2(snapshot.data![index]["id"])
                                      .then((value) {
                                    setState(() {
                                      selectedSubCategory =
                                          snapshot.data![index]['cat_name'];
                                      subCategory2 = value;
                                      if (subCategory2.isEmpty) {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) {
                                            return CaServiceCategoryInfoScreen(
                                              categoryTitle: snapshot
                                                  .data![index]['cat_name'],
                                              id: snapshot.data![index]["id"],
                                              isCategory2: false,
                                            );
                                          },
                                        ));
                                      }
                                    });

                                    _scrollController.animateTo(
                                      _scrollController
                                          .position.maxScrollExtent,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.easeInOut,
                                    );
                                  });
                                },
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 40),
                      if (subCategory2.isNotEmpty)
                        Column(
                          children: AnimateList(
                            interval: 400.ms,
                            effects: [FadeEffect(duration: 300.ms)],
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      width: 50,
                                      height: 1,
                                      color: const Color(0xffD0CFCE)),
                                  const SizedBox(width: 10),
                                  Text(
                                    selectedSubCategory,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: ThemeColors.darkBlueColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Container(
                                      width: 50,
                                      height: 1,
                                      color: const Color(0xffD0CFCE)),
                                ],
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.5,
                                child: GridView.builder(
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    mainAxisSpacing: 20,
                                    crossAxisSpacing: 0,
                                  ),
                                  itemCount: subCategory2.length,
                                  itemBuilder: (context, index) {
                                    return buildCAServiceSubCategoryItem2(
                                      context,
                                      model: CAHomeServicesModel(
                                        image: subCategory2[index]["cat_img"],
                                        name: subCategory2[index]['cat_name'],
                                        id: subCategory2[index]["id"],
                                        status: 1,
                                      ),
                                      onTap: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) {
                                            return CaServiceCategoryInfoScreen(
                                              categoryTitle: subCategory2[index]
                                                  ['cat_name'],
                                              id: subCategory2[index]["id"],
                                              isCategory2: true,
                                            );
                                          },
                                        ));
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

Widget buildCAServiceSubCategoryItem(
  context, {
  required CAHomeServicesModel model,
  required VoidCallback onTap,
}) {
  return InkWell(
    borderRadius: appBorderRadius,
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            offset: Offset(5, -5),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            radius: 43,
            backgroundImage: NetworkImage(
              model.image ?? '',
            ),
          ),
          Center(
            child: Text(
              model.name ?? '',
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: ThemeColors.darkBlueColor,
                fontSize: 12.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildCAServiceSubCategoryItem2(
  context, {
  required CAHomeServicesModel model,
  required VoidCallback onTap,
}) {
  return InkWell(
    borderRadius: appBorderRadius,
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Card(
            shape: const StadiumBorder(),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(35),
              child: Image(
                image: NetworkImage(
                  model.image ?? '',
                ),
                fit: BoxFit.cover,
                height: 47,
                width: 47,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return const ShimmerAnimation(
                      width: 50,
                      height: 50,
                    );
                  } else {
                    return child;
                  }
                },
                errorBuilder: (context, error, stackTrace) => const Stack(
                  children: [
                    ShimmerAnimation(
                      width: 50,
                      height: 40,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: Text(
              model.name ?? '',
              textAlign: TextAlign.center,
              maxLines: 2,
              style: const TextStyle(
                color: ThemeColors.darkBlueColor,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

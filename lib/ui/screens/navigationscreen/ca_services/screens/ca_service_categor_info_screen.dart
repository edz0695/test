import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:payapp/config/route_config.dart';
import 'package:payapp/core/components/print_text.dart';
import 'package:payapp/data/api/api_client.dart';
import 'package:payapp/models/cacategorise_services.dart';
import 'package:payapp/ui/dialogs/loaderdialog.dart';
import 'package:payapp/ui/screens/navigationscreen/ca_services/screens/service_details_screen.dart';
import 'package:payapp/ui/widgets/app_bar_widget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/views/kslistviewbuilder.dart';
import '../../../../../provider/caservicesprovider/ca_services_provider.dart';
import '../ca_widget/ca_tile_widget.dart';

import 'package:http/http.dart' as http;

class CaServiceCategoryInfoScreen extends StatefulWidget {
  final String id;
  final String categoryTitle;

  final bool isCategory2;

  const CaServiceCategoryInfoScreen(
      {super.key,
      required this.id,
      required this.categoryTitle,
      required this.isCategory2});

  @override
  State<CaServiceCategoryInfoScreen> createState() =>
      _CaServiceCategoryInfoScreenState();
}

class _CaServiceCategoryInfoScreenState
    extends State<CaServiceCategoryInfoScreen> {
  @override
  void initState() {
    super.initState();
    final caServiceProvider =
        Provider.of<CaServicesProvider>(context, listen: false);
    caServiceProvider.getCategoriseServices(id: widget.id);
    caServiceProvider.isLoadingCategorised = true;
  }

  @override
  Widget build(BuildContext context) {
    Future<String> loadToken() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      printThis("Login token ${prefs.getString('token')}");
      return prefs.getString('token') ?? '';
    }

    Future callApiWithToken(String token) async {
      try {
        // Replace 'YOUR_API_ENDPOINT' with your actual API endpoint
        var apiUrl = Uri.parse(widget.isCategory2
            ? 'https://xyzabc.sambhavapps.com/v1/ca/service/sub2/${widget.id}'
            : 'https://xyzabc.sambhavapps.com/v1/ca/service/sub/${widget.id}');
        printThis(
            "Url used ${widget.isCategory2 ? 'https://xyzabc.sambhavapps.com/v1/ca/service/sub2/${widget.id}' : 'https://xyzabc.sambhavapps.com/v1/ca/service/sub/${widget.id}'}");
        var response = await http.get(
          apiUrl,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $loginToken',
          },
        );
        if (response.statusCode == 200) {
          var decodedResponse = jsonDecode(response.body);

          return decodedResponse["data"];
        } else {}
      } catch (error) {}
    }

    return Scaffold(
      appBar: AppBarWidget(title: widget.categoryTitle, size: 55),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: FutureBuilder<String>(
                future: loadToken(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    String token = snapshot.data ?? '';
                    return FutureBuilder(
                      future: callApiWithToken(token),
                      builder: (context, apiSnapshot) {
                        if (apiSnapshot.connectionState ==
                            ConnectionState.done) {
                          var res = apiSnapshot.data;
                          if (res is List) {
                            return KSListView(
                              scrollDirection: Axis.vertical,
                              separateSpace: 10,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 10,
                              ),
                              itemCount: res.length,
                              itemBuilder: (context, index) {
                                return CaTileWidget(
                                  service: CaCategoriseServiceModel(
                                      id: res[index]["id"],
                                      cross_price: res[index]["cross_price"],
                                      description: 'text',
                                      image: res[index]["logo"],
                                      price: res[index]["price"],
                                      title: res[index]["title"]),
                                  onTap: () {
                                    RouteConfig.navigateTo(
                                      context,
                                      ServiceDetailsScreen(
                                          price: '₹${res[index]["price"]}',
                                          id: res[index]["id"],
                                          title: res[index]["title"]),
                                    );
                                  },
                                );
                              },
                            );
                          }

                          return Text(res.toString());
                        } else {
                          return loading();
                        }
                      },
                    );
                  } else {
                    return loading();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../../../config/route_config.dart';
import '../screens/select_subject_screen.dart';
import 'build_class_container.dart';
import 'package:http/http.dart' as http;

class SelectClassesList extends StatelessWidget {
  const SelectClassesList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _loadToken(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          String token = snapshot.data ?? '';
          return FutureBuilder(
            future: _callApiWithToken(token),
            builder: (context, apiSnapshot) {
              if (apiSnapshot.connectionState == ConnectionState.done) {
                var res = apiSnapshot.data;
                if (res is List) {
                  return ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                    physics: BouncingScrollPhysics(),
                    itemCount: res.length,
                    itemBuilder: (context, index) {
                      return buildClassContainer(
                        context,
                        index,
                        res[index]["name"],
                        onTap: () {
                          Navigator.pop(context);
                          RouteConfig.navigateToRTL(
                              context,
                              SelectSubjectScreen(
                                classNumber: res[index]["name"],
                                classId: res[index]["id"],
                              ));
                        },
                      );
                    },
                  );
                }

                return Text(res.toString());
              } else {
                return Text("Loading");
              }
            },
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  Future<String> _loadToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ??
        ''; // Default to empty string if token is not found
  }

  Future _callApiWithToken(String token) async {
    try {
      // Replace 'YOUR_API_ENDPOINT' with your actual API endpoint
      var apiUrl =
          Uri.parse('https://xyzabc.sambhavapps.com/v1/education/class');

      var response = await http.get(
        apiUrl,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);

        return decodedResponse["data"];
      } else {
        print('API Request Failed with Status Code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error calling API: $error');
    }
  }
}

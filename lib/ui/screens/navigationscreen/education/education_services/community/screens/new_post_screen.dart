import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:payapp/provider/education_providers/community_provider.dart';
import 'package:payapp/themes/colors.dart';
import 'package:payapp/ui/screens/navigationscreen/education/education_services/community/widgets/post_text_feild.dart';
import 'package:payapp/ui/widgets/app_bar_widget.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import '../widgets/post_item.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class NewPostScreen extends StatelessWidget {
  NewPostScreen({super.key});

  final TextEditingController postController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<CommunityProvider>(
      builder: (context, provider, child) {
        return SafeArea(
          child: Scaffold(
            floatingActionButton:   Container(
              height:75,
              margin:  const EdgeInsets.symmetric(horizontal: 16.0,),
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {
                  if ((provider.imageFile != null ||
                      provider.videoFile != null ||
                      postController.text.isNotEmpty)) {}
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ).copyWith(
                  backgroundColor:
                  WidgetStateProperty.resolveWith<Color>(
                        (states) => Colors.transparent,
                  ),
                  elevation: WidgetStateProperty.all(
                      0), // Remove button shadow
                ),
                child: Ink(
                  decoration: BoxDecoration(
                    color: Color(0xff184070),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width,
                      minHeight: 52,
                    ),
                    child: const Text(
                      "Post",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
              ),
            ),
            backgroundColor: const Color(0xffF7F7F7),
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.arrow_back_ios,
                            size: 16, color: ThemeColors.primaryBlueColor),
                        const SizedBox(width: 8),
                        Text(
                          "Create Post".toUpperCase(),
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: ThemeColors.primaryBlueColor),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    Text(
                      "Choose Category",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff184070),
                      ),
                    ),
                    const SizedBox(height: 10),
                    AddImageToPost(),
                    const SizedBox(height: 20),
                    const Text(
                      'Title',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff184070),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x14000000),
                            offset: Offset(0, 10),
                            blurRadius: 20,
                          ),
                        ],
                      ),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Post Title',
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          hintStyle: TextStyle(
                              decoration: TextDecoration.none,
                              color: Color(0xff184070),
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                          border: InputBorder.none,
                        ),
                        style: const TextStyle(
                          // decoration: TextDecoration.none,
                          color: Color(0xff184070),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter title';
                          } else if (int.tryParse(value) == null) {
                            return 'Please enter a valid title';
                          }
                          return null;
                        },
                        onSaved: (value) => postController.text = value!,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Choose Image',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff184070),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const PostImageConsumer(),

                    /*  const Text(
                      'Choose Video',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff184070),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const PostVideoConsumer(),*/
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class AddImageToPost extends StatelessWidget {
  const AddImageToPost({super.key, this.ignoring = false});

  final bool ignoring;

  Future<String?> _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth-token');
  }

  Future<List<Map<String, dynamic>>> fetchCategories() async {
    final String? token = await _getToken();
    if (token == null) {
      throw Exception('JWT token not found in shared preferences');
    }

    final url =
        Uri.parse('https://xyzabc.sambhavapps.com/v1/education/pd/category');
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)["data"];
      return List<Map<String, dynamic>>.from(data);
    } else {
      throw Exception('Failed to fetch categories');
    }
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ButtonStyle(
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
      ),
      backgroundColor: WidgetStateProperty.all(ThemeColors.darkBlueColor),
      padding:
          WidgetStateProperty.all(const EdgeInsets.symmetric(horizontal: 8)),
      side: WidgetStateProperty.all<BorderSide>(
        const BorderSide(color: Colors.grey, width: 1),
      ),
    );
    return Consumer<CommunityProvider>(
      builder: (context, provider, child) =>
          FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchCategories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final categories = snapshot.data ?? [];
            return SingleChildScrollView(
              child: SizedBox(
                height: 110,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            height: 75,
                            width: 75,
                            decoration: BoxDecoration(
                              color: const Color(0xffffffff),
                              shape: BoxShape.circle,
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x14000000),
                                  offset: Offset(0, 10),
                                  blurRadius: 20,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Image.network(
                                categories[index]["logo"],
                                width: 30,
                                height: 30,
                                fit: BoxFit.cover,
                              ),
                            )),
                        SizedBox(height: 8),
                        Text(
                          categories[index]["name"],
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff184070),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

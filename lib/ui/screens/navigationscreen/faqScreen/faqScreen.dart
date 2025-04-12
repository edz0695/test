import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payapp/ui/screens/navigationscreen/faqScreen/faqItem.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

class FaqScreen extends StatefulWidget {
  final bool? show;

  const FaqScreen({super.key, this.show});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  bool isLoading = true;
  List faqs = [];

  @override
  void initState() {
    super.initState();
    _fetchFAQs();
  }

  Future<void> _fetchFAQs() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('auth-token');
      var apiUrl = Uri.parse('https://xyzabc.sambhavapps.com/v1/home/faq');

      var response = await http.get(
        apiUrl,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);
        setState(() {
          faqs = decodedResponse["data"]["allData"];
          isLoading = false; // Update loading state
        });
      } else {
        setState(() {
          isLoading = false; // Update loading state even if request fails
        });
      }
    } catch (error) {
      setState(() {
        isLoading = false; // Update loading state in case of error
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            widget.show != null ? buildHeader(context) : const SizedBox(),
            Expanded(
              child: isLoading
                  ? Center(
                      child:
                          CircularProgressIndicator()) // Show loading indicator while fetching FAQs
                  : faqs.isEmpty
                      ? Center(
                          child: Text(
                              'No FAQs available')) // Show message if no FAQs are available
                      : ListView.separated(
                          padding: EdgeInsets.only(
                              top: 15,
                              left: 15,
                              right: 15,
                              bottom: widget.show != null ? 15 : 115),
                          itemBuilder: (_, index) {
                            return FaqListItem(
                              question: faqs[index]["question"],
                              answer: faqs[index]["answer"],
                            );
                          },
                          separatorBuilder: (_, index) {
                            return const SizedBox(height: 15);
                          },
                          itemCount: faqs.length,
                        ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(200),
              onTap: () {
                Navigator.pop(context);
              },
              child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(Icons.arrow_left, size: 25)),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                "FAQ",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500, letterSpacing: 1),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

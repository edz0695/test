import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ReferralLeaderBoard extends StatefulWidget {
  const ReferralLeaderBoard({super.key});

  @override
  State<ReferralLeaderBoard> createState() => _ReferralLeaderBoardState();
}

class _ReferralLeaderBoardState extends State<ReferralLeaderBoard> {
  List<LeaderBoardData> leaders = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchLeaderData();
  }

  Future<void> fetchLeaderData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('auth-token') ?? '';

    try {
      final response = await http.get(
        Uri.parse(
            'https://xyzabc.sambhavapps.com/v1/user/leaderboard?page=1&limit=100'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        final decodedResponse = jsonDecode(response.body);
        if (decodedResponse['message'] == 'Users fetched successfully') {
          for (var i in decodedResponse['data']) {
            leaders.add(LeaderBoardData(
              name: i['name'],
              price: i['totalReferralAmount'].toDouble(),
              email: i['email'],
              logo: i['logo'],
            ));
          }
        } else {
          throw Exception(
              'Failed to load shorts: ${decodedResponse['message']}');
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          right: 0,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                transform:
                                    Matrix4.translationValues(-30, 45, 0),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 30,
                                      width: 30,
                                      child: CircleAvatar(
                                        backgroundColor: getRandomColor(),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(
                                              leaders[1]
                                                  .name
                                                  .substring(0, 2)
                                                  .toUpperCase(),
                                              style: GoogleFonts.poppins(
                                                  fontSize: 10,
                                                  color: Colors.white)),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 3),
                                    Text(
                                      leaders[1].name,
                                      style: GoogleFonts.poppins(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                transform: Matrix4.translationValues(0, -10, 0),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 30,
                                      width: 30,
                                      child: CircleAvatar(
                                        backgroundColor: getRandomColor(),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(
                                              leaders[0]
                                                  .name
                                                  .substring(0, 2)
                                                  .toUpperCase(),
                                              style: GoogleFonts.poppins(
                                                  fontSize: 10,
                                                  color: Colors.white)),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      leaders[0].name,
                                      style: GoogleFonts.poppins(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                transform: Matrix4.translationValues(30, 60, 0),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 30,
                                      width: 30,
                                      child: CircleAvatar(
                                        backgroundColor: getRandomColor(),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(
                                              leaders[2]
                                                  .name
                                                  .substring(0, 2)
                                                  .toUpperCase(),
                                              style: GoogleFonts.poppins(
                                                  fontSize: 10,
                                                  color: Colors.white)),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 3),
                                    Text(
                                      leaders[2].name,
                                      style: GoogleFonts.poppins(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  height: 100,
                                  width: 100,
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFF006ca5),
                                        Color(0xFF0496C7)
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10)),
                                  ),
                                  child: Center(
                                    child: Text("2",
                                        style: GoogleFonts.poppins(
                                            fontSize: 28,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white)),
                                  )),
                              Container(
                                  height: 150,
                                  width: 120,
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFF006ca5),
                                        Color(0xFF0496C7)
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10)),
                                  ),
                                  child: Center(
                                    child: Text("1",
                                        style: GoogleFonts.poppins(
                                            fontSize: 28,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white)),
                                  )),
                              Container(
                                  height: 80,
                                  width: 100,
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFF006ca5),
                                        Color(0xFF0496C7)
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10)),
                                  ),
                                  child: Center(
                                    child: Text("3",
                                        style: GoogleFonts.poppins(
                                            fontSize: 28,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white)),
                                  )),
                            ],
                          ),
                        )
                      ],
                    )),
                const SizedBox(height: 25),
                Text("Current Leaderboards",
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                      itemCount: leaders.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: getRandomColor(),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                            leaders[index]
                                                .name
                                                .substring(0, 2)
                                                .toUpperCase(),
                                            style: GoogleFonts.poppins(
                                                color: Colors.white)),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      leaders[index].name,
                                      style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                Text(
                                  "₹ ${leaders[index].price.toStringAsFixed(0)}",
                                  style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xff01C25F)),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Divider(color: Colors.grey.shade300),
                            const SizedBox(height: 12)
                          ],
                        );
                      }),
                )
              ],
            ),
    );
  }

  Color getRandomColor() {
    final Random random = Random();
    return Color.fromRGBO(
      random.nextInt(256), // Red
      random.nextInt(256), // Green
      random.nextInt(256), // Blue
      1.0, // Opacity
    );
  }
}

class LeaderBoardData {
  String name;
  String email;
  String logo;
  double price;

  LeaderBoardData(
      {required this.name,
      required this.price,
      required this.email,
      required this.logo});
}

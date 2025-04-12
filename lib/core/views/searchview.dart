import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payapp/core/views/kslistviewbuilder.dart';
import 'package:payapp/themes/colors.dart';

class SearchView extends SearchDelegate<String> {
  final List list;
  SearchView({required this.list});

  @override
  void showResults(BuildContext context) {}

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
        scaffoldBackgroundColor: Colors.blue.shade50,
        appBarTheme: const AppBarTheme(
          color: ThemeColors.primaryBlueColor,
          elevation: 0,
          titleSpacing: 0,
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
            hintStyle: GoogleFonts.poppins(color: Colors.white.withOpacity(.8)),
            focusedBorder: InputBorder.none,
            border: InputBorder.none,
            enabledBorder: InputBorder.none));
  }

  @override
  String get searchFieldLabel => "Search by Name or number";

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(1000),
      onTap: () {
        close(context, "");
      },
      child: const Icon(
        Icons.arrow_left,
        size: 25,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    close(context, "");
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final searchList = list
        .where((element) =>
            element.name.toString().toLowerCase().startsWith(query) ||
            element.number.toString().toLowerCase().startsWith(query))
        .toList();
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: searchList.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/no_data.svg',
                    height: 100,
                    width: 100,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "No match found.",
                    style: GoogleFonts.poppins(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            : KSListView(
                itemCount: searchList.length,
                padding: const EdgeInsets.symmetric(vertical: 10),
                scrollDirection: Axis.vertical,
                separateSpace: 5,
                itemBuilder: (context, index) {
                  return Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () async {
                        close(context, searchList[index].number);
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        height: 60,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "https://9to5google.com/wp-content/uploads/sites/4/2022/02/flutter-windows-promo.jpg?quality=82&strip=all&w=1600")),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    searchList[index].name,
                                    style: GoogleFonts.poppins(
                                        color: Colors.black),
                                  ),
                                  Text(
                                    searchList[index].number,
                                    style: GoogleFonts.poppins(
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ));
  }
}

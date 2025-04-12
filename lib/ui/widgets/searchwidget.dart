import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchWidget extends StatelessWidget {
  final Function()? onTap;
  const SearchWidget({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(1000),
      onTap: onTap,
      child: Container(
        color: Colors.blue.shade50,
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          height: 55,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 7),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(1000)),
          child: Row(
            children: [
              const Icon(Icons.search),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "Search by Name or Number",
                  style: GoogleFonts.poppins(color: Colors.grey, fontSize: 15),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

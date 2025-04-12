import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class DetailsWidget extends StatelessWidget {
  final String title;
  final String detail;
  const DetailsWidget({super.key,required this.title, required this.detail});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.poppins(
                color: Colors.black54,
                fontSize: MediaQuery.of(context).size.width * .04,
                letterSpacing: 1,
                fontWeight: FontWeight.normal),
          ),
        ),
        const SizedBox(height: 7,),
        Container(
            height: 50,
            width: double.infinity,
            padding:const EdgeInsets.only(left: 15),
            decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 20.0,
                ),
              ],
            ),

            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  detail,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.width * .05,
                      letterSpacing: 1,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ))
      ],
    );
  }
}

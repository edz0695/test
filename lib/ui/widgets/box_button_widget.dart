import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payapp/themes/colors.dart';

class BoxButtonWidget extends StatelessWidget {
  final String title;
  final String pngIconPath;
  final Function()? onTap;
  final IconData? iconData;
  final bool withShadow;

  const BoxButtonWidget({
    super.key,
    required this.title,
    required this.pngIconPath,
    this.onTap,
    this.iconData,
    this.withShadow = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: withShadow
                ? [
                    BoxShadow(
                      offset: const Offset(0, 4),
                      color: ThemeColors.primaryBlueColor.withOpacity(0.65),
                      blurRadius: 10.0,
                      spreadRadius: 3,
                    ),
                  ]
                : [],
          ),
          child: InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.black.withOpacity(.08),
            onTap: onTap,
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: iconData != null
                  ? Center(
                      child: Icon(
                        iconData,
                        color: ThemeColors.blueColor1,
                        size: 30,
                      ),
                    )
                  : (pngIconPath).startsWith('http')
                      ?
                      // If it's a network image
                      Image.network(
                          pngIconPath,
                          color: const Color(0xff2057A6),
                          height: 20,
                          width: 20,
                        )
                      : Image.asset(
                          pngIconPath,
                          color: const Color(0xff2057A6),
                          height: 20,
                          width: 20,
                        ),
            ),
          ),
        ),
        const SizedBox(
          height: 7,
        ),
        Text(
          title,
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: MediaQuery.of(context).size.width * .030,
          ),
          maxLines: 1,
          overflow: TextOverflow.fade,
        )
      ],
    );
  }
}

class BoxButtonStudentWidget extends StatelessWidget {
  final String title;
  final String pngIconPath;
  final Function()? onTap;
  final IconData? iconData;
  final bool withShadow;

  const BoxButtonStudentWidget({
    super.key,
    required this.title,
    required this.pngIconPath,
    this.onTap,
    this.iconData,
    this.withShadow = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: withShadow
                ? [
                    BoxShadow(
                        offset: const Offset(0, 4),
                        color: ThemeColors.primaryBlueColor.withOpacity(0.65),
                        blurRadius: 10.0,
                        spreadRadius: 3),
                  ]
                : [],
          ),
          child: InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.black.withOpacity(.08),
            onTap: onTap,
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: iconData != null
                  ? Center(
                      child: Icon(
                        iconData,
                        color: ThemeColors.blueColor1,
                        size: 40,
                      ),
                    )
                  : Image.asset(
                      pngIconPath,
                      color: const Color(0xff2057A6),
                      height: 40,
                      width: 40,
                    ),
            ),
          ),
        ),
        const SizedBox(
          height: 7,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 10,
            fontWeight: FontWeight.w500
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}

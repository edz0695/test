import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ProfileListTile extends StatelessWidget {
  final Function()? onTap;
  final String title;
  final IconData icon;
  const ProfileListTile({super.key,this.onTap,required this.title,required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap:onTap,
      child: SizedBox(
        height: 50,
        child: Row(
          children: [
            Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: const LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xff337FC9),
                      Color(0xff2057A6),
                    ],
                  )),
              child: Icon(
                icon,
                color: Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              title,
              style: GoogleFonts.poppins(letterSpacing: 1),
            )
          ],
        ),
      ),
    );
  }
}

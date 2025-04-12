import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payapp/models/scholorshipmodel.dart';
import 'package:payapp/themes/colors.dart';

import '../../../../../../../config/apiconfig.dart';

class GOVScholarshipResultItem extends StatelessWidget {
  // final SubjectModel subject;
  final ScholarshipModel scholarship;
  final String btnText;
  final Function()? onTap;
  const GOVScholarshipResultItem({
    super.key,
    required this.scholarship,
    this.onTap,
    required this.btnText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          splashColor: ThemeColors.primaryBlueColor.withOpacity(.05),
          highlightColor: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                      color: ThemeColors.primaryBlueColor.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: const Offset(0, 1))
                ]),
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: PageView.builder(
                      itemCount: scholarship.banner.length,
                      itemBuilder: (context, index) {
                        return Image.network(
                          Constants.forImg + scholarship.banner[index],
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[300],
                              child: const Center(
                                  child: Text('Image failed to load')),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  margin: const EdgeInsets.only(bottom: 20, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 150,
                            child: Text(
                              scholarship.title,
                              maxLines: 2,
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: const Color.fromARGB(255, 12, 1, 1)),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            width: 150,
                            child: Text(
                              scholarship.details,
                              maxLines: 3,
                              style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  color: const Color.fromARGB(255, 12, 1, 1)),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            left: 15, top: 10, bottom: 10, right: 15),
                        decoration: BoxDecoration(
                            color: ThemeColors.primaryBlueColor,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: ThemeColors.primaryBlueColor
                                      .withOpacity(0.2),
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset: const Offset(0, 2))
                            ]),
                        child: Text(
                          btnText,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

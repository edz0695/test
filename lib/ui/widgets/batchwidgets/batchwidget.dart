import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payapp/models/batch_model.dart';
import 'package:payapp/themes/colors.dart';



class BatchTile extends StatelessWidget {
  // final SubjectModel subject;
  final BatchModel batch;
  final Function()? onTap;
  const BatchTile({super.key, required this.batch,this.onTap});

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
                color: const Color.fromARGB(255, 70, 91, 212).withOpacity(0.1),
                borderRadius: BorderRadius.circular(12)
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              batch.description,
                              style: GoogleFonts.poppins(
                                  fontSize: 16, color: const Color.fromARGB(255, 12, 1, 1)),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ]
                      ),
                    ],
                  ),

                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        child: Expanded(child: Text('class:-${batch.classes} Subject:- ${batch.subject}',
                          style: GoogleFonts.poppins(
                              fontSize: 13, color: const Color.fromARGB(255, 12, 1, 1)),
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                      )
                    ]
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

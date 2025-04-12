import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../../config/apiconfig.dart';
import '../../../../../../models/earnbanksmodel.dart';


class EarnBanksWidget extends StatelessWidget {
  final EarnBanksModel earnBanksModel;
  final Function()? onTap;
  const EarnBanksWidget({super.key ,required this.earnBanksModel,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(3, 3),
            color: const Color(0xff2057A6).withOpacity(0.1),
            blurRadius: 10,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          highlightColor: Colors.transparent,
          onTap:onTap,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Expanded(
                  child: Image(
                    image: NetworkImage(
                        Constants.forImg + earnBanksModel.image),
                    fit: BoxFit.contain,
                  ),
                ),
                Text(
                  earnBanksModel.bankName.toUpperCase(),
                  maxLines: 1,
                  style:
                  GoogleFonts.poppins(fontSize: 12),
                ),
                const SizedBox(height: 5),
                Text(
                  'Earn ₹200',
                  style: GoogleFonts.poppins(
                      fontSize: 13,
                    color: const Color(0xff2057A6),),
                  maxLines: 1,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

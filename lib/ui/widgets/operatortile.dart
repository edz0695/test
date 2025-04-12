import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payapp/themes/colors.dart';
import '../../models/operatormodel.dart';

class OperatorsTile extends StatelessWidget {
  final OperatorModel operatorModel;
  final Function()? onTap;

  const OperatorsTile({super.key, required this.operatorModel, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          height: 60,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1000),
                    border:
                        Border.all(color: ThemeColors.primaryBlueColor, width: .5)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(1000),
                  child: Image.network(
                    operatorModel.billerLogoURL,
                    fit: BoxFit.cover,
                    errorBuilder: (context, object, stack) {
                      return Container(
                        color: ThemeColors.blueColor1,
                        child: Center(
                          child: Text(
                              operatorModel.name.substring(0, 2).toUpperCase(),
                              style: GoogleFonts.poppins(color: Colors.white)),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                  child: Text(
                operatorModel.name,
                style: GoogleFonts.poppins(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )),
            ],
          ),
        ),
      ),
    );
  }
}

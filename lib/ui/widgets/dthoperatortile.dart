import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payapp/models/rechargeservicesmodels/dth/dthoperatormodel.dart';


class DthOperatorsTile extends StatelessWidget {
  final DthOperatorModel dthOperatorModel;
  final Function()? onTap;
  const DthOperatorsTile({super.key,required this.dthOperatorModel,this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          height: 60,
          child: Row(crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(dthOperatorModel.name.substring(0,2).toUpperCase(),style:GoogleFonts.poppins(color: Colors.white)),
                ),

              ),
              const SizedBox(width: 15,),

              Expanded(child: Text(dthOperatorModel.name,style: GoogleFonts.poppins(),maxLines: 2,overflow: TextOverflow.ellipsis,)),
            ],
          ),
        ),
      ),
    );
  }
}

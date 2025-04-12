import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/views/kslistviewbuilder.dart';
import '../../../../provider/education_providers/education_provider.dart';
import '../../../../themes/colors.dart';




class SelectCompetitiveScreenWidget extends StatefulWidget {
  const SelectCompetitiveScreenWidget({super.key});

  @override
  State<SelectCompetitiveScreenWidget> createState() => _SelectCompetitiveScreenWidgetState();
}

class _SelectCompetitiveScreenWidgetState extends State<SelectCompetitiveScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<EductionFormProvider>(
        builder: (context, educationProvider, child) {
          return KSListView(
            scrollDirection: Axis.vertical,
            scrollPhysics: const ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              return InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: (){
                  educationProvider.selectionList[index] = !educationProvider.selectionList[index];

                  educationProvider.notifyListeners();
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),

                  height: 50,
                  decoration: BoxDecoration(
                      color:  educationProvider.selectionList[index]?ThemeColors.blueColor1:Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(educationProvider.exams[index].examName,style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.05,color: educationProvider.selectionList[index]?Colors.white:Colors.black),),
                      // Icon(Iconsax.arrow_right,color: educationProvider.selectedBoard!=null?educationProvider.selectedBoard==index?Colors.white:Colors.black:Colors.black,)
                    ],
                  ),
                ),
              );
            },
            itemCount: educationProvider.exams.length,
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            separateSpace:20,
          );
        });
  }
}

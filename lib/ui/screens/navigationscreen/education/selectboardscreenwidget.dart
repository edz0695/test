import 'package:flutter/material.dart';
import 'package:payapp/themes/colors.dart';
import 'package:provider/provider.dart';

import '../../../../core/views/kslistviewbuilder.dart';
import '../../../../provider/education_providers/education_provider.dart';

class SelectBoardScreen extends StatefulWidget {
  const SelectBoardScreen({
    super.key,
  });

  @override
  State<SelectBoardScreen> createState() => _SelectBoardScreenState();
}

class _SelectBoardScreenState extends State<SelectBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer<EductionFormProvider>(
            builder: (context, educationProvider, child) {
          return KSListView(
            scrollDirection: Axis.vertical,
            scrollPhysics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  educationProvider.selectedBoard = index;
                  educationProvider.notifyListeners();
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  height: 50,
                  decoration: BoxDecoration(
                      color: educationProvider.selectedBoard != null
                          ? educationProvider.selectedBoard == index
                              ? ThemeColors.blueColor1
                              : Colors.grey.withOpacity(0.1)
                          : Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        educationProvider.boards[index].boardName,
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                            color: educationProvider.selectedBoard != null
                                ? educationProvider.selectedBoard == index
                                    ? Colors.white
                                    : Colors.black
                                : Colors.black),
                      ),
                      // Icon(Iconsax.arrow_right,color: educationProvider.selectedBoard!=null?educationProvider.selectedBoard==index?Colors.white:Colors.black:Colors.black,)
                    ],
                  ),
                ),
              );
            },
            itemCount: educationProvider.boards.length,
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            separateSpace: 20,
          );
        }),
      ],
    );
  }
}

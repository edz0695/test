import 'package:flutter/material.dart';

import '../../../../../../../themes/colors.dart';

InkWell buildClassContainer(context, index, classNumber,
    {required VoidCallback onTap}) {
  index++;
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(20),
    child: Container(
      padding: const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
      decoration: BoxDecoration(
        color: ThemeColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 55,
            height: 55,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xffBBDEFB),
              ),
              child: Text(
                index.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: ThemeColors.darkBlueColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  classNumber,
                  style: const TextStyle(
                    color: ThemeColors.darkBlueColor,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // const Text(
                //   '234 subject',
                //   style: TextStyle(
                //     color: Colors.grey,
                //     fontSize: 14.0,
                //     fontWeight: FontWeight.w700,
                //   ),
                // ),
              ],
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () {},
            child: const Icon(
              Icons.double_arrow_outlined,
              color: ThemeColors.primaryBlueColor,
            ),
          ),
        ],
      ),
    ),
  );
}

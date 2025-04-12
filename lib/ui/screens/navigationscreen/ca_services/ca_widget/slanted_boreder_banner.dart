import 'package:flutter/material.dart';

import '../../../../../themes/colors.dart';



class SlantedBorderBanner extends StatelessWidget {
  const SlantedBorderBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 80,
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          const BorderImage(),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 35),
            width: 250,
            child: const Text(
              'Below is the training video to train yourself',
              maxLines: 3,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class BorderImage extends StatelessWidget {
  const BorderImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .75,
      child: Image.asset(
        'assets/images/banner_border.png',

      ),
    );
  }
}

Container buildCustomDropButton(bool visible) {
  return Container(
    height: 50,
    width: 50,
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      color: ThemeColors.primaryBlueColor,
      boxShadow: [
        BoxShadow(
          color: ThemeColors.primaryBlueColor,
          offset: Offset(0, 0),
          blurStyle: BlurStyle.outer,
          blurRadius: 5.0,
          spreadRadius: 1,
        ),
      ],
    ),
    child:  Center(
      child: Icon(
        visible? Icons.keyboard_arrow_up_rounded:Icons.keyboard_arrow_down_rounded,
        color: Colors.white,
        size: 50,
      ),
    ),
  );
}

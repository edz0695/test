import 'package:payapp/controller/auth_controller.dart';
import 'package:payapp/helper/route_helper.dart';
import 'package:payapp/util/dimensions.dart';
import 'package:payapp/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConditionCheckBox extends StatelessWidget {
  final AuthController authController;
  final bool fromSignUp;
  const ConditionCheckBox(
      {super.key, required this.authController, this.fromSignUp = false});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment:
            fromSignUp ? MainAxisAlignment.start : MainAxisAlignment.center,
        children: [
          fromSignUp
              ? Checkbox(
                  activeColor: Theme.of(context).primaryColor,
                  visualDensity:
                      const VisualDensity(horizontal: -4, vertical: -4),
                  value: authController.acceptTerms,
                  onChanged: (bool? isChecked) => authController.toggleTerms(),
                )
              : const SizedBox(),
          Text(
              fromSignUp
                  ? 'i_agree_with_all_the'.tr
                  : 'by_login_i_agree_with_all_the'.tr,
              style: robotoRegular.copyWith(
                  color: fromSignUp
                      ? Theme.of(context).textTheme.bodyMedium!.color
                      : Theme.of(context).hintColor,
                  fontSize: fromSignUp
                      ? Dimensions.fontSizeDefault
                      : Dimensions.fontSizeSmall)),
          Expanded(
              child: InkWell(
            onTap: () =>
                Get.toNamed(RouteHelper.getHtmlRoute('terms-and-condition')),
            child: Padding(
              padding: const EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
              child: Text('terms_conditions'.tr,
                  style: robotoMedium.copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor)),
            ),
          )),
        ]);
  }
}

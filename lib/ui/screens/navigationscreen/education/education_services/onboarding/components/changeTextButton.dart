import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payapp/ui/screens/navigationscreen/education/educationform.dart';
import 'package:provider/provider.dart';

import '../../../../../../../provider/education_providers/education_provider.dart';
import '../../../../../../../themes/colors.dart';

class ChangeTextButton extends StatefulWidget {
  final PageController pageController;
  final int length;
  const ChangeTextButton({super.key,required this.pageController,required this.length});

  @override
  State<ChangeTextButton> createState() => _ChangeTextButtonState();
}

class _ChangeTextButtonState extends State<ChangeTextButton> {
  @override
  void initState() {

    super.initState();
    widget.pageController.addListener(() {
        setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: ThemeColors.primaryBlueColor.withOpacity(0.2),
        highlightColor: Colors.transparent,
        borderRadius: BorderRadius.circular(7),
        onTap: () async {
          if (widget.pageController.page!=null && widget.pageController.page!>=((widget.length)/2)) {
            final educationFormProvider = Provider.of<EductionFormProvider>(context, listen: false);

            await educationFormProvider
                .doneOnBoarding()
                .then((value) {
              Navigator.pushReplacement(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => const EducationFormScreen()),
                      );
            });
          }
          else {
            widget.pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut);
          }
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 20, vertical: 15),
            child: widget.pageController.page!=null && widget.pageController.page!>=((widget.length)/2)
                ? const Text(
              "DONE",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ThemeColors.primaryBlueColor),
            )
                : const Text(
              "NEXT",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ThemeColors.primaryBlueColor),
            ),
          ),
        ),
      ),
    );
  }
}

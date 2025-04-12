import 'package:flutter/material.dart';
import 'package:payapp/themes/colors.dart';

class FaqListItem extends StatefulWidget {
  final String? question;
  final String? answer;
  final Color? defaultColor;

  const FaqListItem({super.key, this.answer, this.question, this.defaultColor});

  @override
  State<FaqListItem> createState() => _FaqListItemState();
}

class _FaqListItemState extends State<FaqListItem> {
  bool open = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
              color: open
                  ? ThemeColors.primaryBlueColor
                  : widget.defaultColor ?? Colors.white,
              borderRadius: open
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))
                  : BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(.02),
                    blurRadius: 20,
                    spreadRadius: 10)
              ]),
          child: Row(
            children: [
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Text(
                  widget.question ?? "Question",
                  style: TextStyle(
                    color: open ? Colors.white : Colors.black,
                    fontSize: MediaQuery.of(context).size.width * 0.048,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                    borderRadius: BorderRadius.circular(1000),
                    onTap: () {
                      setState(() {
                        open = !open;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Icon(
                        open ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                        color: open ? Colors.white : Colors.black,
                      ),
                    )),
              )
            ],
          ),
        ),
        AnimatedSize(
          curve: Curves.easeInOutCubicEmphasized,
          duration: const Duration(milliseconds: 500),
          child: open
              ? Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(.02),
                            blurRadius: 20,
                            spreadRadius: 10)
                      ]),
                  child: Text(
                    widget.answer ??
                        "One Rupee consists of 100 Paise. The symbol of the Indian Rupee is ₹. The design resembles both the Devanagari letter  (ra) and the Latin capital letter , with a double horizontal line at the top.",
                    style: const TextStyle(
                        fontSize: 16,
                        height: 1.7,
                        fontWeight: FontWeight.normal),
                    textAlign: TextAlign.justify,
                  ),
                )
              : const SizedBox(),
        ),
      ],
    );
  }
}

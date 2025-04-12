import 'package:flutter/material.dart';
import 'package:payapp/themes/colors.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/utils/helper/helper.dart';

class SupportWidgetForNavDrawer extends StatefulWidget {
  final String? question;
  final String? answer;
  final Color? defaultColor;
  final String label;
  final IconData icon;
  const SupportWidgetForNavDrawer(
      {super.key,
      this.answer,
      this.question,
      this.defaultColor,
      required this.label,
      required this.icon});

  @override
  State<SupportWidgetForNavDrawer> createState() =>
      _SupportWidgetForNavDrawerState();
}

class _SupportWidgetForNavDrawerState extends State<SupportWidgetForNavDrawer> {
  bool open = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
          height: 52,
          width: double.infinity,
          decoration: BoxDecoration(
              color: open ? ThemeColors.primaryBlueColor : Colors.transparent,
              // borderRadius: open
              //     ? BorderRadius.only(
              //     topLeft: Radius.circular(20),
              //     topRight: Radius.circular(20))
              //     : BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(.02),
                    blurRadius: 20,
                    spreadRadius: 10)
              ]),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                setState(() {
                  open = !open;
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: Row(
                  children: [
                    Icon(
                      widget.icon,
                      color: Colors.indigo,
                    ),
                    width(15),
                    Expanded(
                      child: Text(
                        widget.label,
                        style: TextStyle(
                          color: open ? Colors.white : Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        AnimatedSize(
          curve: Curves.easeInOutCubicEmphasized,
          duration: const Duration(milliseconds: 500),
          child: open
              ? Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      // borderRadius: BorderRadius.only(
                      //     bottomLeft: Radius.circular(20),
                      //     bottomRight: Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(.02),
                            blurRadius: 20,
                            spreadRadius: 10)
                      ]),
                  child: GestureDetector(
                    onTap: () {
                      // code to open url https://sambhavapps.com/contact-us/
                      void openUrl() async {
                        const url = 'https://sambhavapps.com/contact-us/';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      }

                      openUrl();
                    },
                    child: Container(
                      height: 80,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Center(child: Icon(Icons.support_agent_outlined)),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Contact Us",
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 14),
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: Container(
                  //         height: 80,
                  //         padding: const EdgeInsets.all(10),
                  //         decoration: BoxDecoration(
                  //             color: Colors.grey.shade100,
                  //             borderRadius: BorderRadius.circular(10)),
                  //         child: const Column(
                  //           children: [
                  //             Expanded(child: Center(child: Icon(Icons.support_agent_outlined))),
                  //             Text("Account Manager",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 14),maxLines: 2,textAlign: TextAlign.center,),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //     const SizedBox(width: 10,),
                  //     Expanded(
                  //       child: Container(
                  //         height: 80,
                  //         padding: const EdgeInsets.all(10),
                  //         decoration: BoxDecoration(
                  //             color: Colors.grey.shade100,
                  //             borderRadius: BorderRadius.circular(10)),
                  //         child: const Column(
                  //           children: [
                  //             Expanded(child: Center(child: Icon(Icons.call))),
                  //             Text("Call Us",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 14),maxLines: 1,),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //     const SizedBox(width: 10,),
                  //     Expanded(
                  //       child: Container(
                  //         height: 80,
                  //         padding: const EdgeInsets.all(10),
                  //         decoration: BoxDecoration(
                  //             color: Colors.grey.shade100,
                  //             borderRadius: BorderRadius.circular(10)),
                  //         child: const Column(
                  //           children: [
                  //             Expanded(child: Center(child: Icon(Icons.email))),
                  //             Text("Email Us",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 14),maxLines: 1,),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                )
              : const SizedBox(),
        ),
      ],
    );
  }
}

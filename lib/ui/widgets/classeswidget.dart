import 'package:flutter/material.dart';
import 'package:payapp/themes/colors.dart';

import '../../models/classes_and_exam_model.dart';

class ClassesWidget extends StatefulWidget {
  final ClassesModel classesModel;
  final Function()? onTap;
  final bool selected ;

  const ClassesWidget(
      {super.key, required this.classesModel, required this.onTap,required this.selected});

  @override
  State<ClassesWidget> createState() => _ClassesWidgetState();
}

class _ClassesWidgetState extends State<ClassesWidget> {


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),

        // border: Border.all(color: ThemeColors.bluecolor,width: 1),
        // boxShadow: [
        //   BoxShadow(
        //     offset: Offset(3, 3),
        //     color: Color(0xff2057A6).withOpacity(0.1),
        //     blurRadius: 10,
        //   ),
        // ],
      ),
      child: Material(
        color: widget.selected?ThemeColors.blueColor1:Colors.grey.withOpacity(.2),
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          highlightColor: Colors.transparent,
          onTap: widget.onTap,
          child: Column(
            children: [
              Expanded(
                  child: Center(child: Text(widget.classesModel.name,style: TextStyle(color: widget.selected?Colors.white:Colors.black,fontWeight: FontWeight.bold,fontSize:40 ),))
              ),
              // categoryModel.image != null
              //     ? SizedBox(
              //         height: 7,
              //       )
              //     : Container(),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 5),
              //   child: Text(
              //     "${categoryModel.name}",
              //     maxLines: 2,
              //     textAlign: TextAlign.center,
              //     style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
              //     softWrap: true,
              //     overflow: TextOverflow.ellipsis,
              //   ),
              // ),
              // SizedBox(
              //   height: 10,
              // )
            ],
          ),
        ),
      ),
    );
  }
}

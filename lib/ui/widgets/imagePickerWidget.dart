import 'dart:convert';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:payapp/core/components/print_text.dart';

import '../../core/utils/helper/helper.dart';
import '../../themes/colors.dart';


class ImagePickerWidget extends StatefulWidget {
  late String? pickedFile;
  final String label;
  final ValueChanged<File?>? onPicked;
  ImagePickerWidget({super.key,this.pickedFile,required this.label,this.onPicked});

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  final _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0,top: 15),
          child: Text(
            "${widget.label[0].toUpperCase()}${widget.label.substring(1).toLowerCase()}",
            // widget.title.toUpperCase(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.poppins(
                color: Colors.black54,
                fontSize: MediaQuery.of(context).size.width * .04,
                letterSpacing: 1,
                fontWeight: FontWeight.normal),
          ),
        ),
        const SizedBox(height: 10,),
        DottedBorder(
            borderType: BorderType.RRect,
            radius: const Radius.circular(10),
            dashPattern: const [5, 5],
            color: ThemeColors.primaryBlueColor.withOpacity(0.2),
            strokeWidth: 1,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Material(
                    color: widget.pickedFile!=null?Colors.green.shade50:Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      splashColor: Colors.blue.shade100,
                      highlightColor: Colors.transparent,
                      onTap: widget.pickedFile!=null?null:() async {
                        final pickedFile =
                        await _picker.pickImage(
                            source: ImageSource.gallery,
                            imageQuality: 80);
                        if (pickedFile != null) {

                          List<int> imageBytes = File(pickedFile.path).readAsBytesSync();
                          String base64Image = base64Encode(imageBytes);
                          widget.pickedFile = base64Image;
                          printThis(base64Image);
                          if(widget.onPicked!=null){
                            widget.onPicked!(File(pickedFile.path));
                          }

                         setState(() {

                         });
                        } else {
                          Helper.showScaffold(
                              context, "No Image Picked");
                        }
                      },
                      child: Container(
                        height: 120,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Upload ${widget.label} here",
                                        style:
                                        GoogleFonts.poppins(
                                            fontWeight:
                                            FontWeight
                                                .bold,
                                            letterSpacing: 1),
                                        maxLines: 1,
                                        overflow:
                                        TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Please make sure that every detail of the ID document is clearly visible.',
                                        style:
                                        GoogleFonts.poppins(
                                            color:
                                            Colors.grey,
                                            fontSize: 10),
                                        maxLines: 2,
                                        overflow:
                                        TextOverflow.ellipsis,
                                      )
                                    ],
                                  ),
                                )),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Icon(Icons.cloud_upload_outlined,size: 40,color: ThemeColors.primaryBlueColor,),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: widget.pickedFile!=null?
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(1000),
                      onTap: (){
                        widget.pickedFile = null;
                        if(widget.onPicked!=null){
                          widget.onPicked!(null);
                        }
                        setState(() {

                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        height: 20,
                        width: 20,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green),
                        child: const Icon(
                          Icons.cancel_outlined,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ):Container()
                ),
              ],
            )),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:payapp/core/components/print_text.dart';
import 'package:provider/provider.dart';

import '../../../../../../../provider/loginSignUpProvider.dart';
import '../../../../../../../services/apis/apiservice.dart';
import '../../../../../../../themes/colors.dart';
import '../../../../../../dialogs/loaderdialog.dart';
import '../../../../../../widgets/formfieldwidget.dart';

class TeacherBatchesForm extends StatefulWidget {
  const TeacherBatchesForm({super.key});

  @override
  State<TeacherBatchesForm> createState() => _TeacherBatchesFormState();
}

class _TeacherBatchesFormState extends State<TeacherBatchesForm> {
  final _classname = TextEditingController();
  final _subjectname = TextEditingController();
  final _description = TextEditingController();
  final _dateInput = TextEditingController();
  final _startdateController = TextEditingController();
  final _enddateController = TextEditingController();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileController = TextEditingController();
  final _bioController = TextEditingController();
  final _subjectsController = TextEditingController();
  final _villageController = TextEditingController();
  final _districtController = TextEditingController();
  final _zipcodeController = TextEditingController();
  final _stateController = TextEditingController();
  final fillColor = Colors.grey.shade100;   
  
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.white),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  children: [
                    FormFieldWidget(
                        title: "Class",
                        editingController: _classname,
                        fillColor: fillColor),
                    FormFieldWidget(
                        title: "Subject",
                        editingController: _subjectname,
                        fillColor: fillColor),
                    
                    FormFieldWidget(
                        title: "Description",
                        editingController: _bioController,
                        fillColor: fillColor),
                        TextField(
                            controller: _startdateController, //editing controller of this TextField
                              decoration: const InputDecoration( 
                                        icon: Icon(Icons.calendar_today), //icon of text field
                                      labelText: "Start Date" //label text of field
                                ),
                              readOnly: true,  // when true user cannot edit text 
                              onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(), //get today's date
                                        firstDate:DateTime(2000), //DateTime.now() - not to allow to choose before today.
                                        lastDate: DateTime(2101)
                                    );

                                    if(pickedDate != null ){
                                        printThis(pickedDate);  //get the picked date in the format => 2022-07-04 00:00:00.000
                                        String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                                        printThis(formattedDate); //formatted date output using intl package =>  2022-07-04
                                          //You can format date as per your need

                                        setState(() {
                                          _startdateController.text = formattedDate; //set foratted date to TextField value. 
                                        });
                                    }else{
                                        printThis("Date is not selected");
                                    }
                                      //when click we have to show the datepicker
                                }
                        ),
                        TextField(
                            controller: _enddateController, //editing controller of this TextField
                              decoration: const InputDecoration( 
                                        icon: Icon(Icons.calendar_today), //icon of text field
                                      labelText: "End Date" //label text of field
                                ),
                              readOnly: true,  // when true user cannot edit text 
                              onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(), //get today's date
                                        firstDate:DateTime(2000), //DateTime.now() - not to allow to choose before today.
                                        lastDate: DateTime(2101)
                                    );

                                    if(pickedDate != null ){
                                        printThis(pickedDate);  //get the picked date in the format => 2022-07-04 00:00:00.000
                                        String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                                        printThis(formattedDate); //formatted date output using intl package =>  2022-07-04
                                          //You can format date as per your need

                                        setState(() {
                                          _enddateController.text = formattedDate; //set foratted date to TextField value. 
                                        });
                                    }else{
                                        printThis("Date is not selected");
                                    }
                                      //when click we have to show the datepicker
                                }
                        ),   
                    
                  ],
                ),
              ),
              Material(
                color: ThemeColors.primaryBlueColor,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
                child: InkWell(
                  splashColor: Colors.white.withOpacity(.2),
                  highlightColor: Colors.transparent,
                  onTap: () {
                    showLoaderDialog(context);
                    final loginSignUpProvider =
                        Provider.of<LoginSignUpProvider>(context,
                            listen: false);
                    Map<String, dynamic> data = {
                      "teacher_id": loginSignUpProvider.userModel!.id,
                      "class": _classname.text,
                      "subject": _subjectname.text,
                      "description":_bioController.text
                    };
                    printThis(data);
                    ApiService.submitTeacherBatchForm(data: data)
                        .then((value) {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    })
                        .onError((error, stackTrace) {
                      Navigator.pop(context);
                    });
                  },
                  child: Container(
                    height: 62,
                    decoration: const BoxDecoration(
                        // color: ThemeColors.blueColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15))),
                    child: const Center(
                      child: Text(
                        "Submit",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
  }
}
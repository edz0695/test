import 'package:flutter/material.dart';
import 'package:payapp/services/apis/apiservice.dart';
import 'package:payapp/ui/dialogs/loaderdialog.dart';
import 'package:payapp/ui/widgets/app_bar_widget.dart';
import 'package:payapp/ui/widgets/formfieldwidget.dart';
import 'package:provider/provider.dart';

import '../../../../../../../provider/loginSignUpProvider.dart';
import '../../../../../../../themes/colors.dart';

class TeacherProfileForm extends StatefulWidget {
  const TeacherProfileForm({super.key});

  @override
  State<TeacherProfileForm> createState() => _TeacherProfileFormState();
}

class _TeacherProfileFormState extends State<TeacherProfileForm> {
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blue.shade50,
      appBar: const AppBarWidget(title: "Profile Setup", size: 55),
      body: Container(
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
                        title: "Name",
                        editingController: _nameController,
                        fillColor: fillColor),
                    FormFieldWidget(
                        title: "Email",
                        editingController: _emailController,
                        fillColor: fillColor),
                    FormFieldWidget(
                        title: "Mobile",
                        editingController: _mobileController,
                        fillColor: fillColor),
                    FormFieldWidget(
                        title: "Bio",
                        editingController: _bioController,
                        fillColor: fillColor),
                    FormFieldWidget(
                        title: "Subjects",
                        editingController: _subjectsController,
                        fillColor: fillColor),
                    FormFieldWidget(
                        title: "Village",
                        editingController: _villageController,
                        fillColor: fillColor),
                    FormFieldWidget(
                        title: "District",
                        editingController: _districtController,
                        fillColor: fillColor),
                    FormFieldWidget(
                        title: "ZipCode",
                        editingController: _zipcodeController,
                        fillColor: fillColor),
                    FormFieldWidget(
                        title: "state",
                        editingController: _stateController,
                        fillColor: fillColor),
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
                      "user_id": loginSignUpProvider.userModel!.id,
                      "name": _nameController.text,
                      "email": _nameController.text,
                      "mobile": _nameController.text,
                      "bio": _nameController.text,
                      "subjects": _nameController.text,
                      "village": _nameController.text,
                      "district": _nameController.text,
                      "zipcode": _nameController.text,
                      "state": _nameController.text
                    };
                    ApiService.submitTeacherProfileForm(data: data)
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
      ),
    );
  }
}

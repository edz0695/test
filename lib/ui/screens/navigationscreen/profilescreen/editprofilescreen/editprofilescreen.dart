import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payapp/core/utils/validator/validator.dart';

import '../../../../../themes/colors.dart';
import '../../../../widgets/editdetailswidget.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final designation = TextEditingController();
  final classDuration = TextEditingController();
  final teachingMode = TextEditingController();
  final language = TextEditingController();
  final subject = TextEditingController();
  final fee = TextEditingController();
  final location = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark // status bar color
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, false);
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 280,
          automaticallyImplyLeading: false,
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarBrightness: Brightness.dark,
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark),
          flexibleSpace: SafeArea(
            child: SizedBox(
              height: 280,
              child: Stack(
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 20.0,
                          ),
                        ],
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30)),
                        color: Colors.white),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Row(
                        children: [
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                                borderRadius: BorderRadius.circular(200),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Icon(
                                    Icons.arrow_left,
                                    size: 25,
                                  ),
                                )),
                          ),
                          Expanded(
                              child: Center(
                                  child: Text(
                            "Edit Profile",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500, letterSpacing: 1),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ))),
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: SizedBox(
                              height: 25,
                              width: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xffF8F8F8),
                          borderRadius: BorderRadius.circular(100)),
                      padding: const EdgeInsets.all(10),
                      child: const CircleAvatar(
                        radius: 70,
                        backgroundImage: NetworkImage(
                            'https://i.pinimg.com/originals/c1/fa/16/c1fa169559a6e6bb172c0c79408eb37e.jpg'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    EditDetailsWidget(
                        title: "Name",
                        detail: "Name",
                        editingController: nameController,
                        validator: (value) =>
                            FormValidator.validateName(value)),
                    const SizedBox(
                      height: 20,
                    ),
                    EditDetailsWidget(
                        title: "Email",
                        detail: "Email",
                        editingController: emailController,
                        validator: (value) =>
                            FormValidator.validateName(value)),
                    const SizedBox(
                      height: 20,
                    ),
                    EditDetailsWidget(
                        title: "Phone",
                        detail: "Phone Number",
                        editingController: mobileController,
                        validator: (value) =>
                            FormValidator.validateName(value)),
                    const SizedBox(
                      height: 20,
                    ),
                    EditDetailsWidget(
                        title: "Designation",
                        detail: "Designation",
                        editingController: designation,
                        validator: (value) =>
                            FormValidator.validateName(value)),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: EditDetailsWidget(
                              title: "Class duration",
                              detail: "1 hr",
                              editingController: classDuration,
                              validator: (value) =>
                                  FormValidator.validateName(value)),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: EditDetailsWidget(
                              title: "Teaching mode",
                              detail: "Online/Offline",
                              editingController: teachingMode,
                              validator: (value) =>
                                  FormValidator.validateName(value)),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: EditDetailsWidget(
                              title: "Subject",
                              detail: "Your subject",
                              editingController: subject,
                              validator: (value) =>
                                  FormValidator.validateName(value)),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: EditDetailsWidget(
                              title: "Fee",
                              detail: "10,000/mon",
                              editingController: fee,
                              validator: (value) =>
                                  FormValidator.validateName(value)),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    EditDetailsWidget(
                        title: "Location",
                        detail: "Select your location form Map",
                        editingController: location,
                        readOnly: true,
                        validator: (value) =>
                            FormValidator.validateName(value)),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Upload class video",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                          color: Colors.black54,
                          fontSize: MediaQuery.of(context).size.width * .03,
                          letterSpacing: 1,
                          fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: 1,
                              color: ThemeColors.primaryBlueColor
                                  .withOpacity(0.3))),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.upload_outlined,
                            color: ThemeColors.primaryBlueColor,
                          ),
                          Text(
                            "Upload Video",
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: ThemeColors.primaryBlueColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                        child: Text(
                          "Update profile",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 15),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

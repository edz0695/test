import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payapp/core/animations/dot_loder_widget.dart';
import 'package:payapp/themes/colors.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/helper/helper.dart';
import '../../../core/utils/validator/validator.dart';
import '../../../data/model/body/notification_body.dart';
import '../../../provider/loginSignUpProvider.dart';
import '../../../view/screens/auth/sign_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  String? email;

  final Map<String, Map<String, String>>? languages;
  final NotificationBody? body;

  SignUpScreen(
      {super.key, this.email, required this.languages, required this.body});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with SingleTickerProviderStateMixin {
  final emailController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();
  final refIDController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    emailController.value = TextEditingValue(text: widget.email ?? "");
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final loginSignUpProvider =
        Provider.of<LoginSignUpProvider>(context, listen: false);
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, false);
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.transparent,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 28.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/images/logo.jpg',
                    width: MediaQuery.of(context).size.width * .28,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: ThemeColors.primaryBlueColor.withOpacity(.05),
                      blurRadius: 10,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Column(
                  children: [
                    Text(
                      'Register yourself',
                      style: GoogleFonts.ubuntu(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 45),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            textAlign: TextAlign.left,
                            controller: firstNameController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) =>
                                FormValidator.validateName(value),
                            style:
                                GoogleFonts.ubuntu(fontWeight: FontWeight.w500),
                            inputFormatters: const [],
                            cursorColor: ThemeColors.blueColor1,
                            decoration: InputDecoration(
                              isDense: true,
                              prefixIcon: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.person,
                                  size: 20,
                                  color: ThemeColors.primaryBlueColor,
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
                              hintText: 'First Name',
                              hintStyle: GoogleFonts.ubuntu(
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 2),
                              errorStyle: GoogleFonts.ubuntu(),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(50)),
                                borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.2),
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                borderSide: BorderSide(
                                    color: ThemeColors.primaryBlueColor),
                              ),
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                              ),
                              errorBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            textAlign: TextAlign.left,
                            controller: lastNameController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) =>
                                FormValidator.validateName(value),
                            style:
                                GoogleFonts.ubuntu(fontWeight: FontWeight.w500),
                            inputFormatters: const [],
                            cursorColor: ThemeColors.blueColor1,
                            decoration: InputDecoration(
                              isDense: true,
                              prefixIcon: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.person,
                                  size: 20,
                                  color: ThemeColors.primaryBlueColor,
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
                              hintText: 'Last name',
                              hintStyle: GoogleFonts.ubuntu(
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 2),
                              errorStyle: GoogleFonts.ubuntu(),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(50)),
                                borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.2),
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                borderSide: BorderSide(
                                    color: ThemeColors.primaryBlueColor),
                              ),
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                              ),
                              errorBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            textAlign: TextAlign.left,
                            controller: emailController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) =>
                                FormValidator.validateEmail(value),
                            style:
                                GoogleFonts.ubuntu(fontWeight: FontWeight.w500),
                            inputFormatters: const [],
                            cursorColor: ThemeColors.blueColor1,
                            decoration: InputDecoration(
                              isDense: true,
                              prefixIcon: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.directions_bike,
                                  size: 20,
                                  color: ThemeColors.primaryBlueColor,
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
                              hintText: 'Email',
                              hintStyle: GoogleFonts.ubuntu(
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 2),
                              errorStyle: GoogleFonts.ubuntu(),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(50)),
                                borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.2),
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                borderSide: BorderSide(
                                    color: ThemeColors.primaryBlueColor),
                              ),
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                              ),
                              errorBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            textAlign: TextAlign.left,
                            controller: mobileController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            maxLength: 10,
                            validator: (value) =>
                                FormValidator.validateMobile(value),
                            style:
                                GoogleFonts.ubuntu(fontWeight: FontWeight.w500),
                            inputFormatters: const [],
                            keyboardType: TextInputType.number,
                            cursorColor: ThemeColors.blueColor1,
                            decoration: InputDecoration(
                              isDense: true,
                              counterText: "",
                              prefixIcon: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.phone,
                                  size: 20,
                                  color: ThemeColors.primaryBlueColor,
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
                              hintText: 'Mobile Number',
                              hintStyle: GoogleFonts.ubuntu(
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 2),
                              errorStyle: GoogleFonts.ubuntu(),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(50)),
                                borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.2),
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                borderSide: BorderSide(
                                    color: ThemeColors.primaryBlueColor),
                              ),
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                              ),
                              errorBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            textAlign: TextAlign.left,
                            controller: passwordController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) =>
                                FormValidator.validatePassword(value),
                            style:
                                GoogleFonts.ubuntu(fontWeight: FontWeight.w500),
                            cursorColor: ThemeColors.blueColor1,
                            decoration: InputDecoration(
                              isDense: true,
                              prefixIcon: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.lock,
                                  size: 20,
                                  color: ThemeColors.primaryBlueColor,
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
                              hintText: 'Password',
                              hintStyle: GoogleFonts.ubuntu(
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 2),
                              errorStyle: GoogleFonts.ubuntu(),
                              errorMaxLines: 3,
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(50)),
                                borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.2),
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                borderSide: BorderSide(
                                    color: ThemeColors.primaryBlueColor),
                              ),
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                              ),
                              errorBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            textAlign: TextAlign.left,
                            controller: refIDController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) =>
                                FormValidator.validatePassword(value),
                            style:
                                GoogleFonts.ubuntu(fontWeight: FontWeight.w500),
                            cursorColor: ThemeColors.blueColor1,
                            decoration: InputDecoration(
                              isDense: true,
                              prefixIcon: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.share,
                                  size: 20,
                                  color: ThemeColors.primaryBlueColor,
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
                              hintText: 'REFERAL ID',
                              hintStyle: GoogleFonts.ubuntu(
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 2),
                              errorStyle: GoogleFonts.ubuntu(),
                              errorMaxLines: 3,
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(50)),
                                borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.2),
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                borderSide: BorderSide(
                                    color: ThemeColors.primaryBlueColor),
                              ),
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                              ),
                              errorBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Consumer<LoginSignUpProvider>(
                      builder: (context, loginSignUpProvider, child) {
                        return Material(
                          borderRadius: BorderRadius.circular(50),
                          color: ThemeColors.primaryBlueColor,
                          child: InkWell(
                            splashColor: Colors.black12,
                            highlightColor: Colors.transparent,
                            borderRadius: BorderRadius.circular(50),
                            onTap: () async {
                              if (formKey.currentState!.validate()) {
                                await loginSignUpProvider
                                    .signUp(
                                        firstNameController.text,
                                        lastNameController.text,
                                        emailController.text,
                                        mobileController.text,
                                        passwordController.text,
                                        refIDController.text)
                                    .then((signUpResult) {
                                  Helper.showScaffold(
                                      context, "SignUp Successfully!");
                                  Navigator.pop(context, signUpResult);
                                }).onError((error, stackTrace) {
                                  if (error is List) {
                                    // Handle error as a list
                                    for (var item in error) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content:
                                              Text(item["message"].toString()),
                                          backgroundColor: Colors.redAccent,
                                          duration: const Duration(seconds: 3),
                                        ),
                                      );
                                    }
                                  }
                                  // print(
                                  //     'Type of variable: ${error.runtimeType}');
                                  // showScaffold(context, error.toString());
                                });
                              }
                            },
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50)),
                              child: Center(
                                child: loginSignUpProvider.signingUp
                                    ? const KSProgressAnimation(
                                        dotsColor: Colors.white)
                                    : Text(
                                        'Sign Up',
                                        style: GoogleFonts.ubuntu(
                                            color: Colors.white,
                                            letterSpacing: 1,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700),
                                      ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Have an account?"),
                        const SizedBox(width: 10),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => const SignInScreen(
                                        exitFromApp: false,
                                        backFromThis: true)));
                          },
                          child: const Text('Login'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

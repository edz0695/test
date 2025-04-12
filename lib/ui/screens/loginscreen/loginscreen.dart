// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:payapp/core/animations/dot_loder_widget.dart';
// import 'package:payapp/core/components/print_text.dart';
// import 'package:payapp/themes/colors.dart';
// import 'package:payapp/ui/screens/loginscreen/otpscreen.dart';
// import 'package:payapp/ui/screens/loginscreen/signupscreen.dart';
// import 'package:payapp/ui/screens/navigationscreen/education/educationform.dart';
// import 'package:provider/provider.dart';
// import '../../../core/utils/helper/helper.dart';
// import '../../../core/utils/validator/validator.dart';
// import '../../../data/model/body/notification_body.dart';
// import '../../../provider/loginSignUpProvider.dart';
// import '../navigationscreen/navigation_screen.dart';
//
// class LoginScreen extends StatefulWidget {
//   final bool fromInside;
//
//   final Map<String, Map<String, String>>? languages;
//   final NotificationBody? body;
//
//   const LoginScreen(
//       {Key? key,
//       this.fromInside = false,
//       required this.languages,
//       required this.body})
//       : super(key: key);
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//
//   GlobalKey<FormState> formKey = GlobalKey<FormState>();
//
//   late LoginSignUpProvider loginSignUpProvider;
//
//   @override
//   void initState() {
//     super.initState();
//     loginSignUpProvider =
//         Provider.of<LoginSignUpProvider>(context, listen: false);
//   }
//
//   doLoginSignup() async {
//     if (formKey.currentState!.validate()) {
//       await loginSignUpProvider
//           .loginWithEmailAndPassword(
//         email: emailController.text,
//         password: passwordController.text,
//       )
//           .then((value) {
//         if (value != null) {
//           printThis(value.email);
//           if (widget.fromInside) {
//             Navigator.pop(context);
//           } else {
//             Navigator.pushReplacement(
//                 context,
//                 CupertinoPageRoute(
//                     builder: (context) => NavigationScreen(
//                           languages: widget.languages,
//                           body: widget.body,
//                           fromSplash: false,
//                           pageIndex: 0,
//                         )
//                     // EducationFormScreen()
//                     ));
//           }
//         }
//       }).onError((error, stackTrace) {
//         showScaffold(context, error.toString());
//       });
//     }
//
//     // printThis(formKey.currentState!.validate());
//     // printThis("this");
//     // loginSignUpProvider.googleLogin(context);
//     // Navigator.push(context, MaterialPageRoute(builder: (context)=> const OtpScreen()));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         foregroundColor: Colors.black,
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         actions: [
//           // widget.fromInside ? const SizedBox() : _skipButton(),
//         ],
//         systemOverlayStyle: const SystemUiOverlayStyle(
//           statusBarIconBrightness: Brightness.dark,
//           statusBarColor: Colors.transparent,
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 15),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(bottom: 28.0),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(15),
//                 child: Image.asset(
//                   'assets/images/logo.jpg',
//                   width: MediaQuery.of(context).size.width * .28,
//                 ),
//               ),
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(15),
//                 boxShadow: [
//                   BoxShadow(
//                     color: ThemeColors.primaryBlueColor.withOpacity(.05),
//                     blurRadius: 10,
//                     spreadRadius: 0,
//                   ),
//                 ],
//               ),
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//               child: Column(
//                 children: [
//                   Text(
//                     'Log in to an account',
//                     style: GoogleFonts.ubuntu(
//                         fontSize: 18, fontWeight: FontWeight.w500),
//                   ),
//                   const SizedBox(height: 45),
//                   Form(
//                     key: formKey,
//                     child: Column(
//                       children: [
//                         TextFormField(
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           textAlign: TextAlign.left,
//                           controller: emailController,
//                           validator: (value) =>
//                               FormValidator.validateEmail(value),
//                           style:
//                               GoogleFonts.ubuntu(fontWeight: FontWeight.w500),
//                           onChanged: (value) =>
//                               loginSignUpProvider.clearExistingEmail(),
//                           cursorColor: ThemeColors.blueColor1,
//                           decoration: InputDecoration(
//                             isDense: true,
//                             prefixIcon: const Padding(
//                               padding: EdgeInsets.all(8.0),
//                               child: Icon(Iconsax.mobile,
//                                   size: 20,
//                                   color: ThemeColors.primaryBlueColor),
//                             ),
//                             filled: true,
//                             fillColor: Colors.white,
//                             contentPadding: const EdgeInsets.symmetric(
//                                 vertical: 0, horizontal: 10),
//                             hintText: 'Email',
//                             hintStyle: GoogleFonts.ubuntu(
//                                 fontWeight: FontWeight.w500, letterSpacing: 2),
//                             errorStyle: GoogleFonts.ubuntu(),
//                             enabledBorder: OutlineInputBorder(
//                               borderRadius:
//                                   const BorderRadius.all(Radius.circular(50)),
//                               borderSide: BorderSide(
//                                   color: Colors.grey.withOpacity(0.2)),
//                             ),
//                             focusedBorder: const OutlineInputBorder(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(50)),
//                               borderSide: BorderSide(
//                                   color: ThemeColors.primaryBlueColor),
//                             ),
//                             border: const OutlineInputBorder(
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(50))),
//                             errorBorder: const OutlineInputBorder(
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(50))),
//                           ),
//                         ),
//                         Consumer<LoginSignUpProvider>(
//                           builder: (context, loginSignUpProvider, child) {
//                             return const SizedBox(height: 15);
//                           },
//                         ),
//                         Consumer<LoginSignUpProvider>(
//                             builder: (context, loginSignUpProvider, child) {
//                           return Visibility(
//                             visible: true,
//                             // visible: loginSignUpProvider.emailExists != null && loginSignUpProvider.emailExists != true
//                             //     ? true
//                             //     : false,
//                             child: TextFormField(
//                               autovalidateMode:
//                                   AutovalidateMode.onUserInteraction,
//                               textAlign: TextAlign.left,
//                               controller: passwordController,
//                               validator: (value) =>
//                                   FormValidator.validatePassword(value),
//                               style: GoogleFonts.ubuntu(
//                                   fontWeight: FontWeight.w500),
//                               cursorColor: ThemeColors.blueColor1,
//                               decoration: InputDecoration(
//                                 isDense: true,
//                                 prefixIcon: const Padding(
//                                   padding: EdgeInsets.all(8.0),
//                                   child: Icon(Iconsax.password_check,
//                                       size: 20,
//                                       color: ThemeColors.primaryBlueColor),
//                                 ),
//                                 filled: true,
//                                 fillColor: Colors.white,
//                                 contentPadding: const EdgeInsets.symmetric(
//                                     vertical: 0, horizontal: 10),
//                                 hintText: 'Password',
//                                 hintStyle: GoogleFonts.ubuntu(
//                                     fontWeight: FontWeight.w500,
//                                     letterSpacing: 2),
//                                 errorStyle: GoogleFonts.ubuntu(),
//                                 errorMaxLines: 3,
//                                 enabledBorder: OutlineInputBorder(
//                                   borderRadius: const BorderRadius.all(
//                                       Radius.circular(50)),
//                                   borderSide: BorderSide(
//                                       color: Colors.grey.withOpacity(0.2)),
//                                 ),
//                                 focusedBorder: const OutlineInputBorder(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(50)),
//                                   borderSide: BorderSide(
//                                       color: ThemeColors.primaryBlueColor),
//                                 ),
//                                 border: const OutlineInputBorder(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(50))),
//                                 errorBorder: const OutlineInputBorder(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(50)),
//                                 ),
//                               ),
//                             ),
//                           );
//                         }),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   Consumer<LoginSignUpProvider>(
//                       builder: (context, loginSignUpProvider, child) {
//                     return Material(
//                       borderRadius: BorderRadius.circular(50),
//                       color: ThemeColors.primaryBlueColor,
//                       child: InkWell(
//                         splashColor: Colors.black12,
//                         highlightColor: Colors.transparent,
//                         borderRadius: BorderRadius.circular(50),
//                         onTap: loginSignUpProvider.loading ||
//                                 loginSignUpProvider.checkingUser
//                             ? null
//                             : doLoginSignup,
//                         child: Container(
//                           height: 50,
//                           width: double.infinity,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(50)),
//                           child: Center(
//                             child: loginSignUpProvider.loading ||
//                                     loginSignUpProvider.checkingUser
//                                 ? const KSProgressAnimation(
//                                     dotsColor: Colors.white)
//                                 : Text(
//                                     'Login',
//                                     style: GoogleFonts.ubuntu(
//                                       color: Colors.white,
//                                       letterSpacing: 1,
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.w700,
//                                     ),
//                                   ),
//                           ),
//                         ),
//                       ),
//                     );
//                   }),
//                   const SizedBox(height: 20),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Text("Don't have an account?"),
//                       const SizedBox(width: 10),
//                       TextButton(
//                         onPressed: () {
//                           Navigator.push(
//                               context,
//                               CupertinoPageRoute(
//                                   builder: (context) => SignUpScreen(
//                                         languages: widget.languages,
//                                         body: widget.body,
//                                       )));
//                         },
//                         child: const Text('Signup'),
//                       ),
//                     ],
//                   ),
//                   // Row(
//                   //   children: <Widget>[
//                   //     const Expanded(child: Divider(thickness: 1)),
//                   //     Text("   OR   ", style: GoogleFonts.poppins(color: Colors.grey, letterSpacing: 1)),
//                   //     const Expanded(child: Divider(thickness: 1)),
//                   //   ],
//                   // ),
//                   // const SizedBox(height: 20),
//                   // Row(
//                   //   children: <Widget>[
//                   //     Expanded(
//                   //       child: Material(
//                   //         borderRadius: BorderRadius.circular(50),
//                   //         color: ThemeColors.lightGrey,
//                   //         child: InkWell(
//                   //           splashColor: Colors.black12,
//                   //           highlightColor: Colors.transparent,
//                   //           borderRadius: BorderRadius.circular(50),
//                   //           onTap: () async {
//                   //             print("Login");
//                   //             // loginSignUpProvider.loading = true;
//                   //             // loginSignUpProvider.notifyListeners();
//                   //             // await loginSignUpProvider.loginWithGoogle();
//                   //           },
//                   //           child: Container(
//                   //             padding: const EdgeInsets.symmetric(horizontal: 10),
//                   //             height: 50,
//                   //             decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
//                   //             child: Row(
//                   //               mainAxisAlignment: MainAxisAlignment.start,
//                   //               children: [
//                   //                 Image.asset('assets/icons/google.png', height: 35),
//                   //                 const SizedBox(width: 5),
//                   //                 Expanded(
//                   //                   child: Text(
//                   //                     'Google',
//                   //                     style: GoogleFonts.poppins(
//                   //                       color: Colors.grey,
//                   //                     ),
//                   //                   ),
//                   //                 )
//                   //               ],
//                   //             ),
//                   //           ),
//                   //         ),
//                   //       ),
//                   //     ),
//                   //     SizedBox(width: MediaQuery.of(context).size.width * .04),
//                   //     Expanded(
//                   //       child: Material(
//                   //         borderRadius: BorderRadius.circular(50),
//                   //         color: ThemeColors.lightGrey,
//                   //         child: InkWell(
//                   //           splashColor: Colors.black12,
//                   //           highlightColor: Colors.transparent,
//                   //           borderRadius: BorderRadius.circular(50),
//                   //           onTap: () {},
//                   //           child: Container(
//                   //             padding: const EdgeInsets.symmetric(horizontal: 10),
//                   //             height: 50,
//                   //             decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
//                   //             child: Row(
//                   //               mainAxisAlignment: MainAxisAlignment.center,
//                   //               children: [
//                   //                 Expanded(flex: 0, child: Image.asset('assets/icons/facebook.png', height: 35)),
//                   //                 const SizedBox(width: 5),
//                   //                 Expanded(
//                   //                   child: Text(
//                   //                     'Facebook',
//                   //                     style: GoogleFonts.poppins(
//                   //                       color: Colors.grey,
//                   //                     ),
//                   //                   ),
//                   //                 )
//                   //               ],
//                   //             ),
//                   //           ),
//                   //         ),
//                   //       ),
//                   //     ),
//                   //   ],
//                   // ),
//                 ],
//               ),
//             ),
//             const Spacer(),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _skipButton() {
//     return Padding(
//       padding: const EdgeInsets.all(10),
//       child: Consumer<LoginSignUpProvider>(
//           builder: (context, loginSignUpProvider, child) {
//         return Material(
//           color: Colors.transparent,
//           child: InkWell(
//             splashColor: ThemeColors.primaryBlueColor.withOpacity(0.2),
//             highlightColor: Colors.transparent,
//             borderRadius: BorderRadius.circular(7),
//             onTap: () async {
//               await loginSignUpProvider.skipLogin().then((value) {
//                 Navigator.pushAndRemoveUntil(
//                   context,
//                   CupertinoPageRoute(
//                       builder: (context) => NavigationScreen(
//                             languages: widget.languages,
//                             body: widget.body,
//                             fromSplash: false,
//                             pageIndex: 0,
//                           )
//                       // EducationFormScreen()
//                       ),
//                   (route) => false,
//                 );
//               });
//             },
//             child: Center(
//               child: Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//                 child: Text(
//                   "SKIP",
//                   style: GoogleFonts.ubuntu(
//                     fontWeight: FontWeight.bold,
//                     color: ThemeColors.primaryBlueColor,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         );
//       }),
//     );
//   }
// }

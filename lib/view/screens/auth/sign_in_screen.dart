import 'dart:async';
import 'dart:io';
import 'dart:ui';
import 'package:payapp/core/services/hiveDatabase.dart';
import 'package:payapp/view/base/custom_auth_field.dart';
import 'package:payapp/view/base/custom_button.dart';
import 'package:payapp/view/base/menu_drawer.dart';
import 'package:payapp/view/screens/auth/sign_up_screen.dart';
import 'package:payapp/view/screens/auth/widget/condition_check_box.dart';
import 'package:payapp/view/screens/auth/widget/guest_button.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:payapp/view/screens/auth/widget/social_login_widget.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart' as Rive;
import '../../../data/model/body/notification_body.dart';
import '../../../src/src.dart';
import '../../../ui/screens/navigationscreen/navigation_screen.dart';
import '../../../helper/get_di.dart' as di;

class SignInScreen extends StatefulWidget {
  final bool exitFromApp;
  final bool backFromThis;

  const SignInScreen(
      {super.key, required this.exitFromApp, required this.backFromThis});

  @override
  SignInScreenState createState() => SignInScreenState();
}

class SignInScreenState extends State<SignInScreen> {
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _canExit = GetPlatform.isWeb ? true : false;
  late LoginSignUpProvider loginSignUpProvider;

  @override
  void initState() {
    super.initState();
    final authCtrl = Get.find<AuthController>();
    loginSignUpProvider =
        Provider.of<LoginSignUpProvider>(context, listen: false);
    _emailController.text = authCtrl.getUserEmail();
    _passwordController.text = authCtrl.getUserPassword();
    if (authCtrl.showPassView) {
      authCtrl.showHidePass(isUpdate: false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (widget.exitFromApp) {
          if (_canExit) {
            if (GetPlatform.isAndroid) {
              SystemNavigator.pop();
            } else if (GetPlatform.isIOS) {
              exit(0);
            } else {
              Navigator.pushNamed(context, RouteHelper.getInitialRoute());
            }
            return Future.value(false);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('back_press_again_to_exit'.tr,
                  style: const TextStyle(color: Colors.white)),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.green,
              duration: const Duration(seconds: 2),
              margin: const EdgeInsets.all(Dimensions.paddingSizeSmall),
            ));
            _canExit = true;
            Timer(const Duration(seconds: 2), () {
              _canExit = false;
            });
            return Future.value(false);
          }
        } else {
          return true;
        }
      },
      child: Scaffold(
        backgroundColor: ResponsiveHelper.isDesktop(context)
            ? Colors.transparent
            : Theme.of(context).cardColor,
        appBar: (ResponsiveHelper.isDesktop(context)
            ? null
            : !widget.exitFromApp
                ? AppBar(
                    automaticallyImplyLeading: false,
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    actions: const [SizedBox()],
                  )
                : null),
        endDrawer: const MenuDrawer(),
        endDrawerEnableOpenDragGesture: false,
        body: SafeArea(
          child: Stack(
            children: [
              //   Positioned(
              //   width: MediaQuery.of(context).size.width * 1.7,
              //   left: 100,
              //   top: 10,
              //   child: Image.asset(
              //     "assets/Backgrounds/Spline.png",
              //   ),
              // ),
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                  child: const SizedBox(),
                ),
              ),
              const Rive.RiveAnimation.asset(
                "assets/RiveAssets/shapes.riv",
              ),
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                  child: const SizedBox(),
                ),
              ),
              Scrollbar(
                child: Center(
                  child: Container(
                    height: ResponsiveHelper.isDesktop(context) ? 690 : null,
                    width: context.width > 700 ? 500 : context.width,
                    padding: context.width > 700
                        ? const EdgeInsets.symmetric(horizontal: 0)
                        : const EdgeInsets.all(
                            Dimensions.paddingSizeExtremeLarge),
                    //margin: context.width > 700 ? const EdgeInsets.all(Dimensions.paddingSizeDefault) : EdgeInsets.zero,
                    decoration: context.width > 700
                        ? BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius:
                                BorderRadius.circular(Dimensions.radiusSmall),
                            boxShadow: ResponsiveHelper.isDesktop(context)
                                ? null
                                : [
                                    BoxShadow(
                                        color: Colors
                                            .grey[Get.isDarkMode ? 700 : 300]!,
                                        blurRadius: 5,
                                        spreadRadius: 1)
                                  ],
                          )
                        : null,
                    child:
                        GetBuilder<AuthController>(builder: (authController) {
                      return Center(
                        child: SingleChildScrollView(
                          child: Stack(
                            children: [
                              ResponsiveHelper.isDesktop(context)
                                  ? Positioned(
                                      top: 0,
                                      right: 0,
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: IconButton(
                                          padding: EdgeInsets.zero,
                                          onPressed: () => Get.back(),
                                          icon: const Icon(Icons.clear),
                                        ),
                                      ),
                                    )
                                  : const SizedBox(),
                              Padding(
                                padding: ResponsiveHelper.isDesktop(context)
                                    ? const EdgeInsets.all(40)
                                    : EdgeInsets.zero,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset('assets/images/logo.jpg',
                                        width: 125),
                                    // SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                                    // Center(child: Text(AppConstants.APP_NAME, style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeLarge))),
                                    const SizedBox(
                                        height:
                                            Dimensions.paddingSizeExtraLarge),

                                    Align(
                                      alignment:
                                          Get.find<LocalizationController>()
                                                  .isLtr
                                              ? Alignment.topLeft
                                              : Alignment.topRight,
                                      child: Text('sign_in'.tr,
                                          style: robotoBold.copyWith(
                                              fontSize: Dimensions
                                                  .fontSizeExtraLarge)),
                                    ),
                                    const SizedBox(
                                        height: Dimensions.paddingSizeDefault),
                                    CustomAuthTextField(
                                      titleText: 'email'.tr,
                                      hintText: 'enter_email'.tr,
                                      controller: _emailController,
                                      focusNode: _emailFocus,
                                      nextFocus: _passwordFocus,
                                      inputType: TextInputType.emailAddress,
                                      prefixIcon: Icons.phone,
                                      showTitle:
                                          ResponsiveHelper.isDesktop(context),
                                    ),
                                    const SizedBox(
                                        height:
                                            Dimensions.paddingSizeExtraLarge),
                                    CustomAuthTextField(
                                      titleText:
                                          ResponsiveHelper.isDesktop(context)
                                              ? 'password'.tr
                                              : 'enter_your_password'.tr,
                                      hintText: 'enter_your_password'.tr,
                                      controller: _passwordController,
                                      focusNode: _passwordFocus,
                                      inputAction: TextInputAction.done,
                                      inputType: TextInputType.visiblePassword,
                                      prefixIcon: Icons.lock,
                                      isPassword: true,
                                      showTitle:
                                          ResponsiveHelper.isDesktop(context),
                                      onSubmit: (text) => (GetPlatform.isWeb)
                                          ? _login(authController)
                                          : null,
                                      onChanged: (value) {
                                        if (value != null && value.isNotEmpty) {
                                          if (!authController.showPassView) {
                                            authController.showHidePass();
                                          }
                                          authController.validPassCheck(value);
                                        } else {
                                          if (authController.showPassView) {
                                            authController.showHidePass();
                                          }
                                        }
                                      },
                                    ),
                                    const SizedBox(
                                        height: Dimensions.paddingSizeSmall),

                                    Row(children: [
                                      Expanded(
                                        child: ListTile(
                                          onTap: () =>
                                              authController.toggleRememberMe(),
                                          leading: Checkbox(
                                            visualDensity: const VisualDensity(
                                                horizontal: -4, vertical: -4),
                                            activeColor:
                                                Theme.of(context).primaryColor,
                                            value: authController
                                                .isActiveRememberMe,
                                            onChanged: (bool? isChecked) =>
                                                authController
                                                    .toggleRememberMe(),
                                          ),
                                          title: Text('remember_me'.tr,
                                              style: robotoRegular.copyWith(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w500,
                                              )),
                                          contentPadding: EdgeInsets.zero,
                                          visualDensity: const VisualDensity(
                                              horizontal: 0, vertical: -4),
                                          dense: true,
                                          horizontalTitleGap: 0,
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () => Get.toNamed(
                                            RouteHelper.getForgotPassRoute(
                                                false, null)),
                                        child: Text('${'forgot_password'.tr}?',
                                            style: robotoRegular.copyWith(
                                                fontSize: 11,
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context)
                                                    .primaryColor)),
                                      ),
                                    ]),
                                    const SizedBox(
                                        height: Dimensions.paddingSizeLarge),

                                    Align(
                                        alignment: Alignment.center,
                                        child: ConditionCheckBox(
                                            authController: authController,
                                            fromSignUp: false)),

                                    const SizedBox(
                                        height: Dimensions.paddingSizeDefault),
                                    Consumer<LoginSignUpProvider>(
                                      builder: (context, provider, child) {
                                        return CustomButton(
                                          height: ResponsiveHelper.isDesktop(
                                                  context)
                                              ? 45
                                              : null,
                                          width: ResponsiveHelper.isDesktop(
                                                  context)
                                              ? 180
                                              : null,
                                          buttonText:
                                              ResponsiveHelper.isDesktop(
                                                      context)
                                                  ? 'login'
                                                  : 'sign_in'.tr,
                                          onPressed: () => provider.loading
                                              ? null
                                              : _login(authController),
                                          isLoading: provider.loading,
                                          radius: ResponsiveHelper.isDesktop(
                                                  context)
                                              ? Dimensions.radiusSmall
                                              : Dimensions.radiusDefault,
                                          isBold: !ResponsiveHelper.isDesktop(
                                              context),
                                          fontSize: ResponsiveHelper.isDesktop(
                                                  context)
                                              ? Dimensions.fontSizeExtraSmall
                                              : null,
                                        );
                                      },
                                    ),
                                    const SizedBox(
                                        height:
                                            Dimensions.paddingSizeExtraLarge),

                                    ResponsiveHelper.isDesktop(context)
                                        ? const SizedBox()
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                                Text('do_not_have_account'.tr,
                                                    style:
                                                        robotoRegular.copyWith(
                                                            color: Theme.of(
                                                                    context)
                                                                .hintColor)),
                                                InkWell(
                                                  onTap: () {
                                                    if (ResponsiveHelper
                                                        .isDesktop(context)) {
                                                      Get.back();
                                                      Get.dialog(
                                                          const SignUpScreen());
                                                    } else {
                                                      Get.toNamed(RouteHelper
                                                          .getSignUpRoute());
                                                    }
                                                  },
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .all(Dimensions
                                                            .paddingSizeExtraSmall),
                                                    child: Text('sign_up'.tr,
                                                        style: robotoMedium
                                                            .copyWith(
                                                                color: Theme.of(
                                                                        context)
                                                                    .primaryColor)),
                                                  ),
                                                ),
                                              ]),
                                    const SizedBox(
                                        height: Dimensions.paddingSizeSmall),

                                    const SocialLoginWidget(),

                                    ResponsiveHelper.isDesktop(context)
                                        ? const SizedBox()
                                        : const GuestButton(),

                                    ResponsiveHelper.isDesktop(context)
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                                Text('do_not_have_account'.tr,
                                                    style:
                                                        robotoRegular.copyWith(
                                                            color: Theme.of(
                                                                    context)
                                                                .hintColor)),
                                                InkWell(
                                                  onTap: () {
                                                    if (ResponsiveHelper
                                                        .isDesktop(context)) {
                                                      Get.back();
                                                      Get.dialog(
                                                          const SignUpScreen());
                                                    } else {
                                                      Get.toNamed(RouteHelper
                                                          .getSignUpRoute());
                                                    }
                                                  },
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .all(Dimensions
                                                            .paddingSizeExtraSmall),
                                                    child: Text('sign_up'.tr,
                                                        style: robotoMedium
                                                            .copyWith(
                                                                color: Theme.of(
                                                                        context)
                                                                    .primaryColor)),
                                                  ),
                                                ),
                                              ])
                                        : const SizedBox(),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _login(AuthController authController) async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (email.isEmpty) {
      showCustomSnackBar('enter_a_valid_email_address'.tr);
    } else if (!GetUtils.isEmail(email)) {
      showCustomSnackBar('enter_a_valid_email_address'.tr);
    } else if (password.isEmpty) {
      showCustomSnackBar('enter_password'.tr);
    } else if (password.length < 6) {
      showCustomSnackBar('password_should_be'.tr);
    } else {
      try {
        final UserModel? value =
            await loginSignUpProvider.loginWithEmailAndPassword(
          email: email,
          password: password,
        );
        if (value != null) {
          authController.login(email, password);

          if (authController.isActiveRememberMe) {
            authController.saveUserEmailAndPassword(email, password);
          } else {
            authController.clearUserEmailAndPassword();
          }

          final box = await HiveDataBase.openBox(boxName: HiveConfig.user);
          await box.clear();
          await HiveDataBase.saveSingleItem(
              box: box, data: value.toJson(), key: HiveConfig.user);

          if (widget.backFromThis) {
            Get.back();
          } else {
            di.init().then((value) {
              Map<String, Map<String, String>> languages = value;
              NotificationBody? body;
              Get.to(
                () => NavBar(
                  fromSplash: Get.parameters['from-splash'] == 'true',
                  languages: languages,
                  body: body,
                  pageIndex: 0,
                ),
              );
            });
          }
        }
      } catch (error) {
        showCustomSnackBar(error.toString(), isError: true);
      }
    }
  }
}

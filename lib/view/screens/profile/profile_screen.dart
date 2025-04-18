import 'package:payapp/controller/auth_controller.dart';
import 'package:payapp/controller/splash_controller.dart';
import 'package:payapp/controller/theme_controller.dart';
import 'package:payapp/controller/user_controller.dart';
import 'package:payapp/helper/date_converter.dart';
import 'package:payapp/helper/price_converter.dart';
import 'package:payapp/helper/responsive_helper.dart';
import 'package:payapp/helper/route_helper.dart';
import 'package:payapp/util/app_constants.dart';
import 'package:payapp/util/dimensions.dart';
import 'package:payapp/util/images.dart';
import 'package:payapp/util/styles.dart';
import 'package:payapp/view/base/confirmation_dialog.dart';
import 'package:payapp/view/base/custom_image.dart';
import 'package:payapp/view/base/footer_view.dart';
import 'package:payapp/view/base/menu_drawer.dart';
import 'package:payapp/view/base/web_menu_bar.dart';
import 'package:payapp/view/screens/auth/sign_in_screen.dart';
import 'package:payapp/view/screens/profile/widget/profile_button.dart';
import 'package:payapp/view/screens/profile/widget/profile_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payapp/view/screens/profile/widget/web_profile_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();

    if (Get.find<AuthController>().isLoggedIn() &&
        Get.find<UserController>().userInfoModel == null) {
      Get.find<UserController>().getUserInfo();
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool showWalletCard =
        Get.find<SplashController>().configModel!.customerWalletStatus == 1 ||
            Get.find<SplashController>().configModel!.loyaltyPointStatus == 1;

    return Scaffold(
      appBar: ResponsiveHelper.isDesktop(context) ? const WebMenuBar() : null,
      endDrawer: const MenuDrawer(),
      endDrawerEnableOpenDragGesture: false,
      backgroundColor: Theme.of(context).colorScheme.surface,
      key: UniqueKey(),
      body: GetBuilder<UserController>(builder: (userController) {
        bool isLoggedIn = Get.find<AuthController>().isLoggedIn();
        return (isLoggedIn && userController.userInfoModel == null)
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: FooterView(
                      minHeight: isLoggedIn
                          ? ResponsiveHelper.isDesktop(context)
                              ? 0.4
                              : 0.6
                          : 0.35,
                      child: (isLoggedIn && ResponsiveHelper.isDesktop(context))
                          ? const WebProfileWidget()
                          : Container(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.2),
                              width: Dimensions.webMaxWidth,
                              height: context.height,
                              child: Center(
                                child: Column(children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: Dimensions.paddingSizeLarge,
                                        vertical: Dimensions.paddingSizeSmall),
                                    child: SafeArea(
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            !ResponsiveHelper.isDesktop(context)
                                                ? IconButton(
                                                    onPressed: () => Get.back(),
                                                    icon: const Icon(
                                                        Icons.arrow_back_ios),
                                                  )
                                                : const SizedBox(),
                                            Text('profile'.tr,
                                                style: robotoBold.copyWith(
                                                    fontSize: Dimensions
                                                        .fontSizeLarge)),
                                            const SizedBox(width: 50),
                                          ]),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left:
                                            Dimensions.paddingSizeExtremeLarge,
                                        right:
                                            Dimensions.paddingSizeExtremeLarge,
                                        bottom: Dimensions.paddingSizeLarge),
                                    child: Row(children: [
                                      ClipOval(
                                          child: CustomImage(
                                        placeholder: Images.guestIcon,
                                        image:
                                            '${Get.find<SplashController>().configModel!.baseUrls!.customerImageUrl}'
                                            '/${(userController.userInfoModel != null && isLoggedIn) ? userController.userInfoModel!.image : ''}',
                                        height: 70,
                                        width: 70,
                                        fit: BoxFit.cover,
                                      )),
                                      const SizedBox(
                                          width: Dimensions.paddingSizeDefault),
                                      Expanded(
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                isLoggedIn
                                                    ? '${userController.userInfoModel!.fName} ${userController.userInfoModel!.lName}'
                                                    : 'guest_user'.tr,
                                                style: robotoBold.copyWith(
                                                    fontSize: Dimensions
                                                        .fontSizeExtraLarge),
                                              ),
                                              const SizedBox(
                                                  height: Dimensions
                                                      .paddingSizeExtraSmall),
                                              isLoggedIn
                                                  ? Text(
                                                      '${'joined'.tr} ${DateConverter.containTAndZToUTCFormat(userController.userInfoModel!.createdAt!)}',
                                                      style: robotoMedium.copyWith(
                                                          fontSize: Dimensions
                                                              .fontSizeSmall,
                                                          color: Theme.of(
                                                                  context)
                                                              .primaryColor),
                                                    )
                                                  : InkWell(
                                                      onTap: () async {
                                                        if (!ResponsiveHelper
                                                            .isDesktop(
                                                                context)) {
                                                          await Get.toNamed(RouteHelper
                                                              .getSignInRoute(Get
                                                                  .currentRoute));
                                                        } else {
                                                          Get.dialog(
                                                              const SignInScreen(
                                                                  exitFromApp:
                                                                      true,
                                                                  backFromThis:
                                                                      true));
                                                        }
                                                      },
                                                      child: Text(
                                                        'login_to_view_all_feature'
                                                            .tr,
                                                        style: robotoMedium.copyWith(
                                                            fontSize: Dimensions
                                                                .fontSizeSmall,
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor),
                                                      ),
                                                    ),
                                            ]),
                                      ),
                                      isLoggedIn
                                          ? InkWell(
                                              onTap: () => Get.toNamed(
                                                  RouteHelper
                                                      .getUpdateProfileRoute()),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Theme.of(context)
                                                        .cardColor,
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color:
                                                              Theme.of(context)
                                                                  .primaryColor
                                                                  .withOpacity(
                                                                      0.05),
                                                          blurRadius: 5,
                                                          spreadRadius: 1,
                                                          offset: const Offset(
                                                              3, 3))
                                                    ]),
                                                padding: const EdgeInsets.all(
                                                    Dimensions
                                                        .paddingSizeExtraSmall),
                                                child: const Icon(
                                                    Icons.edit_outlined,
                                                    size: 24,
                                                    color: Colors.blue),
                                              ),
                                            )
                                          : InkWell(
                                              onTap: () async {
                                                if (!ResponsiveHelper.isDesktop(
                                                    context)) {
                                                  await Get.toNamed(RouteHelper
                                                      .getSignInRoute(
                                                          Get.currentRoute));
                                                } else {
                                                  Get.dialog(const SignInScreen(
                                                      exitFromApp: true,
                                                      backFromThis: true));
                                                }
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          Dimensions
                                                              .radiusDefault),
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                ),
                                                padding: const EdgeInsets
                                                    .symmetric(
                                                    vertical: Dimensions
                                                        .paddingSizeSmall,
                                                    horizontal: Dimensions
                                                        .paddingSizeLarge),
                                                child: Text(
                                                  'login'.tr,
                                                  style: robotoMedium.copyWith(
                                                      color: Theme.of(context)
                                                          .cardColor),
                                                ),
                                              ),
                                            )
                                    ]),
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              const BorderRadius.vertical(
                                                  top: Radius.circular(
                                                      Dimensions
                                                          .radiusExtraLarge)),
                                          color: Theme.of(context).cardColor),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal:
                                              Dimensions.paddingSizeLarge,
                                          vertical:
                                              Dimensions.paddingSizeDefault),
                                      child: Column(children: [
                                        const SizedBox(
                                            height:
                                                Dimensions.paddingSizeLarge),
                                        (showWalletCard && isLoggedIn)
                                            ? Row(children: [
                                                Get.find<SplashController>()
                                                            .configModel!
                                                            .loyaltyPointStatus ==
                                                        1
                                                    ? Expanded(
                                                        child: ProfileCard(
                                                        image:
                                                            Images.loyaltyIcon,
                                                        data: userController
                                                                    .userInfoModel!
                                                                    .loyaltyPoint !=
                                                                null
                                                            ? userController
                                                                .userInfoModel!
                                                                .loyaltyPoint
                                                                .toString()
                                                            : '0',
                                                        title:
                                                            'loyalty_points'.tr,
                                                      ))
                                                    : const SizedBox(),
                                                SizedBox(
                                                    width: Get.find<SplashController>()
                                                                .configModel!
                                                                .loyaltyPointStatus ==
                                                            1
                                                        ? Dimensions
                                                            .paddingSizeSmall
                                                        : 0),
                                                isLoggedIn
                                                    ? Expanded(
                                                        child: ProfileCard(
                                                        image: Images
                                                            .shoppingBagIcon,
                                                        data: userController
                                                            .userInfoModel!
                                                            .orderCount
                                                            .toString(),
                                                        title: 'total_order'.tr,
                                                      ))
                                                    : const SizedBox(),
                                                SizedBox(
                                                    width: Get.find<SplashController>()
                                                                .configModel!
                                                                .customerWalletStatus ==
                                                            1
                                                        ? Dimensions
                                                            .paddingSizeSmall
                                                        : 0),
                                                Get.find<SplashController>()
                                                            .configModel!
                                                            .customerWalletStatus ==
                                                        1
                                                    ? Expanded(
                                                        child: ProfileCard(
                                                        image: Images
                                                            .walletProfile,
                                                        data: PriceConverter
                                                            .convertPrice(
                                                                userController
                                                                    .userInfoModel!
                                                                    .walletBalance),
                                                        title:
                                                            'wallet_balance'.tr,
                                                      ))
                                                    : const SizedBox(),
                                              ])
                                            : const SizedBox(),
                                        const SizedBox(
                                            height:
                                                Dimensions.paddingSizeDefault),
                                        ProfileButton(
                                            icon: Icons.tonality_outlined,
                                            title: 'dark_mode'.tr,
                                            isButtonActive: Get.isDarkMode,
                                            onTap: () {
                                              Get.find<ThemeController>()
                                                  .toggleTheme();
                                            }),
                                        const SizedBox(
                                            height:
                                                Dimensions.paddingSizeSmall),
                                        isLoggedIn
                                            ? GetBuilder<AuthController>(
                                                builder: (authController) {
                                                return ProfileButton(
                                                  icon: Icons.notifications,
                                                  title: 'notification'.tr,
                                                  isButtonActive: authController
                                                      .notification,
                                                  onTap: () {
                                                    authController
                                                        .setNotificationActive(
                                                            !authController
                                                                .notification);
                                                  },
                                                );
                                              })
                                            : const SizedBox(),
                                        SizedBox(
                                            height: isLoggedIn
                                                ? Dimensions.paddingSizeSmall
                                                : 0),
                                        isLoggedIn
                                            ? userController.userInfoModel!
                                                        .socialId ==
                                                    null
                                                ? ProfileButton(
                                                    icon: Icons.lock,
                                                    title: 'change_password'.tr,
                                                    onTap: () {
                                                      Get.toNamed(RouteHelper
                                                          .getResetPasswordRoute(
                                                              '',
                                                              '',
                                                              'password-change'));
                                                    })
                                                : const SizedBox()
                                            : const SizedBox(),
                                        SizedBox(
                                            height: isLoggedIn
                                                ? userController.userInfoModel!
                                                            .socialId ==
                                                        null
                                                    ? Dimensions
                                                        .paddingSizeSmall
                                                    : 0
                                                : 0),
                                        isLoggedIn
                                            ? ProfileButton(
                                                icon: Icons.delete,
                                                title: 'delete_account'.tr,
                                                iconImage: Images.profileDelete,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .error,
                                                onTap: () {
                                                  Get.dialog(
                                                      ConfirmationDialog(
                                                        icon: Images.support,
                                                        title:
                                                            'are_you_sure_to_delete_account'
                                                                .tr,
                                                        description:
                                                            'it_will_remove_your_all_information'
                                                                .tr,
                                                        isLogOut: true,
                                                        onYesPressed: () =>
                                                            userController
                                                                .removeUser(),
                                                      ),
                                                      useSafeArea: false);
                                                },
                                              )
                                            : const SizedBox(),
                                        SizedBox(
                                            height: isLoggedIn
                                                ? Dimensions.paddingSizeLarge
                                                : 0),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text('${'version'.tr}:',
                                                  style: robotoRegular.copyWith(
                                                      fontSize: Dimensions
                                                          .fontSizeExtraSmall)),
                                              const SizedBox(
                                                  width: Dimensions
                                                      .paddingSizeExtraSmall),
                                              Text(
                                                  AppConstants.appVersion
                                                      .toString(),
                                                  style: robotoMedium.copyWith(
                                                      fontSize: Dimensions
                                                          .fontSizeExtraSmall)),
                                            ]),
                                      ]),
                                    ),
                                  )
                                ]),
                              ),
                            ),
                    ),
                  )

            /*ProfileBgWidget(
          backButton: true,
          circularImage: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Theme.of(context).cardColor),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: ClipOval(child: CustomImage(
              image: '${Get.find<SplashController>().configModel!.baseUrls!.customerImageUrl}'
                  '/${(userController.userInfoModel != null && _isLoggedIn) ? userController.userInfoModel!.image : ''}',
              height: 100, width: 100, fit: BoxFit.cover,
            )),
          ),
          mainWidget: SingleChildScrollView(physics: const BouncingScrollPhysics(), child: FooterView(minHeight:_isLoggedIn ? 0.6 : 0.35,
            child: Center(child: Container(
              width: Dimensions.webMaxWidth, height: context.height, color: Theme.of(context).cardColor,
              padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
              child: Column(children: [

                Text(
                  _isLoggedIn ? '${userController.userInfoModel!.fName} ${userController.userInfoModel!.lName}' : 'guest'.tr,
                  style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeLarge),
                ),
                const SizedBox(height: 30),

                _isLoggedIn ? Row(children: [
                  ProfileCard(title: 'since_joining'.tr, data: '${userController.userInfoModel!.memberSinceDays} ${'days'.tr}'),
                  const SizedBox(width: Dimensions.paddingSizeSmall),
                  ProfileCard(title: 'total_order'.tr, data: userController.userInfoModel!.orderCount.toString()),
                ]) : const SizedBox(),

                SizedBox(height: showWalletCard ? Dimensions.paddingSizeSmall : 0),
                (showWalletCard && _isLoggedIn) ? Row(children: [
                  Get.find<SplashController>().configModel!.customerWalletStatus == 1 ? ProfileCard(
                    title: 'wallet_amount'.tr,
                    data: PriceConverter.convertPrice(userController.userInfoModel!.walletBalance),
                  ) : const SizedBox.shrink(),
                  SizedBox(width: Get.find<SplashController>().configModel!.customerWalletStatus == 1
                      && Get.find<SplashController>().configModel!.loyaltyPointStatus == 1 ? Dimensions.paddingSizeSmall : 0.0),
                  Get.find<SplashController>().configModel!.loyaltyPointStatus == 1 ? ProfileCard(
                    title: 'loyalty_points'.tr,
                    data: userController.userInfoModel!.loyaltyPoint != null ? userController.userInfoModel!.loyaltyPoint.toString() : '0',
                  ) : const SizedBox.shrink(),
                ]) : const SizedBox(),

                SizedBox(height: _isLoggedIn ? 30 : 0),

                ProfileButton(icon: Icons.dark_mode, title: 'dark_mode'.tr, isButtonActive: Get.isDarkMode, onTap: () {
                  Get.find<ThemeController>().toggleTheme();
                }),
                const SizedBox(height: Dimensions.paddingSizeSmall),

                _isLoggedIn ? GetBuilder<AuthController>(builder: (authController) {
                  return ProfileButton(
                    icon: Icons.notifications, title: 'notification'.tr,
                    isButtonActive: authController.notification, onTap: () {
                    authController.setNotificationActive(!authController.notification);
                  },
                  );
                }) : const SizedBox(),
                SizedBox(height: _isLoggedIn ? Dimensions.paddingSizeSmall : 0),

                _isLoggedIn ? userController.userInfoModel!.socialId == null ? ProfileButton(icon: Icons.lock, title: 'change_password'.tr, onTap: () {
                  Get.toNamed(RouteHelper.getResetPasswordRoute('', '', 'password-change'));
                }) : const SizedBox() : const SizedBox(),
                SizedBox(height: _isLoggedIn ? userController.userInfoModel!.socialId == null ? Dimensions.paddingSizeSmall : 0 : 0),

                ProfileButton(icon: Icons.edit, title: 'edit_profile'.tr, onTap: () {
                  Get.toNamed(RouteHelper.getUpdateProfileRoute());
                }),
                SizedBox(height: _isLoggedIn ? Dimensions.paddingSizeSmall : Dimensions.paddingSizeLarge),

                _isLoggedIn ? ProfileButton(
                  icon: Icons.delete, title: 'delete_account'.tr,
                  onTap: () {
                    Get.dialog(ConfirmationDialog(icon: Images.support,
                      title: 'are_you_sure_to_delete_account'.tr,
                      description: 'it_will_remove_your_all_information'.tr, isLogOut: true,
                      onYesPressed: () => userController.removeUser(),
                    ), useSafeArea: false);
                  },
                ) : const SizedBox(),
                SizedBox(height: _isLoggedIn ? Dimensions.paddingSizeLarge : 0),

                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text('${'version'.tr}:', style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeExtraSmall)),
                  const SizedBox(width: Dimensions.paddingSizeExtraSmall),
                  Text(AppConstants.appVersion.toString(), style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeExtraSmall)),
                ]),

              ]),
            )),
          )),
        )*/
            ;
      }),
    );
  }
}

import 'dart:async';
import 'dart:io';
import 'package:payapp/data/api/api_client.dart';
import 'package:payapp/data/model/body/notification_body.dart';
import 'package:payapp/theme/dark_theme.dart';
import 'package:payapp/theme/light_theme.dart';
import 'package:payapp/ui/screens/demo/navigation_provider.dart';
import 'package:provider/provider.dart';
import 'core/services/hiveDatabase.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:payapp/view/screens/home/widget/cookies_view.dart';
import 'package:url_strategy/url_strategy.dart';
import 'helper/get_di.dart' as di;
import 'src/src.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
NotificationBody? body;

Future<void> main() async {
  if (ResponsiveHelper.isMobilePhone()) {
    HttpOverrides.global = MyHttpOverrides();
  }
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();

  await HiveDataBase.init();
  final loginSignUpProvider = LoginSignUpProvider();

  if (ResponsiveHelper.isMobilePhone()) {
    HttpOverrides.global = MyHttpOverrides();
  }

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  loginToken = sharedPreferences.getString(AppConstants.authToken) ?? "";
  await loginSignUpProvider.initUser();

  if (GetPlatform.isWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyD0Z911mOoWCVkeGdjhIKwWFPRgvd6ZyAw",
            authDomain: "stackmart-500c7.firebaseapp.com",
            projectId: "stackmart-500c7",
            storageBucket: "stackmart-500c7.appspot.com",
            messagingSenderId: "491987943015",
            appId: "1:491987943015:web:d8bc7ab8dbc9991c8f1ec2"));
  } else if (GetPlatform.isAndroid) {
    // await Firebase.initializeApp(
    //   options: const FirebaseOptions(
    //     apiKey: "AIzaSyCc3OCd5I2xSlnftZ4bFAbuCzMhgQHLivA",
    //     appId: "1:491987943015:android:a6fb4303cc4bf3d18f1ec2",
    //     messagingSenderId: "491987943015",
    //     projectId: "stackmart-500c7",
    //   ),
    // );
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } else {
    // await Firebase.initializeApp();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  Map<String, Map<String, String>> languages = await di.init();

  try {
    if (GetPlatform.isMobile) {
      // final RemoteMessage? remoteMessage =
      // await FirebaseMessaging.instance.getInitialMessage();
      // if (remoteMessage != null) {
      //   body = NotificationHelper.convertNotification(remoteMessage.data);
      // }
      // await NotificationHelper.initialize(flutterLocalNotificationsPlugin);
      // FirebaseMessaging.onBackgroundMessage(myBackgroundMessageHandler);
    }
  } catch (_) {}

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ParentProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => NavigationProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => EarnScreenProvider(),
        ),
        ChangeNotifierProvider.value(
          value: loginSignUpProvider,
        ),
        ChangeNotifierProvider(
          create: (context) => CaServicesProvider()..getCAHomeServices(),
        ),
        ChangeNotifierProvider(
          create: (context) => AccountManagerProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WalletProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SettingsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => EductionFormProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CommunityProvider(),
        ),
      ],
      child: MyApp(languages: languages, body: body),
    ),
  );
}

class MyApp extends StatefulWidget {
  final Map<String, Map<String, String>>? languages;
  final NotificationBody? body;

  const MyApp({super.key, required this.languages, required this.body});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    // _route();
  }

  void _route() {
    Get.find<SplashController>().initSharedData();
    if (GetPlatform.isWeb) {
      if (Get.find<LocationController>().getUserAddress() != null &&
          Get.find<LocationController>().getUserAddress()!.zoneIds == null) {
        Get.find<AuthController>().clearSharedAddress();
      }
      Get.find<CartController>().getCartData();
    }
    Get.find<SplashController>()
        .getConfigData(loadLandingData: GetPlatform.isWeb)
        .then((bool isSuccess) async {
      if (isSuccess) {
        if (Get.find<AuthController>().isLoggedIn()) {
          Get.find<AuthController>().updateToken();
          if (Get.find<SplashController>().module != null) {
            await Get.find<WishListController>().getWishList();
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (themeController) {
        return GetBuilder<LocalizationController>(
          builder: (localizeController) {
            return GetBuilder<SplashController>(
              builder: (splashController) {
                return (GetPlatform.isWeb &&
                        splashController.configModel == null)
                    ? const SizedBox()
                    : GetMaterialApp(
                        title: AppConstants.appName,
                        debugShowCheckedModeBanner: false,
                        navigatorKey: Get.key,
                        scrollBehavior: const MaterialScrollBehavior().copyWith(
                          dragDevices: {
                            PointerDeviceKind.mouse,
                            PointerDeviceKind.touch
                          },
                        ),
                        // theme: themeController.darkTheme ? themeController.darkColor == null ? dark() : dark(color
                        //     : themeController.darkColor!) : themeController.lightColor == null ? light()
                        //     : light(color: themeController.lightColor!),

                        theme: themeController.darkTheme ? dark() : light(),
                        locale: localizeController.locale,
                        translations: Messages(languages: widget.languages),
                        fallbackLocale: Locale(
                          AppConstants.languages[0].languageCode!,
                          AppConstants.languages[0].countryCode,
                        ),
                        initialRoute: GetPlatform.isWeb
                            ? RouteHelper.getInitialRoute()
                            : RouteHelper.getSplashRoute(widget.body),
                        getPages: RouteHelper.getAllRoutes(
                          languages: widget.languages,
                          body: widget.body,
                        ),
                        // getPages: RouteHelper.routes,
                        defaultTransition: Transition.topLevel,
                        transitionDuration: const Duration(milliseconds: 500),
                        builder: (BuildContext context, widget) => Material(
                          child: Stack(
                            children: [
                              widget!,
                              GetBuilder<SplashController>(
                                builder: (splashController) {
                                  if (!splashController.savedCookiesData &&
                                      !splashController.getAcceptCookiesStatus(
                                        splashController.configModel != null
                                            ? splashController
                                                .configModel!.cookiesText!
                                            : '',
                                      )) {
                                    return ResponsiveHelper.isWeb()
                                        ? const Align(
                                            alignment: Alignment.bottomCenter,
                                            child: CookiesView(),
                                          )
                                        : const SizedBox();
                                  } else {
                                    return const SizedBox();
                                  }
                                },
                              )
                            ],
                          ),
                        ),
                      );
              },
            );
          },
        );
      },
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:meta_seo/meta_seo.dart';
import 'package:payapp/data/model/body/notification_body.dart';
import 'package:payapp/data/model/body/social_log_in_body.dart';
import 'package:payapp/data/model/body/user_information_body.dart';
import 'package:payapp/data/model/response/address_model.dart';
import 'package:payapp/data/model/response/basic_campaign_model.dart';
import 'package:payapp/data/model/response/conversation_model.dart';
import 'package:payapp/data/model/response/order_model.dart';
import 'package:payapp/data/model/response/item_model.dart';
import 'package:payapp/data/model/response/parcel_category_model.dart';
import 'package:payapp/data/model/response/store_model.dart';
import 'package:payapp/data/model/response/vehicle_model.dart';
import 'package:payapp/util/app_constants.dart';
import 'package:payapp/util/html_type.dart';
import 'package:payapp/view/base/image_viewer_screen.dart';
import 'package:payapp/view/base/not_found.dart';
import 'package:payapp/view/screens/address/add_address_screen.dart';
import 'package:payapp/view/screens/address/address_screen.dart';
import 'package:payapp/view/screens/auth/delivery_man_registration_screen.dart';
import 'package:payapp/view/screens/auth/store_registration_screen.dart';
import 'package:payapp/view/screens/auth/sign_in_screen.dart';
import 'package:payapp/view/screens/auth/sign_up_screen.dart';
import 'package:payapp/view/screens/cart/cart_screen.dart';
import 'package:payapp/view/screens/category/category_item_screen.dart';
import 'package:payapp/view/screens/category/category_screen.dart';
import 'package:payapp/view/screens/chat/chat_screen.dart';
import 'package:payapp/view/screens/chat/conversation_screen.dart';
import 'package:payapp/view/screens/checkout/checkout_screen.dart';
import 'package:payapp/view/screens/checkout/order_successful_screen.dart';
import 'package:payapp/view/screens/checkout/payment_screen.dart';
import 'package:payapp/view/screens/checkout/payment_webview_screen.dart';
import 'package:payapp/view/screens/coupon/coupon_screen.dart';
import 'package:payapp/view/screens/digital_gold/digital_gold.dart';
import 'package:payapp/view/screens/item/item_campaign_screen.dart';
import 'package:payapp/view/screens/item/item_details_screen.dart';
import 'package:payapp/view/screens/item/popular_item_screen.dart';
import 'package:payapp/view/screens/forget/forget_pass_screen.dart';
import 'package:payapp/view/screens/forget/new_pass_screen.dart';
import 'package:payapp/view/screens/forget/verification_screen.dart';
import 'package:payapp/view/screens/html/html_viewer_screen.dart';
import 'package:payapp/view/screens/interest/interest_screen.dart';
import 'package:payapp/view/screens/language/language_screen.dart';
import 'package:payapp/view/screens/location/access_location_screen.dart';
import 'package:payapp/view/screens/location/map_screen.dart';
import 'package:payapp/view/screens/location/pick_map_screen.dart';
import 'package:payapp/view/screens/notification/notification_screen.dart';
import 'package:payapp/view/screens/onboard/onboarding_screen.dart';
import 'package:payapp/view/screens/order/order_details_screen.dart';
import 'package:payapp/view/screens/order/order_screen.dart';
import 'package:payapp/view/screens/order/order_tracking_screen.dart';
import 'package:payapp/view/screens/order/refund_request_screen.dart';
import 'package:payapp/view/screens/parcel/parcel_category_screen.dart';
import 'package:payapp/view/screens/parcel/parcel_location_screen.dart';
import 'package:payapp/view/screens/parcel/parcel_request_screen.dart';
import 'package:payapp/view/screens/profile/profile_screen.dart';
import 'package:payapp/view/screens/profile/update_profile_screen.dart';
import 'package:payapp/view/screens/refer_and_earn/refer_and_earn_screen.dart';
import 'package:payapp/view/screens/store/all_store_screen.dart';
import 'package:payapp/view/screens/store/campaign_screen.dart';
import 'package:payapp/view/screens/store/store_item_search_screen.dart';
import 'package:payapp/view/screens/store/store_screen.dart';
import 'package:payapp/view/screens/store/review_screen.dart';
import 'package:payapp/view/screens/search/search_screen.dart';
import 'package:payapp/view/screens/support/support_screen.dart';
import 'package:payapp/view/screens/taxi_booking/booking_checkout_screen/booking_checkout_screen.dart';
import 'package:payapp/view/screens/taxi_booking/car_details_screen/car_details_screen.dart';
import 'package:payapp/view/screens/taxi_booking/order_status_screen/order_status_screen.dart';
import 'package:payapp/view/screens/taxi_booking/select_car_screen.dart';
import 'package:payapp/view/screens/taxi_booking/select_map_location/select_map_location.dart';
import 'package:payapp/view/screens/taxi_booking/taxi_coupon_screen/taxi_coupon_screen.dart';
import 'package:payapp/view/screens/taxi_booking/trip_completed_confermation/trip_completed_confirmation_screen.dart';
import 'package:payapp/view/screens/taxi_booking/trip_history/trip_history_screen.dart';
import 'package:payapp/view/screens/update/update_screen.dart';
import 'package:get/get.dart';
import 'package:payapp/view/screens/wallet/wallet_screen.dart';
import '../ui/screens/navigationscreen/navigation_screen.dart';
import 'package:payapp/view/screens/splash/splash_screen.dart';

class RouteHelper {
  static const String initial = '/';
  static const String splash = '/splash';
  static const String language = '/language';
  static const String onBoarding = '/on-boarding';
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';
  static const String verification = '/verification';
  static const String accessLocation = '/access-location';
  static const String pickMap = '/pick-map';
  // static const String dashboard = '/dashboard';
  static const String navbar = '/navbar';
  static const String interest = '/interest';
  static const String main = '/main';
  static const String forgotPassword = '/forgot-password';
  static const String resetPassword = '/reset-password';
  static const String search = '/search';
  static const String store = '/store';
  static const String orderDetails = '/order-details';
  static const String profile = '/profile';
  static const String updateProfile = '/update-profile';
  static const String coupon = '/coupon';
  static const String notification = '/notification';
  static const String map = '/map';
  static const String address = '/address';
  static const String orderSuccess = '/order-successful';
  static const String payment = '/payment';
  static const String checkout = '/checkout';
  static const String orderTracking = '/track-order';
  static const String basicCampaign = '/basic-campaign';
  static const String html = '/html';
  static const String categories = '/categories';
  static const String categoryItem = '/category-item';
  static const String popularItems = '/popular-items';
  static const String itemCampaign = '/item-campaign';
  static const String support = '/help-and-support';
  static const String rateReview = '/rate-and-review';
  static const String update = '/update';
  static const String cart = '/cart';
  static const String addAddress = '/add-address';
  static const String editAddress = '/edit-address';
  static const String storeReview = '/store-review';
  static const String allStores = '/stores';
  static const String itemImages = '/item-images';
  static const String parcelCategory = '/parcel-category';
  static const String parcelLocation = '/parcel-location';
  static const String parcelRequest = '/parcel-request';
  static const String searchStoreItem = '/search-store-item';
  static const String order = '/order';
  static const String itemDetails = '/item-details';
  static const String wallet = '/wallet';
  static const String referAndEarn = '/refer-and-earn';
  static const String messages = '/messages';
  static const String conversation = '/conversation';
  static const String restaurantRegistration = '/restaurant-registration';
  static const String deliveryManRegistration = '/delivery-man-registration';
  static const String refund = '/refund';

  static const String selectRideMapLocation = '/select-rider-map-location';
  static const String selectCarScreen = '/select-car-screen';
  static const String carDetailsScreen = '/car-details-screen';
  static const String bookingCheckoutScreen = '/booking-checkout-screen';
  static const String tripHistoryScreen = '/trip-history-screen';
  static const String orderStatusScreen = '/order-status-screen';
  static const String tripCompletedConfirmationScreen =
      '/trip-complete-confirmation-screen';
  static const String taxiCouponScreen = '/taxi-coupon-screen';
  static const String digitalPaymentScreen = '/digital-payment-screen';

  static String getInitialRoute({bool fromSplash = false}) =>
      '$initial?from-splash=$fromSplash';

  static String getSplashRoute(NotificationBody? body) {
    String data = 'null';
    if (body != null) {
      List<int> encoded = utf8.encode(jsonEncode(body.toJson()));
      data = base64Encode(encoded);
    }
    return '$splash?data=$data';
  }

  static String getLanguageRoute(String page) => '$language?page=$page';

  static String getOnBoardingRoute() => onBoarding;

  static String getSignInRoute(String page) => '$signIn?page=$page';

  static String getSignUpRoute() => signUp;

  static String getVerificationRoute(
      String? number, String? token, String page, String pass) {
    return '$verification?page=$page&number=$number&token=$token&pass=$pass';
  }

  static String getAccessLocationRoute(String page) =>
      '$accessLocation?page=$page';

  static String getPickMapRoute(String? page, bool canRoute) =>
      '$pickMap?page=$page&route=${canRoute.toString()}';

  static String getInterestRoute() => interest;

  static String getMainRoute(String page) => '$main?page=$page';

  static String getForgotPassRoute(
      bool fromSocialLogin, SocialLogInBody? socialLogInBody) {
    String? data;
    if (fromSocialLogin) {
      data = base64Encode(utf8.encode(jsonEncode(socialLogInBody!.toJson())));
    }
    return '$forgotPassword?page=${fromSocialLogin ? 'social-login' : 'forgot-password'}&data=${fromSocialLogin ? data : 'null'}';
  }

  static String getResetPasswordRoute(
          String? phone, String token, String page) =>
      '$resetPassword?phone=$phone&token=$token&page=$page';

  static String getSearchRoute({String? queryText}) =>
      '$search?query=${queryText ?? ''}';

  static String getStoreRoute({required int? id, required String page}) {
    if (kIsWeb) {
      // Define MetaSEO object
      MetaSEO meta = MetaSEO();
      // add meta seo data for web app as you want
      meta.ogTitle(ogTitle: 'Store Screen');
      meta.description(
          description:
              'This is Store screen. Here have all information of store');
      meta.keywords(keywords: 'Flutter, Dart, SEO, Meta, Web');
    }
    return '$store?id=$id&page=$page';
  }

  static String getOrderDetailsRoute(int? orderID, {bool? fromNotification}) {
    return '$orderDetails?id=$orderID&from=${fromNotification.toString()}';
  }

  static String getProfileRoute() => profile;

  static String getUpdateProfileRoute() => updateProfile;

  static String getCouponRoute() => coupon;

  static String getNotificationRoute({bool? fromNotification}) =>
      '$notification?from=${fromNotification.toString()}';

  static String getMapRoute(
      AddressModel addressModel, String page, bool isFood) {
    List<int> encoded = utf8.encode(jsonEncode(addressModel.toJson()));
    String data = base64Encode(encoded);
    return '$map?address=$data&page=$page&module=$isFood';
  }

  static String getAddressRoute() => address;

  static String getOrderSuccessRoute(String orderID) {
    return '$orderSuccess?id=$orderID';
  }

  static String getPaymentRoute(String id, int? user, String? type,
          double amount, bool? codDelivery, String? paymentMethod,
          {String? addFundUrl}) =>
      '$payment?id=$id&user=$user&type=$type&amount=$amount&cod-delivery=$codDelivery&add-fund-url=$addFundUrl&payment-method=$paymentMethod';

  static String getCheckoutRoute(String page, {int? storeId}) =>
      '$checkout?page=$page&store-id=$storeId';

  static String getOrderTrackingRoute(int? id) => '$orderTracking?id=$id';

  static String getBasicCampaignRoute(BasicCampaignModel basicCampaignModel) {
    String data =
        base64Encode(utf8.encode(jsonEncode(basicCampaignModel.toJson())));
    return '$basicCampaign?data=$data';
  }

  static String getHtmlRoute(String page) => '$html?page=$page';

  static String getCategoryRoute() => categories;

  static String getCategoryItemRoute(int? id, String name) {
    List<int> encoded = utf8.encode(name);
    String data = base64Encode(encoded);
    return '$categoryItem?id=$id&name=$data';
  }

  static String getPopularItemRoute(bool isPopular) =>
      '$popularItems?page=${isPopular ? 'popular' : 'reviewed'}';

  static String getItemCampaignRoute() => itemCampaign;

  static String getSupportRoute() => support;

  static String getReviewRoute() => rateReview;

  static String getUpdateRoute(bool isUpdate) =>
      '$update?update=${isUpdate.toString()}';

  static String getCartRoute() => cart;

  static String getAddAddressRoute(
          bool fromCheckout, bool fromRide, int? zoneId) =>
      '$addAddress?page=${fromCheckout ? 'checkout' : 'address'}&ride=$fromRide&zone_id=$zoneId';

  static String getEditAddressRoute(AddressModel address) {
    String data = base64Url.encode(utf8.encode(jsonEncode(address.toJson())));
    return '$editAddress?data=$data';
  }

  static String getStoreReviewRoute(int? storeID) => '$storeReview?id=$storeID';

  static String getAllStoreRoute(String page) => '$allStores?page=$page';

  static String getItemImagesRoute(Item item) {
    String data = base64Url.encode(utf8.encode(jsonEncode(item.toJson())));
    return '$itemImages?item=$data';
  }

  static String getParcelCategoryRoute() => parcelCategory;

  static String getParcelLocationRoute(ParcelCategoryModel category) {
    String data = base64Url.encode(utf8.encode(jsonEncode(category.toJson())));
    return '$parcelLocation?data=$data';
  }

  static String getParcelRequestRoute(ParcelCategoryModel category,
      AddressModel pickupAddress, AddressModel destinationAddress) {
    String category0 =
        base64Url.encode(utf8.encode(jsonEncode(category.toJson())));
    String pickedUpAddress =
        base64Url.encode(utf8.encode(jsonEncode(pickupAddress.toJson())));
    String destinationAddress0 =
        base64Url.encode(utf8.encode(jsonEncode(destinationAddress.toJson())));
    return '$parcelRequest?category=$category0&picked=$pickedUpAddress&destination=$destinationAddress0';
  }

  static String getSearchStoreItemRoute(int? storeID) =>
      '$searchStoreItem?id=$storeID';

  static String getOrderRoute() => order;

  static String getItemDetailsRoute(int? itemID, bool isRestaurant) =>
      '$itemDetails?id=$itemID&page=${isRestaurant ? 'restaurant' : 'item'}';

  static String getWalletRoute(bool fromWallet,
          {String? fundStatus, String? token}) =>
      '$wallet?page=${fromWallet ? 'wallet' : 'loyalty_points'}&payment_status=$fundStatus&token=$token';

  static String getReferAndEarnRoute() => referAndEarn;

  static String getChatRoute(
      {required NotificationBody? notificationBody,
      User? user,
      int? conversationID,
      int? index,
      bool? fromNotification}) {
    String notificationBody0 = 'null';
    if (notificationBody != null) {
      notificationBody0 =
          base64Encode(utf8.encode(jsonEncode(notificationBody.toJson())));
    }
    String user0 = 'null';
    if (user != null) {
      user0 = base64Encode(utf8.encode(jsonEncode(user.toJson())));
    }
    return '$messages?notification=$notificationBody0&user=$user0&conversation_id=$conversationID&index=$index&from=${fromNotification.toString()}';
  }

  static String getConversationRoute() => conversation;

  static String getRestaurantRegistrationRoute() => restaurantRegistration;

  static String getDeliverymanRegistrationRoute() => deliveryManRegistration;

  static String getRefundRequestRoute(String orderID) => '$refund?id=$orderID';

  static String getSelectRideMapLocationRoute(
      String riderType, AddressModel? addressModel, Vehicles? vehicle) {
    String riderType0 = base64Url.encode(utf8.encode(jsonEncode(riderType)));
    String address = 'null';
    String vehicle0 = 'null';
    if (addressModel != null) {
      address = base64Url.encode(utf8.encode(jsonEncode(addressModel)));
    }
    if (vehicle != null) {
      vehicle0 = base64Url.encode(utf8.encode(jsonEncode(vehicle)));
    }
    return '$selectRideMapLocation?rider_type=$riderType0&address=$address&vehicle=$vehicle0';
  }

  static String getSelectCarScreenRoute(
    UserInformationBody filterBody,
  ) {
    String body = base64Url.encode(utf8.encode(jsonEncode(filterBody)));
    return '$selectCarScreen?body=$body';
  }

  static String getCarDetailsScreen(
      Vehicles vehicle, UserInformationBody filterBody) {
    String vehicle0 =
        base64Url.encode(utf8.encode(jsonEncode(vehicle.toJson())));
    String body =
        base64Url.encode(utf8.encode(jsonEncode(filterBody.toJson())));
    return '$carDetailsScreen?vehicle=$vehicle0&body=$body';
  }

  static String getBookingCheckoutScreen(
      Vehicles vehicle, UserInformationBody filterBody) {
    String vehicle0 = base64Url.encode(utf8.encode(jsonEncode(vehicle)));
    String body = base64Url.encode(utf8.encode(jsonEncode(filterBody)));
    return '$bookingCheckoutScreen?vehicle=$vehicle0&body=$body';
  }

  static String getTripHistoryScreen() => tripHistoryScreen;

  static String getOrderStatusScreen() => orderStatusScreen;

  static String getTripCompletedConfirmationScreen() =>
      tripCompletedConfirmationScreen;

  static String getTaxiCouponScreen() => taxiCouponScreen;

  static String getDigitalPaymentScreen() => digitalPaymentScreen;

  static List<GetPage> getAllRoutes(
      {Map<String, Map<String, String>>? languages, NotificationBody? body}) {
    List<GetPage> routes = [
      GetPage(
          name: initial,
          page: () => NavBar(
              languages: languages,
              body: body,
              pageIndex: 0,
              fromSplash: Get.parameters['from-splash'] == 'true')),
      GetPage(
          name: splash,
          page: () {
            NotificationBody? data;
            if (Get.parameters['data'] != 'null') {
              List<int> decode =
                  base64Decode(Get.parameters['data']!.replaceAll(' ', '+'));
              data = NotificationBody.fromJson(jsonDecode(utf8.decode(decode)));
            }
            return SplashScreen(body: data);
          }),
      GetPage(
          name: language,
          page: () =>
              ChooseLanguageScreen(fromMenu: Get.parameters['page'] == 'menu')),
      GetPage(name: onBoarding, page: () => const OnBoardingScreen()),
      GetPage(
          name: signIn,
          page: () => SignInScreen(
                exitFromApp: Get.parameters['page'] == signUp ||
                    Get.parameters['page'] == splash ||
                    Get.parameters['page'] == onBoarding,
                backFromThis: Get.parameters['page'] != splash &&
                    Get.parameters['page'] != onBoarding,
              )),
      GetPage(name: signUp, page: () => const SignUpScreen()),
      GetPage(
          name: verification,
          page: () {
            List<int> decode =
                base64Decode(Get.parameters['pass']!.replaceAll(' ', '+'));
            String data = utf8.decode(decode);
            return VerificationScreen(
              number: Get.parameters['number'],
              fromSignUp: Get.parameters['page'] == signUp,
              token: Get.parameters['token'],
              password: data,
            );
          }),
      GetPage(
          name: accessLocation,
          page: () => AccessLocationScreen(
                fromSignUp: Get.parameters['page'] == signUp,
                fromHome: Get.parameters['page'] == 'home',
                route: navbar,
              )),
      GetPage(
          name: pickMap,
          page: () {
            PickMapScreen? pickMapScreen = Get.arguments;
            bool fromAddress = Get.parameters['page'] == 'add-address';
            return ((Get.parameters['page'] == 'parcel' &&
                        pickMapScreen == null) ||
                    (fromAddress && pickMapScreen == null))
                ? const NotFound()
                : pickMapScreen ??
                    PickMapScreen(
                      fromAddAddress: fromAddress,
                      route: navbar,
                      canRoute: true,
                    );
          }),
      GetPage(name: interest, page: () => const InterestScreen()),
      GetPage(
          name: main,
          page: () => NavBar(
              languages: languages,
              body: body,
              pageIndex: 0,
              fromSplash: Get.parameters['from-splash'] == 'true')),
      // GetPage(
      //     name: dashboard,
      //     page: () => DashboardScreen(
      //           pageIndex: Get.parameters['page'] == 'home'
      //               ? 0
      //               : Get.parameters['page'] == 'favourite'
      //                   ? 1
      //                   : Get.parameters['page'] == 'cart'
      //                       ? 2
      //                       : Get.parameters['page'] == 'order'
      //                           ? 3
      //                           : Get.parameters['page'] == 'menu'
      //                               ? 4
      //                               : 0,
      //         )),
      GetPage(
          name: forgotPassword,
          page: () {
            SocialLogInBody? data;
            if (Get.parameters['page'] == 'social-login') {
              List<int> decode =
                  base64Decode(Get.parameters['data']!.replaceAll(' ', '+'));
              data = SocialLogInBody.fromJson(jsonDecode(utf8.decode(decode)));
            }
            return ForgetPassScreen(
                fromSocialLogin: Get.parameters['page'] == 'social-login',
                socialLogInBody: data);
          }),
      GetPage(
          name: resetPassword,
          page: () => NewPassScreen(
                resetToken: Get.parameters['token'],
                number: Get.parameters['phone'],
                fromPasswordChange: Get.parameters['page'] == 'password-change',
              )),
      GetPage(
          name: search,
          page: () => SearchScreen(queryText: Get.parameters['query'])),
      GetPage(
          name: store,
          page: () {
            return Get.arguments ??
                StoreScreen(
                  store: Store(
                      id: Get.parameters['id'] != 'null' &&
                              Get.parameters['id'] != null
                          ? int.parse(Get.parameters['id']!)
                          : null),
                  fromModule: Get.parameters['page'] != null &&
                      Get.parameters['page'] == 'module',
                  slug: Get.parameters['slug'] ?? '',
                );
          }),
      GetPage(
          name: orderDetails,
          page: () {
            return Get.arguments ??
                OrderDetailsScreen(
                    orderId: int.parse(Get.parameters['id'] ?? '0'),
                    orderModel: null,
                    fromNotification: Get.parameters['from'] == 'true');
          }),
      GetPage(name: profile, page: () => const ProfileScreen()),
      GetPage(name: updateProfile, page: () => const UpdateProfileScreen()),
      GetPage(name: coupon, page: () => const CouponScreen()),
      GetPage(
          name: notification,
          page: () => NotificationScreen(
              fromNotification: Get.parameters['from'] == 'true')),
      GetPage(
          name: map,
          page: () {
            List<int> decode =
                base64Decode(Get.parameters['address']!.replaceAll(' ', '+'));
            AddressModel data =
                AddressModel.fromJson(jsonDecode(utf8.decode(decode)));
            return MapScreen(
                fromStore: Get.parameters['page'] == 'store',
                address: data,
                isFood: Get.parameters['module'] == 'true');
          }),
      GetPage(name: address, page: () => const AddressScreen()),
      GetPage(
        name: orderSuccess,
        page: () => OrderSuccessfulScreen(orderID: Get.parameters['id']),
      ),
      GetPage(
          name: payment,
          page: () {
            OrderModel order = OrderModel(
              id: int.parse(Get.parameters['id']!),
              orderType: Get.parameters['type'],
              userId: int.parse(Get.parameters['user']!),
              orderAmount: double.parse(Get.parameters['amount']!),
            );
            bool isCodActive = Get.parameters['cod-delivery'] == 'true';
            String addFundUrl = '';
            String paymentMethod = Get.parameters['payment-method']!;
            if (Get.parameters['add-fund-url'] != null &&
                Get.parameters['add-fund-url'] != 'null') {
              addFundUrl = Get.parameters['add-fund-url']!;
            }
            return AppConstants.payInWevView
                ? PaymentWebViewScreen(
                    orderModel: order,
                    isCashOnDelivery: isCodActive,
                    addFundUrl: addFundUrl,
                    paymentMethod: paymentMethod,
                  )
                : PaymentScreen(
                    orderModel: order,
                    isCashOnDelivery: isCodActive,
                    addFundUrl: addFundUrl,
                    paymentMethod: paymentMethod);
          }),
      GetPage(
          name: checkout,
          page: () {
            CheckoutScreen? checkoutScreen = Get.arguments;
            bool fromCart = Get.parameters['page'] == 'cart';
            return checkoutScreen ??
                (!fromCart
                    ? const NotFound()
                    : CheckoutScreen(
                        cartList: null,
                        fromCart: Get.parameters['page'] == 'cart',
                        storeId: Get.parameters['store-id'] != 'null'
                            ? int.parse(Get.parameters['store-id']!)
                            : null,
                      ));
          }),
      GetPage(
          name: orderTracking,
          page: () => OrderTrackingScreen(orderID: Get.parameters['id'])),
      GetPage(
          name: basicCampaign,
          page: () {
            BasicCampaignModel data = BasicCampaignModel.fromJson(jsonDecode(
                utf8.decode(base64Decode(
                    Get.parameters['data']!.replaceAll(' ', '+')))));
            return CampaignScreen(campaign: data);
          }),
      GetPage(
          name: html,
          page: () => HtmlViewerScreen(
                htmlType: Get.parameters['page'] == 'terms-and-condition'
                    ? HtmlType.termsAndCondition
                    : Get.parameters['page'] == 'privacy-policy'
                        ? HtmlType.privacyPolicy
                        : Get.parameters['page'] == 'shipping-policy'
                            ? HtmlType.shippingPolicy
                            : Get.parameters['page'] == 'cancellation-policy'
                                ? HtmlType.cancellation
                                : Get.parameters['page'] == 'refund-policy'
                                    ? HtmlType.refund
                                    : HtmlType.aboutUs,
              )),
      GetPage(name: categories, page: () => const CategoryScreen()),
      GetPage(
          name: categoryItem,
          page: () {
            List<int> decode =
                base64Decode(Get.parameters['name']!.replaceAll(' ', '+'));
            String data = utf8.decode(decode);
            return CategoryItemScreen(
                categoryID: Get.parameters['id'], categoryName: data);
          }),
      GetPage(
          name: popularItems,
          page: () => PopularItemScreen(
              isPopular: Get.parameters['page'] == 'popular')),
      GetPage(name: itemCampaign, page: () => const ItemCampaignScreen()),
      GetPage(name: support, page: () => const SupportScreen()),
      GetPage(
          name: update,
          page: () =>
              UpdateScreen(isUpdate: Get.parameters['update'] == 'true')),
      GetPage(name: cart, page: () => const CartScreen(fromNav: false)),
      GetPage(
          name: addAddress,
          page: () => AddAddressScreen(
                fromCheckout: Get.parameters['page'] == 'checkout',
                fromRide: Get.parameters['ride'] == 'true',
                zoneId: int.parse(Get.parameters['zone_id']!),
              )),
      GetPage(
          name: editAddress,
          page: () => AddAddressScreen(
                fromCheckout: false,
                fromRide: false,
                address: AddressModel.fromJson(jsonDecode(utf8.decode(base64Url
                    .decode(Get.parameters['data']!.replaceAll(' ', '+'))))),
              )),
      GetPage(name: rateReview, page: () => Get.arguments ?? const NotFound()),
      GetPage(
          name: storeReview,
          page: () => ReviewScreen(storeID: Get.parameters['id'])),
      GetPage(
          name: allStores,
          page: () => AllStoreScreen(
                isPopular: Get.parameters['page'] == 'popular',
                isFeatured: Get.parameters['page'] == 'featured',
              )),
      GetPage(
          name: itemImages,
          page: () => ImageViewerScreen(
                item: Item.fromJson(jsonDecode(utf8.decode(base64Url
                    .decode(Get.parameters['item']!.replaceAll(' ', '+'))))),
              )),
      GetPage(name: parcelCategory, page: () => const ParcelCategoryScreen()),
      GetPage(
          name: parcelLocation,
          page: () => ParcelLocationScreen(
                category: ParcelCategoryModel.fromJson(jsonDecode(utf8.decode(
                    base64Url.decode(
                        Get.parameters['data']!.replaceAll(' ', '+'))))),
              )),
      GetPage(
          name: parcelRequest,
          page: () => ParcelRequestScreen(
                parcelCategory: ParcelCategoryModel.fromJson(jsonDecode(
                    utf8.decode(base64Url.decode(
                        Get.parameters['category']!.replaceAll(' ', '+'))))),
                pickedUpAddress: AddressModel.fromJson(jsonDecode(utf8.decode(
                    base64Url.decode(
                        Get.parameters['picked']!.replaceAll(' ', '+'))))),
                destinationAddress: AddressModel.fromJson(jsonDecode(
                    utf8.decode(base64Url.decode(
                        Get.parameters['destination']!.replaceAll(' ', '+'))))),
              )),
      GetPage(
          name: searchStoreItem,
          page: () => StoreItemSearchScreen(storeID: Get.parameters['id'])),
      GetPage(name: order, page: () => const OrderScreen()),
      GetPage(
          name: itemDetails,
          page: () =>
              Get.arguments ??
              ItemDetailsScreen(
                  item: Item(id: int.parse(Get.parameters['id']!)),
                  inStorePage: Get.parameters['page'] == 'restaurant')),
      GetPage(
          name: wallet,
          page: () {
            return WalletScreen(
              fromWallet: Get.parameters['flag'] != null ||
                  Get.parameters['page'] == 'wallet',
              fundStatus:
                  Get.parameters['flag'] ?? Get.parameters['payment_status'],
              token: Get.parameters['token'],
            );
          }),
      GetPage(name: referAndEarn, page: () => const ReferAndEarnScreen()),
      GetPage(
          name: messages,
          page: () {
            NotificationBody? notificationBody;
            if (Get.parameters['notification'] != 'null') {
              notificationBody = NotificationBody.fromJson(jsonDecode(
                  utf8.decode(base64Url.decode(
                      Get.parameters['notification']!.replaceAll(' ', '+')))));
            }
            User? user;
            if (Get.parameters['user'] != 'null') {
              user = User.fromJson(jsonDecode(utf8.decode(base64Url
                  .decode(Get.parameters['user']!.replaceAll(' ', '+')))));
            }
            return ChatScreen(
              notificationBody: notificationBody,
              user: user,
              index: Get.parameters['index'] != 'null'
                  ? int.parse(Get.parameters['index']!)
                  : null,
              fromNotification: Get.parameters['from'] == 'true',
              conversationID: (Get.parameters['conversation_id'] != null &&
                      Get.parameters['conversation_id'] != 'null')
                  ? int.parse(Get.parameters['conversation_id']!)
                  : null,
            );
          }),
      GetPage(name: conversation, page: () => const ConversationScreen()),
      GetPage(
          name: restaurantRegistration,
          page: () => const StoreRegistrationScreen()),
      GetPage(
          name: deliveryManRegistration,
          page: () => const DeliveryManRegistrationScreen()),
      GetPage(
          name: refund,
          page: () => RefundRequestScreen(orderId: Get.parameters['id'])),
      GetPage(
          name: selectRideMapLocation,
          page: () {
            AddressModel? addressModel;
            Vehicles? vehicle;
            if (Get.parameters['address'] != 'null') {
              addressModel = AddressModel.fromJson(jsonDecode(utf8.decode(
                  base64Url.decode(
                      Get.parameters['address']!.replaceAll(' ', '+')))));
            }
            if (Get.parameters['vehicle'] != 'null') {
              vehicle = Vehicles.fromJson(jsonDecode(utf8.decode(base64Url
                  .decode(Get.parameters['vehicle']!.replaceAll(' ', '+')))));
            }
            return SelectMapLocation(
              riderType: jsonDecode(utf8.decode(base64Url
                  .decode(Get.parameters['rider_type']!.replaceAll(' ', '+')))),
              address: addressModel,
              vehicle: vehicle,
            );
          }),
      GetPage(
        name: selectCarScreen,
        page: () => SelectCarScreen(
            filterBody: UserInformationBody.fromJson(jsonDecode(utf8.decode(
                base64Url
                    .decode(Get.parameters['body']!.replaceAll(' ', '+')))))),
      ),
      GetPage(
          name: carDetailsScreen,
          page: () => CarDetailsScreen(
                vehicle: Vehicles.fromJson(jsonDecode(utf8.decode(base64Url
                    .decode(Get.parameters['vehicle']!.replaceAll(' ', '+'))))),
                filterBody: UserInformationBody.fromJson(jsonDecode(utf8.decode(
                    base64Url.decode(
                        Get.parameters['body']!.replaceAll(' ', '+'))))),
              )),
      GetPage(
          name: bookingCheckoutScreen,
          page: () => BookingCheckoutScreen(
                vehicle: Vehicles.fromJson(jsonDecode(utf8.decode(base64Url
                    .decode(Get.parameters['vehicle']!.replaceAll(' ', '+'))))),
                filterBody: UserInformationBody.fromJson(jsonDecode(utf8.decode(
                    base64Url.decode(
                        Get.parameters['body']!.replaceAll(' ', '+'))))),
              )),
      GetPage(name: tripHistoryScreen, page: () => const TripHistoryScreen()),
      GetPage(name: orderStatusScreen, page: () => const OrderStatusScreen()),
      GetPage(
          name: tripCompletedConfirmationScreen,
          page: () => const TripCompletedConfirmationScreen()),
      GetPage(name: taxiCouponScreen, page: () => const TaxiCouponScreen()),
      GetPage(name: digitalPaymentScreen, page: () => const DigitalGold()),
    ];

    return routes;
  }

  // static Widget getRoute(Widget navigateTo,
  //     {AccessLocationScreen? locationScreen, bool byPuss = false}) {
  //   final configModel = Get.find<SplashController>().configModel;
  //   double? minimumVersion = 3.3;
  //   if (GetPlatform.isAndroid) {
  //     minimumVersion = configModel?.appMinimumVersionAndroid;
  //   } else if (GetPlatform.isIOS) {
  //     minimumVersion = configModel?.appMinimumVersionIos;
  //   }
  //   return AppConstants.appVersion < (minimumVersion ?? 0)
  //       ? const UpdateScreen(isUpdate: true)
  //       : configModel?.maintenanceMode != null
  //           ? navigateTo
  //           : navigateTo;
  // }
}

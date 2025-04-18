import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:payapp/data/api/api_client.dart';
import 'package:payapp/data/model/body/delivery_man_body.dart';
import 'package:payapp/data/model/body/store_body.dart';
import 'package:payapp/data/model/body/signup_body.dart';
import 'package:payapp/data/model/body/social_log_in_body.dart';
import 'package:payapp/data/model/response/address_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import '../../src/src.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> registration(SignUpBody signUpBody) async {
    final registerJson = {
      "f_name": signUpBody.fName!,
      "l_name": signUpBody.lName!,
      "name": signUpBody.name!,
      "email": signUpBody.email!,
      "phone": signUpBody.phone!,
      "password": signUpBody.password!,
      "field_type": "email",
      "login_type": "manual",
    };
    return await apiClient.postData(
      AppConstants.registerUri,
      registerJson,
    );
  }

  Future<Response> login({String? email, String? password}) async {
    return await apiClient.postData(
        AppConstants.loginUri, {"email": email, "password": password});
  }

  Future<Response> loginWithSocialMedia(
      SocialLogInBody socialLogInBody, int timeout) async {
    return await apiClient.postData(
      AppConstants.socialLoginUri,
      socialLogInBody.toJson(),
      timeout: timeout,
    );
  }

  Future<Response> registerWithSocialMedia(
      SocialLogInBody socialLogInBody) async {
    return await apiClient.postData(
        AppConstants.socialRegisterUri, socialLogInBody.toJson());
  }

  Future<Response> updateToken({String notificationDeviceToken = ''}) async {
    String? deviceToken;
    if (notificationDeviceToken.isEmpty) {
      if (GetPlatform.isIOS && !GetPlatform.isWeb) {
        FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
            alert: true, badge: true, sound: true);
        NotificationSettings settings =
            await FirebaseMessaging.instance.requestPermission(
          alert: true,
          announcement: false,
          badge: true,
          carPlay: false,
          criticalAlert: false,
          provisional: false,
          sound: true,
        );
        if (settings.authorizationStatus == AuthorizationStatus.authorized) {
          deviceToken = await _saveDeviceToken();
        }
      } else {
        deviceToken = await _saveDeviceToken();
      }
      if (!GetPlatform.isWeb) {
        FirebaseMessaging.instance.subscribeToTopic(AppConstants.topic);
      }
    }
    return await apiClient.postData(AppConstants.tokenUri, {
      "_method": "put",
      "cm_firebase_token": notificationDeviceToken.isNotEmpty
          ? notificationDeviceToken
          : deviceToken
    });
  }

  Future<String?> _saveDeviceToken() async {
    String? deviceToken = '@';
    if (!GetPlatform.isWeb) {
      try {
        deviceToken = (await FirebaseMessaging.instance.getToken())!;
      } catch (_) {}
    }
    if (deviceToken != null) {
      if (kDebugMode) {
        print('--------Device Token---------- $deviceToken');
      }
    }
    return deviceToken;
  }

  Future<Response> forgetPassword(String? phone) async {
    return await apiClient
        .postData(AppConstants.forgetPasswordUri, {"phone": phone});
  }

  Future<Response> verifyToken(String? phone, String token) async {
    return await apiClient.postData(
        AppConstants.verifyTokenUri, {"phone": phone, "reset_token": token});
  }

  Future<Response> resetPassword(String? resetToken, String number,
      String password, String confirmPassword) async {
    return await apiClient.postData(
      AppConstants.resetPasswordUri,
      {
        "_method": "put",
        "reset_token": resetToken,
        "phone": number,
        "password": password,
        "confirm_password": confirmPassword
      },
    );
  }

  Future<Response> checkEmail(String email) async {
    return await apiClient
        .postData(AppConstants.checkEmailUri, {"email": email});
  }

  Future<Response> verifyEmail(String email, String token) async {
    return await apiClient.postData(
        AppConstants.verifyEmailUri, {"email": email, "token": token});
  }

  Future<Response> updateZone() async {
    return await apiClient.getData(AppConstants.updateZoneUri);
  }

  Future<Response> verifyPhone(String? phone, String otp) async {
    return await apiClient
        .postData(AppConstants.verifyPhoneUri, {"phone": phone, "otp": otp});
  }

  // for  user token
  Future<bool> saveUserToken(String token) async {
    apiClient.token = token;
    if (sharedPreferences.getString(AppConstants.userAddress) != null) {
      AddressModel? addressModel = AddressModel.fromJson(
          jsonDecode(sharedPreferences.getString(AppConstants.userAddress)!));
      apiClient.updateHeader(
        token,
        addressModel.zoneIds,
        addressModel.areaIds,
        sharedPreferences.getString(AppConstants.languageCode),
        Get.find<SplashController>().module?.id,
        addressModel.latitude,
        addressModel.longitude,
      );
    } else {
      apiClient.updateHeader(
          token,
          null,
          null,
          sharedPreferences.getString(AppConstants.languageCode),
          Get.find<SplashController>().module?.id,
          null,
          null);
    }

    return await sharedPreferences.setString(
        AppConstants.ecommerceToken, token);
  }

  Future<bool> saveEarningPoint(String point) async {
    return await sharedPreferences.setString(AppConstants.earnPoint, point);
  }

  String getEarningPint() {
    return sharedPreferences.getString(AppConstants.earnPoint) ?? "";
  }

  Future<bool> saveDmTipIndex(String index) async {
    return await sharedPreferences.setString(AppConstants.dmTipIndex, index);
  }

  String getDmTipIndex() {
    return sharedPreferences.getString(AppConstants.dmTipIndex) ?? "";
  }

  String getUserToken() {
    return sharedPreferences.getString(AppConstants.ecommerceToken) ?? "";
  }

  bool isLoggedIn() {
    return sharedPreferences.containsKey(AppConstants.ecommerceToken);
  }

  bool clearSharedData() {
    if (!GetPlatform.isWeb) {
      FirebaseMessaging.instance.unsubscribeFromTopic(AppConstants.topic);
      apiClient.postData(
          AppConstants.tokenUri, {"_method": "put", "cm_firebase_token": '@'});
    }
    sharedPreferences.remove(AppConstants.ecommerceToken);
    sharedPreferences.setStringList(AppConstants.cartList, []);
    sharedPreferences.remove(AppConstants.userAddress);
    apiClient.token = null;
    apiClient.updateHeader(null, null, null, null, null, null, null);
    return true;
  }

  bool clearSharedAddress() {
    sharedPreferences.remove(AppConstants.userAddress);
    return true;
  }

  // for  Remember Email
  Future<void> saveUserEmailAndPassword(String email, String password) async {
    try {
      await sharedPreferences.setString(AppConstants.userPassword, password);
      await sharedPreferences.setString(AppConstants.userEmail, email);
    } catch (e) {
      rethrow;
    }
  }

  String getUserEmail() {
    return sharedPreferences.getString(AppConstants.userEmail) ?? "";
  }

  String getUserNumber() {
    return sharedPreferences.getString(AppConstants.userNumber) ?? "";
  }

  String getUserCountryCode() {
    return sharedPreferences.getString(AppConstants.userCountryCode) ?? "";
  }

  String getUserPassword() {
    return sharedPreferences.getString(AppConstants.userPassword) ?? "";
  }

  bool isNotificationActive() {
    return sharedPreferences.getBool(AppConstants.notification) ?? true;
  }

  void setNotificationActive(bool isActive) {
    if (isActive) {
      updateToken();
    } else {
      if (!GetPlatform.isWeb) {
        updateToken(notificationDeviceToken: '@');
        FirebaseMessaging.instance.unsubscribeFromTopic(AppConstants.topic);
        if (isLoggedIn()) {
          FirebaseMessaging.instance.unsubscribeFromTopic(
              'zone_${Get.find<LocationController>().getUserAddress()!.zoneId}_customer');
        }
      }
    }
    sharedPreferences.setBool(AppConstants.notification, isActive);
  }

  Future<bool> clearUserEmailAndPassword() async {
    await sharedPreferences.remove(AppConstants.userPassword);
    return await sharedPreferences.remove(AppConstants.userEmail);
  }

  Future<Response> getZoneList() async {
    return await apiClient.getData(AppConstants.zoneListUri);
  }

  Future<Response> registerStore(
      StoreBody store, XFile? logo, XFile? cover) async {
    return apiClient.postMultipartData(
      AppConstants.storeRegisterUri,
      store.toJson(),
      [MultipartBody('logo', logo), MultipartBody('cover_photo', cover)],
    );
  }

  Future<Response> registerDeliveryMan(
      DeliveryManBody deliveryManBody, List<MultipartBody> multiParts) async {
    return apiClient.postMultipartData(
        AppConstants.dmRegisterUri, deliveryManBody.toJson(), multiParts);
  }

  Future<Response> getModules(int? zoneId) async {
    return await apiClient.getData(
      '${AppConstants.moduleUri}?zone_id=$zoneId',
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
  }

  Future<Response> getVehicleList() async {
    return await apiClient.getData(AppConstants.vehiclesUri);
  }
}

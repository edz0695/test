import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:payapp/services/apis/apiservice.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/hiveConfig.dart';
import '../core/services/hiveDatabase.dart';
import '../models/usermodel.dart';
import '../util/app_constants.dart';

class LoginSignUpProvider extends ChangeNotifier {
  bool? emailExists;
  bool checkingUser = false;
  bool loading = false;
  bool verifyingOTP = false;
  bool signingUp = false;
  UserModel? userModel;
  bool uploadingKycDetails = false;

  late Box box;

  Future<UserModel?> initUser() async {
    print("user model is");
    box = await HiveDataBase.openBox(boxName: HiveConfig.user);
    final user =
        await HiveDataBase.getSingleItem(key: HiveConfig.user, box: box);
    if (user != null) {
      userModel = UserModel.fromMap(user);
      updateLoggedInUser(userId: userModel?.id);
      return userModel;
    } else {
      return null;
    }
  }

  Future<bool> initSkip() async {
    final value =
        await HiveDataBase.getSingleItem(key: HiveConfig.skipLogin, box: box);
    if (value != null) {
      return value;
    }
    return false;
  }

  Future<bool> initOnBoarding() async {
    final value =
        await HiveDataBase.getSingleItem(key: HiveConfig.onBoarding, box: box);
    if (value != null) {
      return value;
    }
    return false;
  }

  Future<void> logOutUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove(AppConstants.ecommerceToken);
    sharedPreferences.setStringList(AppConstants.cartList, []);
  }

  Future<UserModel?> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      loading = true;
      notifyListeners();
      final value = await ApiService.loginWithEmailAndPassword(email, password)
          .then((value) async {
        box = await HiveDataBase.openBox(boxName: HiveConfig.user);
        await box.clear();
        await HiveDataBase.saveSingleItem(
            box: box, data: value, key: HiveConfig.user);
        userModel = UserModel.fromMap(value);
        return userModel;
      }).onError((error, stackTrace) {
        loading = false;
        notifyListeners();
        Fluttertoast.showToast(
            msg: error.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 13.0);
        return Future.error(error.toString());
      });
      loading = false;
      notifyListeners();
      return value;
    } catch (e) {
      return null;
    }
  }

  Future<UserModel?> updateLoggedInUser({required String? userId}) async {
    try {
      final userDetails = await ApiService.fetchUserDetails(userId: userId!);
      print("User details fetched successfully: $userDetails");

      await box.clear();
      await HiveDataBase.saveSingleItem(
        box: box,
        data: userDetails,
        key: HiveConfig.user,
      );

      // Parse the user model
      userModel = UserModel(
        id: userDetails['id'] ?? '',
        name: userDetails['name'] ?? '',
        email: userDetails['email'] ?? '',
        mobile: userDetails['mobile'] ?? '',
        kycStatus: userDetails['kyc_status'].toString(),
        Token: userDetails['refreshToken'].toString(),
        referCode: userDetails['refer_code'].toString(),
        password: "",
        aadharCardNo: userDetails['aadhar_card_no'].toString(),
        signUpMethod: userDetails['sign_up_method'] ?? '',
        panCardNo: userDetails['pan_card_no'].toString(),
        aadharImage: userDetails['aadhar_img'] ?? '',
        userKycStatus: '',
        status: userDetails['status'].toString(),
        image: "",
        dob: userDetails['dob'].toString(),
        balance: userDetails['balance'].toString(),
        educationType: userDetails['is_student']
            ? EducationType.student
            : EducationType.teacher,
        educationTypeTeacher: userDetails['is_student']
            ? EducationType.student
            : EducationType.teacher,
        academicStatus: '',
        competitive: userDetails['isCompetitive'].toString(),
        panImage: userDetails['pan_img'].toString(),
        managerId: '',
        points: userDetails['points'].toString(),
        createdAt: "",
        isBanned: userDetails['is_ban'].toString(),
      );
      print("User details updated successfully.");
      return userModel;
    } catch (e) {
      print("Error in updateLoggedInUser: $e");
      return null;
    }
  }

  Future checkUserEmail(String email) async {
    checkingUser = true;
    notifyListeners();
    await ApiService.checkUserEmail(email).then((value) async {
      emailExists = value;
      return value;
    }).onError((error, stackTrace) {
      checkingUser = false;
      notifyListeners();
      return Future.error(error.toString());
    });

    checkingUser = false;
    notifyListeners();
    return emailExists;
  }

  void clearExistingEmail() {
    emailExists = null;
    notifyListeners();
  }

  Future<void> doneOnBoarding() async {
    await HiveDataBase.saveSingleItem(
      box: box,
      data: true,
      key: HiveConfig.onBoarding,
    );
  }

  Future<void> skipLogin() async {
    await HiveDataBase.saveSingleItem(
        box: box, data: true, key: HiveConfig.skipLogin);
  }

  //old Functions

  Future verifyOTP(String email, String otp) async {
    verifyingOTP = true;
    notifyListeners();
    var result = await ApiService.verifyOTP(email, otp);
    verifyingOTP = false;
    notifyListeners();
    return result;
  }

  Future signUp(
    String firstName,
    String lastName,
    String email,
    String mobile,
    String password,
    String refID,
  ) async {
    signingUp = true;
    notifyListeners();
    print(email);
    print(mobile);
    var result = await ApiService.signUp(
            firstName, lastName, email, mobile, password, refID)
        .then((value) {
      print("Registered....");
      return value;
    }).onError((error, stackTrace) {
      // print([220, "errrrrrrrrrrrrrr"]);
      signingUp = false;
      notifyListeners();

      return Future.error(error!);
    });
    signingUp = false;
    notifyListeners();
    return result;
  }

// Future loginWithGoogle() async{
//   final googleSignIn = GoogleSignIn();
//   try{
//     final googleUser = await googleSignIn.signIn();
//     if (googleUser == null)
//     {
//       loading=false;
//       notifyListeners();
//       return;
//     }
//     var status = await ApiService.checkUserGmail(googleUser.email);
//     if(status==false){
//       print("Email Already Exists");
//     }
//     else{
//       print("Sign Up New User.");
//     }
//     print(googleUser.photoUrl);
//   }
//   catch(e){
//     print(e.toString());
//   }
// }
}

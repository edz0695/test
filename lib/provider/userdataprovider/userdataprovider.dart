// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:payapp/config/apiconfig.dart';
// import 'package:payapp/models/usermodel.dart';
// import 'package:payapp/services/apis/apiservice.dart';
//
//
// class UserDataProvider extends ChangeNotifier{
//   bool uploadingKycDetails = false;
//   bool loading = false;
//   UserModel? user;
//
//   UserDataProvider(){
//     // getUser();
//   }
//
//   // Future getUser() async {
//   //   loading = true;
//   //   // notifyListeners();
//   //   var userResult = await ApiService.fetchUserDetails();
//   //   user = userResult;
//   //   loading = false;
//   //   notifyListeners();
//   //   return userResult;
//   // }
//
//
//   Future uploadKycDetails(File? aadharImage, File? panImage) async {
//     var result = await ApiService.updateKyc(aadharImage, panImage);
//     uploadingKycDetails = false;
//     notifyListeners();
//     return result;
//   }
// }
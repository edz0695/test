import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:payapp/core/components/print_text.dart';

import '../../themes/colors.dart';

class CommunityProvider extends ChangeNotifier {
  ImagePicker picker = ImagePicker();
  File? imageFile;
  File? videoFile;

  Future<File?> pickCameraPostImages() async {
    var pickedImage = await picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      imageFile = File(pickedImage.path);
      printThis(pickedImage.path);
      Get.snackbar(
        'Osama',
        'we got your image ✅',
        snackPosition: SnackPosition.BOTTOM,
        // Set the position
        backgroundColor: Colors.blue,
        // Customize background color
        colorText: Colors.white,
        // Customize text color
        borderRadius: 10,
        // Customize border radius
        animationDuration: const Duration(seconds: 1),
      );
    } else {
      Get.snackbar(
        'Osama',
        'Process cancelled',
        snackPosition: SnackPosition.BOTTOM,
        // Set the position
        backgroundColor: Colors.yellow.shade300,
        // Customize background color
        colorText: Colors.white,
        // Customize text color
        borderRadius: 10,
        // Customize border radius
        animationDuration: const Duration(seconds: 1),
      );
    }
    notifyListeners();
    return imageFile;
  }

  Future<File?> pickGalleryPostImages() async {
    var pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      imageFile = File(pickedImage.path);
      printThis(pickedImage.path);
      Get.snackbar(
        'Osama',
        'we got your image ✅',
        snackPosition: SnackPosition.BOTTOM,

        backgroundColor:ThemeColors.darkBlueColor,

        colorText: Colors.white,
        // Customize text color
        borderRadius: 10,
        // Customize border radius
        animationDuration: const Duration(seconds: 1),
      );
    } else {
      Get.snackbar(
        'Osama',
        'Process cancelled',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor:ThemeColors.darkBlueColor,
        colorText: Colors.white,
        borderRadius: 10,
        animationDuration: const Duration(seconds: 1),
      );
    }
    notifyListeners();
    return imageFile;
  }

  Future<File?> pickCameraPostVideo() async {
    var pickedImage = await picker.pickVideo(source: ImageSource.camera);
    if (pickedImage != null) {
      videoFile = File(pickedImage.path);
      printThis(pickedImage.path);
      Get.snackbar(
        'Osama',
        'we got your video ✅',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: ThemeColors.darkBlueColor,
        colorText: Colors.white,
        borderRadius: 10,
        animationDuration: const Duration(seconds: 1),
      );
    } else {
      Get.snackbar(
        'Osama',
        'Process cancelled',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: ThemeColors.darkBlueColor,
        colorText: Colors.white,
        borderRadius: 10,
        animationDuration: const Duration(seconds: 1),
      );
    }
    notifyListeners();
    return videoFile;
  }

  Future<File?> pickGalleryPostVideo() async {
    ImageSource source = ImageSource.gallery;

    Get.dialog(
      AlertDialog(
        title: const Text('Video source?'),
        content: const Text('Choose where to pick the video?'),
        actionsAlignment: MainAxisAlignment.center,
        actions: <Widget>[
          OutlinedButton.icon(
            onPressed: () {
              Get.back();
              source = ImageSource.gallery;
            },
            icon: const Icon(Icons.image),
            label: const Text('Gallery'),
          ),
          OutlinedButton.icon(
            onPressed: () {
              Get.back();
              source = ImageSource.camera;
            },
            icon: const Icon(Icons.camera_alt_rounded),
            label: const Text('Camera'),
          ),
        ],
      ),
    ).whenComplete(() async {
      var pickedImage = await picker.pickVideo(source: source);
      if (pickedImage != null) {
        videoFile = File(pickedImage.path);
        printThis(pickedImage.path);
        Get.snackbar(
          'Osama',
          'we got your video ✅',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: ThemeColors.darkBlueColor,
          colorText: Colors.white,
          borderRadius: 10,
          animationDuration: const Duration(seconds: 2),
        );
      } else {
        Get.snackbar(
          'Osama',
          'Process cancelled',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: ThemeColors.darkBlueColor,
          colorText: Colors.white,
          borderRadius: 10,
          animationDuration: const Duration(seconds: 2),
        );
      }
    });

    notifyListeners();
    return videoFile;
  }

  void clearImageFile() {
    imageFile = null;
    notifyListeners();
  }

  void clearVideoFile() {
    videoFile = null;
    notifyListeners();
  }
}

import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:payapp/core/components/print_text.dart';
import 'package:payapp/themes/colors.dart';
import 'dart:ui' as ui;

class PODAddActionModel {
  final String actionName;

  final IconData actionIcon;

  final VoidCallback action;

  PODAddActionModel({
    required this.actionName,
    required this.actionIcon,
    required this.action,
  });
}

class PODProvider extends ChangeNotifier {
  ImagePicker picker = ImagePicker();
  File? imageFile;
  TextEditingController textController = TextEditingController();

  void addTextToDesign(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    showModalBottomSheet(
        showDragHandle: true,
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        builder: (BuildContext context) {
          return SizedBox(
            height: screenHeight * .85,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Row(
                          children: [
                            const Text(
                              'Add your text from here',
                              style: TextStyle(
                                color: ThemeColors.darkBlueColor,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            FloatingActionButton.extended(
                              onPressed: () {
                                Get.close(1);
                                notifyListeners();
                              },
                              label: const Text(
                                'Add Now',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: screenHeight * .25,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: ThemeColors.darkBlueColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Future<ui.Image> captureEditedImage(GlobalKey key) async {
    RenderRepaintBoundary boundary =
        key.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(pixelRatio: 3.0);

    notifyListeners();
    return image;
  }

  void saveEditedImageWithWatermark(GlobalKey key) async {
    ui.Image editedImage = await captureEditedImage(key);

    // Convert ui.Image to a ByteData (bytes) and save it to a file
    ByteData? byteData =
        await editedImage.toByteData(format: ui.ImageByteFormat.png);
    Uint8List? pngBytes = byteData?.buffer.asUint8List();

    // Save the image to a file
    File('path_to_save_edited_image.png').writeAsBytesSync(pngBytes!);
    notifyListeners();
  }

  Future<File?> pickCameraImages() async {
    var pickedImage = await picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      imageFile = File(pickedImage.path);
      printThis(pickedImage.path);
      Get.snackbar(
        'Osama',
        'we got your image ✅',
        snackPosition: SnackPosition.BOTTOM,
        // Set the position
        backgroundColor: ThemeColors.darkBlueColor,
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
        backgroundColor: ThemeColors.darkBlueColor,
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

  Future<File?> pickGalleryImages() async {
    var pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      imageFile = File(pickedImage.path);
      printThis(pickedImage.path);
      Get.snackbar(
        'Osama',
        'we got your image ✅',
        snackPosition: SnackPosition.BOTTOM,

        backgroundColor: ThemeColors.darkBlueColor,

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
        backgroundColor: ThemeColors.darkBlueColor,
        colorText: Colors.white,
        borderRadius: 10,
        animationDuration: const Duration(seconds: 1),
      );
    }
    notifyListeners();
    return imageFile;
  }

  Future<File?> pickImage() async {
    ImageSource source = ImageSource.gallery;

    Get.dialog(
      AlertDialog(
        title: const Text('Image source?'),
        content: const Text('Choose where to pick the Image?'),
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
      if (source == ImageSource.camera) {
        pickCameraImages();
      } else {
        pickGalleryImages();
      }
    });

    notifyListeners();
    return imageFile;
  }

  void clearImageFile() {
    imageFile = null;
    notifyListeners();
  }

  void openBottomSheet(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    showModalBottomSheet(
        showDragHandle: true,
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        builder: (BuildContext context) {
          return SizedBox(
            height: screenHeight * .85,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          'Select Your Design Category',
                          style: TextStyle(
                            color: ThemeColors.darkBlueColor,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    // SelectClassesList(),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class NetworkInfo {
  // final Connectivity connectivity;
  // NetworkInfo(this.connectivity);

  // Future<bool> get isConnected async {
  //   ConnectivityResult result = await connectivity.checkConnectivity();
  //   return result != ConnectivityResult.none;
  // }

  // static void checkConnectivity(BuildContext context) {
  //   Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
  //     if(Get.find<SplashController>().firstTimeConnectionCheck) {
  //       Get.find<SplashController>().setFirstTimeConnectionCheck(false);
  //     }else {
  //       bool isNotConnected = result == ConnectivityResult.none;
  //       isNotConnected ? const SizedBox() : ScaffoldMessenger.of(context).hideCurrentSnackBar();
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //         backgroundColor: isNotConnected ? Colors.red : Colors.green,
  //         duration: Duration(seconds: isNotConnected ? 6000 : 3),
  //         content: Text(
  //           isNotConnected ? 'no_connection' : 'connected',
  //           textAlign: TextAlign.center,
  //         ),
  //       ));
  //     }
  //   });
  // }

  static Future<XFile> compressImage(XFile file) async {
    // Get the file size in MB
    final int fileSizeInBytes = await file.length();
    final double fileSizeInMB = fileSizeInBytes / 1048576;

    // Determine quality based on file size
    int quality;
    if (fileSizeInMB < 2) {
      quality = 90;
    } else if (fileSizeInMB < 5) {
      quality = 50;
    } else if (fileSizeInMB < 10) {
      quality = 10;
    } else {
      quality = 1;
    }

    // Compress the image
    final List<int>? compressedBytes =
        await FlutterImageCompress.compressWithFile(
      file.path,
      quality: quality,
      format: CompressFormat.webp, // or CompressFormat.jpeg based on preference
    );

    if (compressedBytes == null) {
      throw Exception("Image compression failed.");
    }

    // Convert List<int> to Uint8List
    final Uint8List uint8List = Uint8List.fromList(compressedBytes);

    if (kDebugMode) {
      print('Input size: ${fileSizeInMB.toStringAsFixed(2)} MB');
      print(
          'Output size: ${(uint8List.lengthInBytes / 1048576).toStringAsFixed(2)} MB');
    }

    // Return compressed file as XFile
    return XFile.fromData(uint8List, mimeType: "image/webp");
  }
}

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:payapp/src/src.dart';

class PreviewScreen extends StatelessWidget {
  const PreviewScreen({super.key, required this.bytes});
  final Uint8List bytes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Preview"),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_left,
              color: Colors.indigo,
            )),
      ),
      body: Center(
        child: Image.memory(
          bytes,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

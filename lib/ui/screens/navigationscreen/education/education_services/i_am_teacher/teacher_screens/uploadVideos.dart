import 'package:flutter/material.dart';
import 'package:payapp/themes/colors.dart';

class UploadVideos extends StatefulWidget {
  const UploadVideos({super.key});

  @override
  State<UploadVideos> createState() => _UploadVideosState();
}

class _UploadVideosState extends State<UploadVideos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload Videos"),
        elevation: 0,
        backgroundColor: ThemeColors.primaryBlueColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1, color: ThemeColors.primaryBlueColor.withOpacity(0.3))
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.upload_outlined, color: ThemeColors.primaryBlueColor,),
                  Text("Upload Video",)
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: ThemeColors.primaryBlueColor,
            borderRadius: BorderRadius.circular(10)
        ),
        child: const Center(
          child: Text("Upload Video",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 15
            ),
          ),
        ),
      ),
    );
  }
}

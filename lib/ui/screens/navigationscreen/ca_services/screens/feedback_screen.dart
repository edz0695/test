import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:payapp/ui/screens/navigationscreen/education/education_services/community/widgets/post_text_feild.dart';
import 'package:payapp/ui/widgets/app_bar_widget.dart';

import '../../education/education_services/community/screens/new_post_screen.dart';

class SendFeedBackScreen extends StatelessWidget {
  SendFeedBackScreen({super.key});

  TextEditingController controller = TextEditingController();
  static const List<Icon> icons = [
    Icon(
      Icons.camera_alt_rounded,
      color: Colors.green,
    ),
    Icon(
      Icons.image,
      color: Colors.yellow,
    ),
    Icon(
      Icons.slow_motion_video_outlined,
      color: Colors.blueAccent,
    ),
    Icon(
      Icons.emoji_people,
      color: Colors.teal,
    ),
    Icon(
      Icons.location_on,
      color: Colors.redAccent,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const AppBarWidget(
        title: 'Feedback',
        size: 55,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.0,vertical: 20),
                child: AddImageToPost(),
              ),
              MyTextField(controller: controller, minLines: 10),
              const SizedBox(height: 70),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 20),
            Text(
              "Submit Now".toUpperCase(),
              style: GoogleFonts.poppins(
                fontSize: 16.0,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            Lottie.asset(
              'assets/lottie/document_upload.json',
              width: 50,
              height: 50,
            ),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}

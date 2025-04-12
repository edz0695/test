import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:payapp/ui/widgets/glass_effect.dart';

class ProgressTab extends StatelessWidget {
  const ProgressTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(0),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            "assets/education/progress_background.jpg",
          ),
        ),
      ),
      child: ListView(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Lottie.asset(
              'assets/lottie/rocket-1.json',
              width: double.infinity,
            ),
          ),
          GlassEffect2(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withOpacity(.1),
              ),
              alignment: Alignment.center,
              child: const Text(
                'data will be shown here',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 5),
          GlassEffect2(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.blueGrey.withOpacity(.5),
                    Colors.blueGrey.withOpacity(.3),
                    Colors.white.withOpacity(.3),
                  ],
                ),
              ),
              alignment: Alignment.center,
              child: const Text(
                'data will be shown here',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 5),
          GlassEffect2(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withOpacity(.1),
              ),
              alignment: Alignment.center,
              child: const Text(
                'data will be shown here',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 5),
          GlassEffect2(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withOpacity(.1),
              ),
              alignment: Alignment.center,
              child: const Text(
                'data will be shown here',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../../config/route_config.dart';
import '../../../../../core/animations/shimmer_animation.dart';
import '../../../../../themes/colors.dart';
import '../education_services/home-tutor/screens/single-teacher.dart';

class BuildTeacherCard extends StatefulWidget {
  const BuildTeacherCard({
    super.key,
    required this.size,
    required this.title,
    required this.subTitle,
    required this.image,
    required this.rating,
    required this.teacherId,
  });

  final Size size;
  final String title;
  final String teacherId;
  final String rating;
  final String subTitle;
  final String image;

  @override
  State<BuildTeacherCard> createState() => _BuildTeacherCardState();
}

class _BuildTeacherCardState extends State<BuildTeacherCard> {
  final Set<int> isVisible = {};

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              key: const Key('1'),
              child: ClipPath(
                clipper: MyClipper(),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 1,
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    height: 220,
                    width: MediaQuery.of(context).size.width * .4,
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 5, color: ThemeColors.backgroundLightBlue),
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black38,
                          Colors.transparent,
                          Colors.transparent,
                        ],
                      ),
                      image: DecorationImage(
                        image: NetworkImage(
                          widget.image,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.only(left: 40, bottom: 5),
                  ),
                ),
              ),
            ),
            Align(
              widthFactor: 3.5,
              heightFactor: 2,
              alignment: Alignment.bottomLeft,
              key: const Key('22'),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(
                      width: 3, color: ThemeColors.backgroundLightBlue),
                  color: const Color(0xff283873),
                ),
                width: 45,
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    3,
                    (index) => Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: CircleAvatar(
                        backgroundColor: isVisible.contains(index)
                            ? Colors.blueAccent
                            : Colors.white,
                        radius: 15,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              if (isVisible.contains(index)) {
                                isVisible.remove(index);
                              } else {
                                isVisible.add(index);
                              }
                            });
                          },
                          child: Icon(
                            Icons.wallet_outlined,
                            size: 22.0,
                            color: isVisible.contains(index)
                                ? Colors.white
                                : const Color(0xff283873),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              key: const Key('2'),
              left: 40,
              bottom: 30,
              child: SizedBox(
                width: 110,
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: List.generate(
                    3,
                    (index) => AnimatedContainer(
                      curve: Curves.easeInQuart,
                      duration: const Duration(milliseconds: 600),
                      width: isVisible.contains(index) ? 120 : 0,
                      height: isVisible.contains(index) ? 30 : 0,
                      padding: const EdgeInsets.only(bottom: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                          child: Container(
                            alignment: Alignment.center,
                            color: Colors.white.withValues(alpha: .3),
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Text(
                              widget.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 10.0,
                                color: ThemeColors.darkBlueColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              key: const Key('3'),
              child: Container(
                width: 50,
                height: 25,
                alignment: Alignment.center,
                padding: const EdgeInsets.only(right: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff283873),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 18.0,
                    ),
                    Text(
                      widget.rating.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          margin: const EdgeInsets.only(bottom: 5, left: 5, right: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1, color: Colors.white),
            color: const Color(0xff283873),
          ),
          child: Text(
            widget.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 12.0),
          ),
        ),
        InkWell(
          onTap: () => RouteConfig.navigateTo(
              context,
              SingleTeacher(
                teacherId: widget.teacherId,
              )),
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1, color: Colors.white),
              color: const Color(0xff283873),
            ),
            child: const Text(
              'See Profile',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(30, size.height);
    path.lineTo(30, size.height - 90); // Adjusted this point to create a curve
    path.lineTo(0, size.height - 90);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

Widget buildSingleChapter({
  required Size size,
  required String title,
  required String subTitle,
  required String image,
  required VoidCallback onTap,
}) {
  return Container(
    width: size.width,
    height: 300,
    color: Colors.transparent,
    padding: const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
    margin: const EdgeInsets.only(bottom: 15),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Center(
            child: Image.network(
              image,
              height: 150,
              fit: BoxFit.cover,
              loadingBuilder: (
                BuildContext context,
                Widget child,
                ImageChunkEvent? loadingProgress,
              ) {
                if (loadingProgress == null) return child;
                return const Center(
                    child: ShimmerAnimation(
                  width: 100,
                  height: 150,
                ));
              },
              errorBuilder: (context, error, stackTrace) => const Center(
                child: ShimmerAnimation(
                  width: 100,
                  height: 150,
                ),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade300,
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(-1, 2))
              ],
            ),
            padding: const EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.blueAccent,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  subTitle,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                      fontSize: 14),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 17,
                          color: Colors.amber,
                        ),
                        Icon(
                          Icons.star,
                          size: 17,
                          color: Colors.amber,
                        ),
                        Icon(
                          Icons.star,
                          size: 17,
                          color: Colors.amber,
                        ),
                        Icon(
                          Icons.star,
                          size: 17,
                          color: Colors.amber,
                        ),
                        Icon(
                          Icons.star_border_outlined,
                          size: 17,
                          color: Colors.amber,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "4.5",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: ThemeColors.primaryBlueColor),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

class Group2 extends StatelessWidget {
  const Group2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 152.10,
          height: 219,
          child: Stack(
            children: [
              Positioned(
                left: 4.10,
                top: 111,
                child: Container(
                  width: 33,
                  height: 84,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFFBFCFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(23),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 33.10,
                top: 115,
                child: Transform(
                  transform: Matrix4.identity()
                    ..translate(0.0, 0.0)
                    ..rotateZ(1.57),
                  child: Container(
                    width: 73.76,
                    height: 23,
                    decoration: ShapeDecoration(
                      color: const Color(0xFF283873),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 1, color: Color(0x77283873)),
                        borderRadius: BorderRadius.circular(200),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 104.10,
                top: 0,
                child: Container(
                  width: 48,
                  height: 22,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF283873),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                  ),
                ),
              ),
              Positioned(
                left: 108.10,
                top: 3,
                child: Container(
                  width: 17,
                  height: 17,
                  padding: const EdgeInsets.only(
                    top: 1.42,
                    left: 1.42,
                    right: 1.42,
                    bottom: 2.12,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [],
                  ),
                ),
              ),
              const Positioned(
                left: 126.10,
                top: 4,
                child: Text(
                  '4.5',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 13.10,
                top: 121,
                child: Container(
                  width: 17,
                  height: 17,
                  decoration: const ShapeDecoration(
                    color: Color(0xFFFBFDFF),
                    shape: OvalBorder(),
                  ),
                ),
              ),
              Positioned(
                left: 13.10,
                top: 120,
                child: Container(
                  width: 72,
                  height: 18,
                  decoration: ShapeDecoration(
                    color: const Color(0xA5FDF4F4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(23),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 15.60,
                top: 123,
                child: Container(
                  width: 12,
                  height: 12,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(),
                  child: const Stack(children: []),
                ),
              ),
              Positioned(
                left: 13.10,
                top: 143,
                child: Container(
                  width: 17,
                  height: 17,
                  decoration: const ShapeDecoration(
                    color: Color(0xFFF7FAFF),
                    shape: OvalBorder(),
                  ),
                ),
              ),
              Positioned(
                left: 15.60,
                top: 145,
                child: Container(
                  width: 12,
                  height: 12,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(),
                  child: const Stack(children: []),
                ),
              ),
              Positioned(
                left: 13.10,
                top: 165,
                child: Container(
                  width: 17,
                  height: 17,
                  decoration: const ShapeDecoration(
                    color: Color(0xFFFBFDFF),
                    shape: OvalBorder(),
                  ),
                ),
              ),
              Positioned(
                left: 15.60,
                top: 167,
                child: Container(
                  width: 12,
                  height: 12,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(),
                  child: const Stack(children: []),
                ),
              ),
              Positioned(
                left: 47.10,
                top: 160,
                child: Container(
                  width: 86,
                  height: 22,
                  decoration: ShapeDecoration(
                    color: const Color(0xB2FFF9F9),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: Colors.black.withOpacity(0.25),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(4, 4),
                        spreadRadius: 4,
                      )
                    ],
                  ),
                ),
              ),
              const Positioned(
                left: 56.10,
                top: 165,
                child: Text(
                  'Aditya Singh',
                  style: TextStyle(
                    color: Color(0xFF283873),
                    fontSize: 11,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 10.10,
                top: 196,
                child: Container(
                  width: 125,
                  height: 23,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF283873),
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(width: 1, color: Color(0x77283873)),
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 38.10,
                top: 200,
                child: Text(
                  'Visit Profile',
                  style: TextStyle(
                    color: Color(0xFFF5FEF7),
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
              const Positioned(
                left: 30.10,
                top: 123,
                child: Text(
                  'Fee : 1k/hr',
                  style: TextStyle(
                    color: Color(0xFF283873),
                    fontSize: 10,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 13.10,
                top: 143,
                child: Container(
                  width: 17,
                  height: 17,
                  decoration: const ShapeDecoration(
                    color: Color(0xFFFBFDFF),
                    shape: OvalBorder(),
                  ),
                ),
              ),
              Positioned(
                left: 15.60,
                top: 145,
                child: Container(
                  width: 12,
                  height: 12,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(),
                  child: const Stack(
                    children: [],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

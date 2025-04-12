import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../data/model/body/notification_body.dart';
import '../../src/src.dart';
import 'thumb_scanning.dart';

class SambBNB extends StatelessWidget {
  const SambBNB({
    super.key,
    required this.size,
    required this.navStream,
    this.page1Tap,
    this.page2Tap,
    this.page3Tap,
    this.page4Tap,
    required this.languages,
    required this.body,
    required this.fromSplash,
    required this.pageIndex,
    this.page5Tap,
    this.page6Tap,
  });

  final Size size;

  final Map<String, Map<String, String>>? languages;
  final NotificationBody? body;
  final Stream<int> navStream;
  final bool fromSplash;
  final int pageIndex;
  final VoidCallback? page1Tap;
  final VoidCallback? page2Tap;
  final VoidCallback? page3Tap;
  final VoidCallback? page4Tap;
  final VoidCallback? page5Tap;
  final VoidCallback? page6Tap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: ThemeColors.primaryBlueColor.withOpacity(0.7),
            offset: const Offset(20.0, 20.0),
            blurRadius: 25.0,
          ),
        ],
      ),
      height: 65,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            child: CustomPaint(
              size: Size(size.width, 80),
              painter: BNBCustomPainter(),
            ),
          ),
          Center(
            heightFactor: .7,
            child: Align(
              alignment: Alignment.topCenter,
              child: FloatingActionButton(
                shape: const CircleBorder(),
                mini: false,
                isExtended: true,
                tooltip: "Your thumb is scanning...",
                onPressed: () => Get.to(() => ThumbScanning()),
                elevation: 0.1,
                child: const Icon(
                  Icons.fingerprint_sharp,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ),
          ),
          SizedBox(
            width: size.width,
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NavigationItem(
                  navStream: navStream,
                  press: page1Tap,
                  title: "Home",
                  selectedIcon: Icons.home,
                  selectedIndex: 0,
                  unSelectedIcon: CupertinoIcons.home,
                ),
                NavigationItem(
                  navStream: navStream,
                  press: page2Tap,
                  title: "Store",
                  selectedIndex: 1,
                  selectedIcon: Icons.store,
                  unSelectedIcon: Icons.store_outlined,
                ),
                NavigationItem(
                  navStream: navStream,
                  press: page3Tap,
                  title: "CA Services",
                  selectedIndex: 2,
                  selectedIcon: Icons.business_center,
                  unSelectedIcon: Icons.workspace_premium,
                ),
                Container(
                  width: size.width * 0.17,
                ),
                NavigationItem(
                  navStream: navStream,
                  press: page4Tap,
                  title: "Earn",
                  selectedIndex: 3,
                  selectedIcon: Icons.wallet,
                  unSelectedIcon: CupertinoIcons.money_dollar,
                ),
                NavigationItem(
                  navStream: navStream,
                  press: page5Tap,
                  title: "Education",
                  selectedIndex: 4,
                  selectedIcon: Icons.school,
                  unSelectedIcon: Icons.school_outlined,
                ),
                NavigationItem(
                  navStream: navStream,
                  press: page6Tap,
                  title: "POD",
                  selectedIndex: 5,
                  selectedIcon: Icons.shopping_bag,
                  unSelectedIcon: Icons.shopping_bag_outlined,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class NavigationItem extends StatelessWidget {
  const NavigationItem({
    super.key,
    required this.navStream,
    required this.press,
    required this.title,
    required this.selectedIcon,
    required this.unSelectedIcon,
    required this.selectedIndex,
  });

  final Stream<int> navStream;
  final VoidCallback? press;
  final String title;
  final IconData selectedIcon, unSelectedIcon;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
        stream: navStream,
        builder: (context, snapshot) {
          return GestureDetector(
            onTap: press,
            child: NavItemWidget(
              title: title,
              isSelected: snapshot.data == selectedIndex,
              selectedIcon: selectedIcon,
              unSelectedIcon: unSelectedIcon,
            ),
          );
        });
  }
}

class NavItemWidget extends StatelessWidget {
  final IconData selectedIcon;
  final IconData unSelectedIcon;
  final String title;
  final bool isSelected;
  const NavItemWidget(
      {super.key,
      this.isSelected = false,
      required this.title,
      required this.selectedIcon,
      required this.unSelectedIcon});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Card(
        shape: const StadiumBorder(),
        child: Padding(
            padding: const EdgeInsets.all(5),
            child: Icon(
              size: 19,
              isSelected ? selectedIcon : unSelectedIcon,
            )),
      ),
      Text(
        title,
        maxLines: 2,
        style: robotoRegular.copyWith(
            color: isSelected
                ? Theme.of(context).primaryColor
                : Theme.of(context).textTheme.bodyMedium!.color!,
            fontSize: 8,
            fontWeight: FontWeight.w100),
      ),
    ]);
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = ThemeColors.backgroundLightBlue
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 0);
    path.quadraticBezierTo(size.width * 0.0, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);

    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: const Radius.circular(10.0), clockwise: false);

    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawShadow(path, Colors.black, 5, true);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class BNBCustomPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = ThemeColors.backgroundLightBlue
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 0);
    path.quadraticBezierTo(size.width * 0.0, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);

    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: const Radius.circular(10.0), clockwise: false);

    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawShadow(path, Colors.black, 5, true);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

import 'package:flutter/material.dart';
import 'package:payapp/core/components/app_decoration.dart';

class StatsTab extends StatelessWidget {
  const StatsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const CreditCardType(),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xff133433),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/education/bistia.png'),
                  backgroundColor: Colors.white24,
                ),
                const SizedBox(height: 10),
                const Text(
                  'No Customer Found!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Add Customer and earn extra income.\n Track the details any time.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                FloatingActionButton.extended(
                  onPressed: () {},
                  label: const Text(
                    'Add New Customer',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}

class CreditCardType extends StatelessWidget {
  const CreditCardType({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: appBoxDecoration(
        color: const Color(0xff043432),
        border: const Border(),
      ),
      width: double.infinity,
      height: 180,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 50,
                height: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/education/bistia.png',
                  ),
                ),
              ),
              const SizedBox(width: 10),
              const Expanded(
                  child: Text(
                'Kotak league platinum Credit Card',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              )),
            ],
          ),
          const Spacer(),
          Center(
            child: CustomPaint(
              painter: DashedLinePainter(
                dashWidth: 5,
                dashHeight: 2,
                numDashes: 30,
                paintt: Paint()..color = Colors.white,
              ),
            ),
          ),
          const Spacer(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildCardInfoItem('00', 'Total Earnings'),
                buildCardInfoItem('00', 'Total Leads'),
                buildCardInfoItem('00', 'Total Sails'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildCardInfoItem(String score, String label) {
  return Column(
    children: [
      Text(
        score,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
      const SizedBox(height: 5),
      Text(
        'Total Earnings'.toUpperCase(),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    ],
  );
}

class DashedLinePainter extends CustomPainter {
  final double dashWidth;
  final double dashHeight;
  final int numDashes;
  final Paint paintt;

  DashedLinePainter({
    required this.dashWidth,
    required this.dashHeight,
    required this.numDashes,
    required this.paintt,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Calculate the total length of the line.
    double lineLength = numDashes * dashWidth + (numDashes - 1) * dashWidth;

    // Calculate the offset of the first dash.
    double offset = (size.width - lineLength) / 2;

    // Draw the dashes.
    for (int i = 0; i < numDashes; i++) {
      canvas.drawRect(
        Rect.fromLTWH(offset + i * (dashWidth + dashWidth),
            size.height / 2 - dashHeight / 2, dashWidth, dashHeight),
        paintt,
      );
    }
  }

  @override
  bool shouldRepaint(covariant DashedLinePainter oldDelegate) =>
      oldDelegate.dashWidth != dashWidth ||
      oldDelegate.dashHeight != dashHeight ||
      oldDelegate.numDashes != numDashes ||
      oldDelegate.paint != paint;
}

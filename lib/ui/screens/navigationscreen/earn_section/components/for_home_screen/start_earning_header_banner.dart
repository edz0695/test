import 'package:flutter/material.dart';
import '../../../../../../themes/colors.dart';

class FlipBalanceCard extends StatefulWidget {
  const FlipBalanceCard({super.key});

  @override
  _FlipBalanceCardState createState() => _FlipBalanceCardState();
}

class _FlipBalanceCardState extends State<FlipBalanceCard> {
  bool _cardMoved = false;

  void _moveCard() {
    setState(() {
      _cardMoved = !_cardMoved;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 350,
        ),
        AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            left: _cardMoved ? 15 : -100,
            top: 50,
            child: const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                "Welcome",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 10,
                  fontWeight: FontWeight.w100,
                ),
              ),
            )),
        AnimatedPositioned(
            top: 65,
            duration: const Duration(milliseconds: 500),
            left: _cardMoved ? 15 : -100,
            child: const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                "Mr.Johnson",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )),
        Positioned(
          bottom: 0,
          right: MediaQuery.of(context).size.width / 2 - 110,
          child: Align(
            alignment: Alignment.center,
            child: AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: _cardMoved ? 0 : 1,
                child: const Text(
                  "Click on card for more details",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                )),
          ),
        ),
        AnimatedPositioned(
          top: 90,
          duration: const Duration(milliseconds: 500),
          right: _cardMoved
              ? MediaQuery.of(context).size.width / 2 -
                  (MediaQuery.of(context).size.width * 0.85) / 2
              : 15,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.85,
            height: 200,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  "₹8234.60",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text('Withdrawable Earning',
                    style: TextStyle(fontSize: 12, color: Colors.black54)),
                Text(
                  "+ ₹8234.60",
                  style: TextStyle(
                    color: Colors.green,
                    // Assuming you don't have ThemeColors defined
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Your lifetime earning',
                    style: TextStyle(fontSize: 12, color: Colors.black54)),
                Text(
                  "- ₹4000",
                  style: TextStyle(
                    color: Colors.red,
                    // Assuming you don't have ThemeColors defined
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        AnimatedPositioned(
          top: 90,
          duration: const Duration(milliseconds: 500),
          left: _cardMoved
              ? MediaQuery.of(context).size.width / 2 -
                  (MediaQuery.of(context).size.width * 0.85) / 2
              : -MediaQuery.of(context).size.width / 2.2,
          child: GestureDetector(
            onTap: _moveCard,
            child: Card(
              elevation: 8.0,
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: 220,
                  decoration: BoxDecoration(
                      color: ThemeColors.darkBlueColor,
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                          image: AssetImage(
                            "assets/images/download-removebg-preview.png",
                          ),
                          fit: BoxFit.cover)),
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 90,
                            width: 90,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/chip-removebg-preview.png"))),
                          ),
                          const Text(
                            "₹8234.60",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "JOHNSON MILLER",
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      RotatedBox(
                        quarterTurns: 3,
                        child: AnimatedOpacity(
                          opacity: _cardMoved ? 0 : 1,
                          duration: const Duration(milliseconds: 500),
                          child: const Column(
                            children: [
                              Text(
                                "₹8234.60",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "JOHNSON MILLER",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )),
            ),
          ),
        ),
      ],
    );
  }
}

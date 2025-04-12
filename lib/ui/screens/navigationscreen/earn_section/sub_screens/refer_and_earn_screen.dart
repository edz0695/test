import 'package:flutter/material.dart';
import 'package:payapp/themes/colors.dart';
import '../../faqScreen/faqItem.dart';

class ReferAndEarnScreen extends StatefulWidget {
  const ReferAndEarnScreen({super.key});

  @override
  _ReferAndEarnScreenState createState() => _ReferAndEarnScreenState();
}

class _ReferAndEarnScreenState extends State<ReferAndEarnScreen> {
  final TextEditingController _linkController =
      TextEditingController(text: 'http://cuva.com/e/ruihgfahjofj');
  final int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Container(
            height: 280,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        "assets/images/WhatsApp Image 2024-04-26 at 08.06.41_412ecebf.jpg"),
                    fit: BoxFit.fill)),
          ),
          Container(
            margin: const EdgeInsets.only(top: 230, left: 20, right: 20),
            decoration: BoxDecoration(
                color: ThemeColors.darkBlueColor,
                borderRadius: BorderRadius.circular(10)),
            height: 90,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.pink,
                      foregroundImage: AssetImage("assets/icons/rupee.png"),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("TOTAL REWARD",
                            style: TextStyle(
                                // fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 2)),
                        Text("₹300",
                            style: TextStyle(
                                fontSize: 28,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2))
                      ],
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(right: 15),
                  child: CircleAvatar(
                    backgroundColor: Colors.blueAccent,
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_forward_ios_outlined)),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 340, left: 20, right: 20),
            height: 300,
            decoration: BoxDecoration(
                color: ThemeColors.lightBlueCard,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                          width: 80,
                          child: CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset("assets/icons/link.png"),
                              ))),
                      SizedBox(
                          width: 70,
                          child: CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset("assets/icons/surprise.png"),
                              ))),
                      SizedBox(
                          width: 70,
                          child: CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                    "assets/icons/crypto-wallet.png"),
                              )))
                    ]),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: const Text(
                        "Invite your friend to install the app with the link",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        maxLines: 3,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: const Text(
                        "Your friend places a minimum order of ₹200",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        maxLines: 3,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: const Text(
                        "You get ₹150 once the return period is over",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        maxLines: 3,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
              height: 50,
              margin: const EdgeInsets.only(top: 650),
              child: const Center(
                child: Text("FAQ",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              )),
          Container(
              margin: const EdgeInsets.only(top: 700),
              child: ListView.separated(
                padding: const EdgeInsets.only(
                  top: 15,
                  left: 15,
                  right: 15,
                  // bottom: widget.show != null ? 15 : 115
                ),
                itemBuilder: (_, index) {
                  return const FaqListItem(
                    question: "Refer And Earn Question",
                    answer: "Refer And Earn Answer",
                  );
                },
                separatorBuilder: (_, index) {
                  return const SizedBox(height: 15);
                },
                itemCount: 5,
              ))
        ],
      ),
    );
    // return Scaffold(
    //   body: SafeArea(
    //     child: Container(
    //       padding: EdgeInsets.all(20),
    //       child: SingleChildScrollView(
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: <Widget>[
    //             // Image.asset("assets/images/Screenshot 2024-04-19 052509.png"),
    //             Text('Refer a friend',
    //                 style:
    //                     TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
    //             SizedBox(height: 8),
    //             Text('And you can both save £10',
    //                 style: TextStyle(fontSize: 20)),
    //             SizedBox(height: 16),
    //             Row(
    //               children: [
    //                 Icon(Icons.info_outline),
    //                 SizedBox(width: 15),
    //                 Text('How it works',
    //                     style: TextStyle(
    //                         fontSize: 18,
    //                         fontWeight: FontWeight.bold,
    //                         color: Colors.deepPurple)),
    //               ],
    //             ),
    //             SizedBox(height: 20),
    //             Row(children: [
    //               Column(children: [
    //                 CircleAvatar(
    //                   child: Text("1"),
    //                   backgroundColor: ThemeColors.primaryBlueColor,
    //                   radius: 24,
    //                 ),
    //                 SizedBox(
    //                     height: 60,
    //                     child: DottedLine(
    //                       direction: Axis.vertical,
    //                       alignment: WrapAlignment.center,
    //                       lineLength: double.infinity,
    //                       lineThickness: 3.0,
    //                       dashLength: 8,
    //                       dashColor: Colors.purple,
    //                       dashRadius: 0.0,
    //                       dashGapLength: 4.0,
    //                       dashGapColor: Colors.transparent,
    //                       dashGapRadius: 0.0,
    //                     )),
    //                 CircleAvatar(
    //                   child: Text("2"),
    //                   backgroundColor: ThemeColors.primaryBlueColor,
    //                   radius: 24,
    //                 ),
    //                 SizedBox(
    //                     height: 60,
    //                     child: DottedLine(
    //                       direction: Axis.vertical,
    //                       alignment: WrapAlignment.center,
    //                       lineLength: double.infinity,
    //                       lineThickness: 3.0,
    //                       dashLength: 8,
    //                       dashColor: Colors.purple,
    //                       dashRadius: 0.0,
    //                       dashGapLength: 4.0,
    //                       dashGapColor: Colors.transparent,
    //                       dashGapRadius: 0.0,
    //                     )),
    //                 CircleAvatar(
    //                   child: Text("3"),
    //                   backgroundColor: ThemeColors.primaryBlueColor,
    //                   radius: 24,
    //                 )
    //               ]),
    //               SizedBox(
    //                 width: 10,
    //               ),
    //               Column(
    //                 mainAxisAlignment: MainAxisAlignment.start,
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Container(
    //                       padding: EdgeInsets.all(10),
    //                       height: 108,
    //                       width: MediaQuery.of(context).size.width * 0.7,
    //                       child: Column(
    //                         mainAxisAlignment: MainAxisAlignment.center,
    //                         crossAxisAlignment: CrossAxisAlignment.start,
    //                         children: [
    //                           Text('Invite your friends',
    //                               style: TextStyle(
    //                                   fontSize: 23,
    //                                   fontWeight: FontWeight.bold)),
    //                           Text('Just share your link ',
    //                               style: TextStyle(
    //                                   fontSize: 18,
    //                                   fontWeight: FontWeight.w400)),
    //                         ],
    //                       )),
    //                   Container(
    //                       padding: EdgeInsets.all(10),
    //                       height: 108,
    //                       width: MediaQuery.of(context).size.width * 0.7,
    //                       child: Column(
    //                         mainAxisAlignment: MainAxisAlignment.center,
    //                         crossAxisAlignment: CrossAxisAlignment.start,
    //                         children: [
    //                           Text('They hit the road',
    //                               style: TextStyle(
    //                                   fontSize: 23,
    //                                   fontWeight: FontWeight.bold)),
    //                           Text('With £10 off',
    //                               style: TextStyle(
    //                                   fontSize: 18,
    //                                   fontWeight: FontWeight.w400)),
    //                         ],
    //                       )),
    //                   Container(
    //                       padding: EdgeInsets.all(10),
    //                       height: 108,
    //                       width: MediaQuery.of(context).size.width * 0.7,
    //                       child: Column(
    //                         mainAxisAlignment: MainAxisAlignment.center,
    //                         crossAxisAlignment: CrossAxisAlignment.start,
    //                         children: [
    //                           Text('You make savings!',
    //                               style: TextStyle(
    //                                   fontSize: 23,
    //                                   fontWeight: FontWeight.bold)),
    //                           Text('Then you get £10 off ',
    //                               style: TextStyle(
    //                                   fontSize: 18,
    //                                   fontWeight: FontWeight.w400)),
    //                         ],
    //                       ))
    //                 ],
    //               )
    //             ]),
    //             SizedBox(height: 16),
    //             Row(
    //               children: [
    //                 Expanded(
    //                   child: TextField(
    //                     style: TextStyle(
    //                         fontSize: 18,
    //                         fontWeight: FontWeight.w500,
    //                         color: Colors.purple),
    //                     controller: _linkController,
    //                     decoration: InputDecoration(
    //                         border: OutlineInputBorder(
    //                             borderRadius: BorderRadius.circular(10)),
    //                         contentPadding: EdgeInsets.all(5),
    //                         suffix: Padding(
    //                           padding:
    //                               const EdgeInsets.only(bottom: 8.0, right: 5),
    //                           child: GestureDetector(
    //                             child: Text('copy',
    //                                 style: TextStyle(
    //                                     fontSize: 23,
    //                                     fontWeight: FontWeight.bold,
    //                                     color: Colors.purple)),
    //                             onTap: () {
    //                               Feedback.forTap(context);
    //                               Clipboard.setData(ClipboardData(
    //                                   text: _linkController.text));
    //                               ScaffoldMessenger.of(context).showSnackBar(
    //                                 SnackBar(
    //                                     content:
    //                                         Text('Link copied to clipboard!')),
    //                               );
    //                             },
    //                           ),
    //                         ),
    //                         labelStyle: TextStyle(
    //                             fontSize: 23,
    //                             fontWeight: FontWeight.bold,
    //                             color: Colors.purple),
    //                         fillColor: Colors.deepPurple.shade400),
    //                     readOnly: true,
    //                   ),
    //                 ),
    //                 // IconButton(
    //                 //   icon: Icon(Icons.copy),
    //                 //   onPressed: () {
    //                 //     Clipboard.setData(
    //                 //         ClipboardData(text: _linkController.text));
    //                 //     ScaffoldMessenger.of(context).showSnackBar(
    //                 //       SnackBar(content: Text('Link copied to clipboard!')),
    //                 //     );
    //                 //   },
    //                 // ),
    //               ],
    //             ),
    //             SizedBox(height: 16),
    //             SizedBox(
    //               width: double.infinity,
    //               // Ensures the button stretches to fill the width
    //               child: ElevatedButton(
    //                 onPressed: () {},
    //                 style: ElevatedButton.styleFrom(
    //                     backgroundColor: ThemeColors.primaryBlueColor,
    //                     foregroundColor: Colors.white,
    //                     padding: EdgeInsets.symmetric(vertical: 16),
    //                     shape: RoundedRectangleBorder(
    //                         borderRadius: BorderRadius.circular(10))),
    //                 child: Text('Refer friends now',
    //                     style: TextStyle(fontSize: 18)),
    //               ),
    //             ),
    //             // Additional content widgets would go here
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}

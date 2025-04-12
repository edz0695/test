import 'package:flutter/material.dart';
import 'package:payapp/themes/colors.dart';

class HiringPricingScreen extends StatelessWidget {
  const HiringPricingScreen({super.key});

  _buildPlanSelectionCard() {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              ' ₹ 2199',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: ThemeColors.darkBlueColor),
            ),
            Text(
              '1 Month Plan',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Unlimited Candidate Responses',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        'Database Unlocks',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        '100',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  VerticalDivider(),
                  Column(
                    children: [
                      Text(
                        'Live Jobs',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        '0',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  VerticalDivider(),
                  Column(
                    children: [
                      Text(
                        'Validity',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        '33',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: ThemeColors.darkBlueColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  // Buy Now action
                },
                child: Text('Buy Now'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pricing'),
        backgroundColor: ThemeColors.darkBlueColor,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 5),
          Expanded(
            child: ListView(
              children: [
                // Weekend Offer Section
                Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        image: DecorationImage(
                            image: AssetImage(
                              "assets/images/WhatsApp Image 2024-04-27 at 08.04.42_8aa80cf1.jpg",
                            ),
                            fit: BoxFit.fill)),
                    height: 80,
                    width: MediaQuery.of(context).size.width),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Call us on ',
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      '08069824660',
                      style: TextStyle(
                        color: ThemeColors.darkBlueColor,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                // 1 Month Plan Section
                _buildPlanSelectionCard(),
                _buildPlanSelectionCard(),
                _buildPlanSelectionCard(),
                _buildPlanSelectionCard(),
                _buildPlanSelectionCard(),
                _buildPlanSelectionCard(),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  width: double.infinity,
                  height: 40,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        backgroundColor: ThemeColors.darkBlueColor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      // Buy Now action
                    },
                    child: Text('SKIP'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

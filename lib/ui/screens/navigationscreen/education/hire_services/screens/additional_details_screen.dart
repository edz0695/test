import 'package:flutter/material.dart';
import 'package:payapp/themes/colors.dart';
import 'package:payapp/ui/screens/navigationscreen/education/hire_services/screens/job_wallet_balance_screen.dart';

class AdditionalDetailsScreen extends StatelessWidget {
  const AdditionalDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.green[100],
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.check_circle, color: Colors.green),
                  SizedBox(width: 8),
                  Text('Job sent for approval'),
                ],
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Additional details (optional)',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  'Add additional candidate requirements to help us filter and find the right candidates.'),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                spacing: 8.0,
                children: [
                  Chip(
                    label: Text('Age'),
                  ),
                  Chip(
                    label: Text('Preferred Language'),
                  ),
                  Chip(
                    label: Text('Assets'),
                  ),
                  Chip(
                    label: Text('Degree and Specialization'),
                  ),
                  Chip(
                    label: Text('Preferred Industry'),
                  ),
                  Chip(
                    label: Text('Certification'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Degree and Specialization',
                  hintText: 'Type here to search',
                  suffixIcon: Icon(Icons.clear),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: OverflowBar(
        alignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 2 - 20,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: ThemeColors.darkBlueColor,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: ThemeColors.darkBlueColor),
                      borderRadius: BorderRadius.circular(5))),
              onPressed: () {
                // Action for Skip
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return JobWalletBalanceScreen();
                  },
                ));
              },
              child: Text('Skip'),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2 - 20,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: ThemeColors.darkBlueColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5))),
              onPressed: () {
                // Action for Update job post
              },
              child: Text('Update job post'),
            ),
          ),
        ],
      ),
    );
  }
}

class StepProgressIndicator extends StatelessWidget {
  const StepProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue,
            child: Icon(Icons.check, color: Colors.white),
          ),
          Expanded(
            child: Divider(color: Colors.blue, thickness: 3),
          ),
          CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text(
              '2',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Expanded(
            child: Divider(color: Colors.grey, thickness: 3),
          ),
          CircleAvatar(
            backgroundColor: Colors.grey,
            child: Text(
              '3',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

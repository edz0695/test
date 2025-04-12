import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../../themes/colors.dart';
import 'job_details_screen.dart';

class JobSearchScreen extends StatelessWidget {
  const JobSearchScreen({super.key});

  Widget buildJobCard(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => JobDetailsScreen(),));
        print("Card pressed");
      },
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.cases, color: Colors.blue),
              title: Text('Field Sales Executive'),
              subtitle: Text('Rs. 20000 - Rs. 40000'),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text('Bahraich (25.8 kms)'),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text('SUN LIFE GLOBAL SOLU'),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0.5),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black54),
                        borderRadius: BorderRadius.circular(8)),
                    child: Text('New', style: TextStyle(color: Colors.green))),
                Container(
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0.5),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black54),
                        borderRadius: BorderRadius.circular(8)),
                    child: Text('2')),
                Container(
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0.5),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black54),
                        borderRadius: BorderRadius.circular(8)),
                    child: Text('Work From Home',
                        style: TextStyle(color: Colors.deepPurple)))
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          AppBar(
            backgroundColor: ThemeColors.darkBlueColor,
            automaticallyImplyLeading: false,
            leading: Icon(
              Icons.location_on_outlined,
              color: Colors.white,
            ),
            title: SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Row(
                children: [
                  Text(
                    "Taj Khodahi, Bahrai",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Icon(
                    Icons.arrow_drop_down_sharp,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            actions: [
              Icon(
                Icons.share,
                color: Colors.white,
              ),
              SizedBox(
                width: 15,
              ),
              Icon(
                Icons.notifications_active_outlined,
                color: Colors.white,
              )
            ],
          ),
          Container(
            color: ThemeColors.darkBlueColor,
            padding: EdgeInsets.only(bottom: 15),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              margin:
                  EdgeInsets.only(bottom: 10.0, left: 10, right: 10, top: 10),
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.search,
                    color: ThemeColors.darkBlueColor,
                  ),
                  hintText: 'Search job title, company, skill',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton.icon(
                icon: Icon(Icons.filter_list),
                label: Text('Filters'),
                onPressed: () {
                  // Filter action
                },
              ),
              ElevatedButton.icon(
                icon: Icon(Icons.sort),
                label: Text('Sort by'),
                onPressed: () {
                  // Sort action
                },
              ),
            ],
          ),
          buildJobCard(context),
          buildJobCard(context),
          // Add more Job Cards
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../themes/colors.dart';

class JobDetailsScreen extends StatefulWidget {
  const JobDetailsScreen({super.key});

  @override
  State<JobDetailsScreen> createState() => _JobDetailsScreenState();
}

class _JobDetailsScreenState extends State<JobDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColors.darkBlueColor,
        automaticallyImplyLeading: true,
        foregroundColor: Colors.white,
        toolbarHeight: 75,
        title: Text(
          "Liberium Global Researchers and company",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22,
              overflow: TextOverflow.ellipsis),
        ),
        actions: [
          Container(
            width: 40,
          )
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(tabs: [
              Tab(
                child: Text("JOB DETAILS"),
              ),
              Tab(
                child: Text("COMPANY PROFILE"),
              )
            ]),
            Expanded(
                child: TabBarView(children: [
              Scaffold(
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerFloat,
                floatingActionButton: OverflowBar(
                    alignment: MainAxisAlignment.spaceAround,
                    children: [
                      OutlinedButton.icon(
                          icon: Icon(Icons.email_outlined),
                          onPressed: () {
                            // Navigator.of(context).push(MaterialPageRoute(
                            //   builder: (context) ,
                            // ));
                          },
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.green,
                            // bagroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                side: BorderSide(color: Colors.blue)),

                            textStyle: TextStyle(
                              fontSize: 16,
                            ), // Set text style
                          ),
                          label: Text(
                            'Apply',
                            style: TextStyle(
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      ElevatedButton.icon(
                          icon: Icon(Icons.call_outlined),
                          onPressed: () {
                            // Navigator.of(context).push(MaterialPageRoute(
                            //   builder: (context) ,
                            // ));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                side: BorderSide(color: Colors.blue)),
                            foregroundColor: Colors.white,
                            textStyle: TextStyle(
                              fontSize: 16,
                            ), // Set text style
                          ),
                          label: Text(
                            'Click to call HR',
                            style: TextStyle(
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold,
                            ),
                          ))
                    ]),
                body: Column(children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text("Sales Executive"),
                  SizedBox(
                    height: 20,
                  ),
                  Text(" ₹ 12,000-14,000"),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(child: Text("Location")),
                      Container(child: Text("Experience"))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(child: Text("Qualification")),
                      Container(child: Text("English"))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(child: Text("Job Info")),
                  SizedBox(
                    height: 10,
                  ),
                  Container(child: Text("Job Timing")),
                  SizedBox(
                    height: 10,
                  ),
                  Container(child: Text("Job Address")),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 200,
                    padding: EdgeInsets.all(8),
                    color: Colors.grey,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Text("INTERVIEW DETAILS"),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Divider(),
                        ),
                        Text("Interview Time"),
                        Text("11:00 AM - 4:00 PM"),
                        Text("Monday to Sunday"),
                        SizedBox(
                          height: 20,
                        ),
                        Text("Contact Person"),
                        Text("Dinesh")
                      ],
                    ),
                  ),
                  Container(
                    height: 60,
                    margin: EdgeInsets.all(10),
                    color: Colors.blue,
                    child: ListTile(
                      leading: Icon(
                        Icons.message_outlined,
                        color: ThemeColors.darkBlueColor,
                      ),
                      title: Text(
                          "Dont pay any money to HR if not mentioned in job details."),
                    ),
                  ),
                  OverflowBar(
                    alignment: MainAxisAlignment.spaceAround,
                    children: [
                      OutlinedButton.icon(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  side: BorderSide(color: Colors.red))),
                          icon: Icon(
                            Icons.warning_amber,
                          ),
                          label: Text("Report Job")),
                      OutlinedButton.icon(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            foregroundColor: ThemeColors.darkBlueColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: BorderSide(
                                    color: ThemeColors.darkBlueColor)),
                          ),
                          icon: Icon(
                            Icons.play_arrow_outlined,
                          ),
                          label: Text("Interview Tips"))
                    ],
                  )
                ]),
              ),
              Column(
                children: [
                  CircleAvatar(),
                  Text(
                    "LIBERIUM GLOBAL RESOURCES PRIVATE",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("""
    LIBERIUM, is a fast-growing Human resource management, skilling and training company that has come up with innovative workforce solutions that effectively connects people potential to business requirements of organizations.
    
    We provide basic, yet critical services around lateral hiring, temporary staffing, training, remunerations processing and human resource business process outsourcing and ensure a quality service by imparting better hiring, quick back-filling, soft skill training, better understanding of customer needs, absolute adherence to compliance, quick turnaround time on associate/customer queries, extending legal support to safe-guard customers’ interests, beside other general service elements.
    """),
                  Divider(
                    thickness: 7,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Company Profile"),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Established Profile"),
                      Text("No. of Employees")
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [Text("Industry type"), Text("Perks & Benefits")],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Interview address")
                ],
              )
            ]))
          ],
        ),
      ),
    );
  }
}

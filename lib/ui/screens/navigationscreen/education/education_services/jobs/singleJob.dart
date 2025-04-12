import 'package:flutter/material.dart';
import 'package:payapp/ui/widgets/app_bar_widget.dart';

class SingleJobs extends StatefulWidget {
  final Map singleJob;

  const SingleJobs({super.key, required this.singleJob});

  @override
  State<SingleJobs> createState() => _SingleJobsState();
}

class _SingleJobsState extends State<SingleJobs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: "${widget.singleJob["title"]}", size: 55),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "${widget.singleJob["title"]}",
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                left: 7, right: 7, top: 3, bottom: 3),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Text(
                              "Urgent",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 7,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Row(
                        children: [
                          Text(
                            "${widget.singleJob["company"]}",
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text("Visit Company"),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.merge_type_outlined),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Job Type",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black87),
                        ),
                        Text(
                          "Full-Time",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black87),
                        )
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.location_on_outlined),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Job Location",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black87),
                        ),
                        Text(
                          "Anywhere in India",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black87),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.cast_for_education),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Education",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black87),
                        ),
                        Text(
                          "BSC in CSE",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black87),
                        )
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.attach_money),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Salary",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black87),
                        ),
                        Text(
                          "₹ 40,000/mon",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black87),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.access_time_filled),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Job Time",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black87),
                        ),
                        Text(
                          "0:09 AM to 0:06 PM",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black87),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Job Description",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text("${widget.singleJob["details"]}"),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "About Company",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "${widget.singleJob["details"]}",
              maxLines: 3,
            ),
            const SizedBox(
              height: 10,
            ),
            Text("${widget.singleJob["details"]}"),
            const SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text(
          "          Apply Now          ",
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
    );
  }
}

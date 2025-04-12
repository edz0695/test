
import 'package:flutter/material.dart';
import 'package:payapp/core/components/app_decoration.dart';
import 'package:payapp/ui/screens/navigationscreen/education/shared_widgets/find_service_search_bar.dart';
import 'package:payapp/ui/widgets/app_bar_widget.dart';
import '../../../../../../../themes/colors.dart';

class StudentLeads extends StatefulWidget {
  const StudentLeads({super.key});

  @override
  State<StudentLeads> createState() => _StudentLeadsState();
}

class _StudentLeadsState extends State<StudentLeads> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const AppBarWidget(title: "Student Leads", size: 55),
      body: GestureDetector(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      image: AssetImage(
                          'assets/images/educationscreen/students_lead_header.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const FindServiceSearchBar(
                  hint: 'Students Class, City, Subjects',
                ),
                const SizedBox(height: 10),
                Column(
                  children: List.generate(
                    10,
                    (index) => TutorProposalStudentLeadItem(index: index),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TutorProposalStudentLeadItem extends StatelessWidget {
  const TutorProposalStudentLeadItem({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: appBoxDecoration(
        border: const Border(),
      ),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(5),
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          const Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Icon(
                Icons.favorite_border,
                size: 30,
                color: ThemeColors.darkBlueColor,
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 110,
                height: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: const DecorationImage(
                    image: AssetImage(
                        'assets/images/educationscreen/student_leed_item.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Class 9 Students Hazratganj looking for Tutor phone number' *
                          3,
                      textAlign: TextAlign.start,
                      maxLines: 2,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14.0,
                      ),
                    ),
                    const SizedBox(height: 13),
                    Text(
                      'Class 9 Students Hazratganj looking for Tutor phone number' *
                          3,
                      textAlign: TextAlign.start,
                      maxLines: 3,
                      style: const TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w600,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Column(
            children: [
              Text(
                '✔️ Class 9 Students Hazratganj looking for Tutor phone number.',
                textAlign: TextAlign.start,
                maxLines: 3,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15.0,
                  color: Colors.blueGrey[700],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '✔️ Class 9 Students Hazratganj looking for Tutor phone number.',
                textAlign: TextAlign.start,
                maxLines: 3,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15.0,
                  color: Colors.blueGrey[700],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '✔️ Class 9 Students Hazratganj looking for Tutor phone number.',
                textAlign: TextAlign.start,
                maxLines: 3,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15.0,
                  color: Colors.blueGrey[700],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            // height: 40,
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(
              color: ThemeColors.lightBlueCard.withOpacity(.6),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Column(
                  children: [
                    Text(
                      'Annual Fees',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '359 ₹',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ThemeColors.darkBlueColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                const Spacer(),
                FloatingActionButton.extended(
                  key: Key('Buy now $index'),
                  heroTag: 'Buy now $index',
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Scaffold(
                        body: Column(
                          children: [
                            Container(
                                height: 60,
                                color: Colors.green,
                                width: MediaQuery.of(context).size.width)
                          ],
                        ),
                        appBar: AppBarWidget(title: "Lead", size: 50),
                      ),
                    ));
                  },
                  extendedPadding: const EdgeInsets.symmetric(horizontal: 40),
                  label: const Text(
                    'Buy now',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
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

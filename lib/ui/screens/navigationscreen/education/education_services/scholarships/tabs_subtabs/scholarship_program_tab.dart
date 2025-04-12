import 'package:flutter/material.dart';
import 'package:payapp/ui/screens/navigationscreen/education/education_services/scholarships/scholarship_details.dart';
import 'package:payapp/ui/widgets/scholorshipwidgets/scholorshiptile.dart';
import 'package:provider/provider.dart';

import '../../../../../../../provider/education_providers/education_provider.dart';

class ProgramTab extends StatefulWidget {
  const ProgramTab({super.key});

  @override
  State<ProgramTab> createState() => _ProgramTabState();
}

class _ProgramTabState extends State<ProgramTab> {
  @override
  void initState() {
    super.initState();
    final scholarshipProvider =
        Provider.of<EductionFormProvider>(context, listen: false);
    scholarshipProvider.getScholarships();
    scholarshipProvider.isLoadingCategorised = true;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<EductionFormProvider>(
      builder: (context, scholarshipProvider, child) {
        return scholarshipProvider.isLoadingCategorised
            ? const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              )
            : ListView.builder(
                padding:
                    const EdgeInsets.only(left: 15, right: 15, bottom: 100),
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: scholarshipProvider.scholarshipList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ScholarshipTile(
                        scholarship: scholarshipProvider.scholarshipList[index],
                        btnText: "Enroll Now",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ScholarshipDetails(
                                isEnroll: true,
                                schDetail:
                                    scholarshipProvider.scholarshipList[index],
                              ),
                            ),
                          );
                        },
                      ),
                      ScholarshipTile(
                        scholarship: scholarshipProvider.scholarshipList[index],
                        btnText: "Enroll Now",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ScholarshipDetails(
                                isEnroll: true,
                                schDetail:
                                    scholarshipProvider.scholarshipList[index],
                              ),
                            ),
                          );
                        },
                      ),
                      ScholarshipTile(
                        scholarship: scholarshipProvider.scholarshipList[index],
                        btnText: "Enroll Now",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ScholarshipDetails(
                                isEnroll: true,
                                schDetail:
                                    scholarshipProvider.scholarshipList[index],
                              ),
                            ),
                          );
                        },
                      ),
                      ScholarshipTile(
                        scholarship: scholarshipProvider.scholarshipList[index],
                        btnText: "Enroll Now",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ScholarshipDetails(
                                isEnroll: true,
                                schDetail:
                                    scholarshipProvider.scholarshipList[index],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  );
                },
              );
      },
    );
  }
}

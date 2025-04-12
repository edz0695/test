import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payapp/ui/screens/navigationscreen/education/education_services/scholarships/screens/samb_sch_res_screen.dart';
import 'package:payapp/ui/widgets/app_bar_widget.dart';
import 'package:payapp/ui/widgets/scholorshipwidgets/scholorshiptile.dart';
import 'package:provider/provider.dart';

import '../../../../../../../provider/education_providers/education_provider.dart';

class SambhavScholarshipsResults extends StatefulWidget {
  const SambhavScholarshipsResults({super.key, required this.title});

  final String title;

  @override
  State<SambhavScholarshipsResults> createState() =>
      _SambhavScholarshipsResultsState();
}

class _SambhavScholarshipsResultsState
    extends State<SambhavScholarshipsResults> {
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
        final selectedScholarShip = scholarshipProvider.scholarshipList
            .where((i) => i.title == widget.title);
        return Scaffold(
          appBar: AppBarWidget(title: widget.title, size: 55),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
              onPressed: () =>
                  Get.to(() => const SambhavScholarshipsResultsScreen()),
              child: Text(
                "Apply",
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 12),
              ),
            ),
          ),
          body: scholarshipProvider.isLoadingCategorised
              ? const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    itemCount: selectedScholarShip.length,
                    itemBuilder: (context, index) {
                      final scholarShip = selectedScholarShip.first;
                      return ScholarshipTile(
                        scholarship: scholarShip,
                        btnText: "View Result",
                        onTap: () => Get.to(
                            () => const SambhavScholarshipsResultsScreen()),
                      );
                    },
                  ),
                ),
        );
      },
    );
  }
}

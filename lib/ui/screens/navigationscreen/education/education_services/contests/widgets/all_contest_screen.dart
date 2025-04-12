import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payapp/ui/widgets/app_bar_widget.dart';

import 'package:provider/provider.dart';
import '../../../../../../../provider/education_providers/education_provider.dart';
import '../../scholarships/screens/samb_sch_res_screen.dart';
import 'contesttile.dart';

class AllContests extends StatefulWidget {
  const AllContests({super.key, required this.title});

  final String title;

  @override
  State<AllContests> createState() => _AllContestsState();
}

class _AllContestsState extends State<AllContests> {
  @override
  void initState() {
    super.initState();
    final contestProvider =
        Provider.of<EductionFormProvider>(context, listen: false);
    contestProvider.getContests();
    contestProvider.isLoadingCategorised = true;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<EductionFormProvider>(
      builder: (context, contestProvider, child) {
        final selectedContest =
            contestProvider.contestlist.where((i) => i.title == widget.title);
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
          body: contestProvider.isLoadingCategorised
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
                    itemCount: selectedContest.length,
                    itemBuilder: (context, index) {
                      final contest = selectedContest.first;
                      return ContestTile(
                        contest: contest,
                      );
                    },
                  ),
                ),
        );
      },
    );
  }
}

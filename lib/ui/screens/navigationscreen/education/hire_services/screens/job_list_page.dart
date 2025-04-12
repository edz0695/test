import 'package:get/get.dart';
import '../../../../../../src/src.dart';
import '../components/job_card_widget.dart';
import '../components/offer_banner_widget.dart';

class JobListPage extends StatelessWidget {
  JobListPage({super.key});
  final JobController controller = Get.find<JobController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text("Wallet Balance"),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "₹0",
                    style: TextStyle(
                        color: ThemeColors.darkBlueColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                width: 140,
                height: 40,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.green),
                      foregroundColor: WidgetStatePropertyAll(Colors.white),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    child: Text("RECHARGE")),
              )
            ],
          ),
        ),
        OfferBanner(),
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            margin: EdgeInsets.only(left: 5),
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            width: 160,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.support_agent_outlined,
                  color: ThemeColors.darkBlueColor,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Call Customer Support",
                  style:
                      TextStyle(color: ThemeColors.darkBlueColor, fontSize: 12),
                ),
              ],
            ),
          ),
        ),
        FutureBuilder<RecruiterJobsModel?>(
          future: controller.fetchRecruiterJobs(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Padding(
                padding: EdgeInsets.only(top: Get.size.height * .35),
                child: loading(),
              );
            } else if (snapshot.hasError) {
              return Padding(
                padding: EdgeInsets.only(top: Get.size.height * .45),
                child: Center(child: Text('Some thing went wrong')),
              );
            } else if (!snapshot.hasData || snapshot.data!.data!.isEmpty) {
              return Center(child: Text('No jobs found'));
            } else {
              final jobs = snapshot.data?.data!;
              return ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.all(20),
                physics: NeverScrollableScrollPhysics(),
                itemCount: jobs!.length,
                itemBuilder: (context, index) {
                  return JobCard(job: jobs[index]);
                },
              );
            }
          },
        ),
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../../../src/src.dart';
import 'job_details_screen.dart';

class JobSearchScreen extends StatelessWidget {
  JobSearchScreen({super.key});

  final JobController controller = Get.find<JobController>();
  final EducationController loc = Get.find<EducationController>();
  Widget buildJobCard(BuildContext context, Job2Data job) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () => Get.to(() => JobDetailsScreen(
            jobs: job,
          )),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.cases, color: Colors.blue),
                title: Text(job.jobRole.toString()),
                subtitle: Text(
                    'Rs. ${job.monthlySalary!.min} - Rs. ${job.monthlySalary!.max}'),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text('${job.city} (${job.locality})'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(job.company.toString()),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.all(8),
                      padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 0.5),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.black54),
                          borderRadius: BorderRadius.circular(8)),
                      child:
                          Text('New', style: TextStyle(color: Colors.green))),
                  Container(
                      margin: EdgeInsets.all(8),
                      padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 0.5),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.black54),
                          borderRadius: BorderRadius.circular(8)),
                      child: Text('${job.staff}')),
                  Container(
                      margin: EdgeInsets.all(8),
                      padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 0.5),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.black54),
                          borderRadius: BorderRadius.circular(8)),
                      child: Text(job.workFromHome.toString(),
                          style: TextStyle(color: Colors.deepPurple)))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: ThemeColors.darkBlueColor,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ThemeColors.darkBlueColor,
            statusBarIconBrightness: Brightness.light),
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Icon(
              Icons.location_on_outlined,
              color: Colors.white,
            ),
            width(5),
            Obx(
              () => Text(
                loc.city.value.toString(),
                maxLines: 2,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: Dimensions.fontSizeDefault),
              ),
            ),
            Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.share,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_active_outlined,
                color: Colors.white,
              )),
          width(15)
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: ThemeColors.darkBlueColor,
            padding: EdgeInsets.only(bottom: 15, left: 10, right: 10),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              margin:
                  EdgeInsets.only(bottom: 10.0, left: 10, right: 10, top: 10),
              child: CupertinoSearchTextField(
                onChanged: (value) {},
              ),
            ),
          ),
          height(20),
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
          FutureBuilder<JobsModel?>(
            future: controller.fetchJob(),
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
                    return buildJobCard(context, jobs[index]);
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

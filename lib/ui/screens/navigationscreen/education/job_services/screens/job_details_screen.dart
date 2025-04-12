import 'package:flutter/services.dart';
import '../../../../../../src/src.dart';

class JobDetailsScreen extends StatelessWidget {
  const JobDetailsScreen({super.key, required this.jobs});

  final Job2Data jobs;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ThemeColors.darkBlueColor,
          automaticallyImplyLeading: true,
          foregroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: ThemeColors.darkBlueColor,
              statusBarIconBrightness: Brightness.light),
          centerTitle: true,
          title: Text(
            jobs.jobRole.toString(),
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22,
                overflow: TextOverflow.ellipsis),
          ),
          leading: back(color: Colors.white),
          bottom: TabBar(
              labelStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: Dimensions.fontSizeDefault),
              unselectedLabelStyle: TextStyle(
                  color: Colors.white, fontSize: Dimensions.fontSizeExtraSmall),
              tabs: [
                Tab(
                  child: Text("JOB DETAILS"),
                ),
                Tab(
                  child: Text("COMPANY PROFILE"),
                )
              ]),
        ),
        body: TabBarView(children: [
          JobDetailsWidget(
            jobs: jobs,
          ),
          CompanyProfileWidget(
            jobs: jobs,
          )
        ]),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            OutlinedButton.icon(
                icon: Icon(Icons.email_outlined),
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Colors.indigo)),
                  textStyle: TextStyle(
                    fontSize: 16,
                  ),
                ),
                label: Text(
                  'Apply',
                  style: TextStyle(
                      fontSize: Dimensions.fontSizeSmall,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo),
                )),
            ElevatedButton.icon(
                icon: Icon(
                  Icons.call_outlined,
                  color: Colors.white,
                ),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Colors.green)),
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(
                    fontSize: 16,
                  ),
                ),
                label: Text(
                  'Click to call HR',
                  style: TextStyle(
                    fontSize: Dimensions.fontSizeSmall,
                    fontWeight: FontWeight.bold,
                  ),
                ))
          ]),
        ),
      ),
    );
  }
}

class CompanyProfileWidget extends StatelessWidget {
  const CompanyProfileWidget({
    super.key,
    required this.jobs,
  });
  final Job2Data jobs;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            jobs.company.toString(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Divider(
            thickness: 7,
          ),
          RowTextWidget(title: "City", desc: jobs.city.toString()),
          RowTextWidget(title: "Locality", desc: jobs.locality.toString()),
          RowTextWidget(title: "Email", desc: jobs.email.toString()),
          RowTextWidget(title: "Phone Number", desc: jobs.phone.toString()),
          RowTextWidget(title: "Address", desc: jobs.address.toString()),
          RowTextWidget(title: "Staff", desc: jobs.staff.toString()),
          Divider(
            thickness: 7,
          ),
        ],
      ),
    );
  }
}

class JobDetailsWidget extends StatelessWidget {
  const JobDetailsWidget({
    super.key,
    required this.jobs,
  });

  final Job2Data jobs;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            height(10),
            Text(jobs.jobRole.toString(),
                style: TextStyle(
                    color: ThemeColors.darkBlueColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    overflow: TextOverflow.ellipsis)),
            Text("₹${jobs.monthlySalary!.min} - ${jobs.monthlySalary!.max}",
                style: TextStyle(
                    color: ThemeColors.darkBlueColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    overflow: TextOverflow.ellipsis)),
            Divider(
              color: Colors.grey,
            ),
            RowTextWidget(title: "Location", desc: jobs.locality.toString()),
            RowTextWidget(
                title: "Experience",
                desc:
                    "${jobs.experience!.min} - ${jobs.experience!.max} years"),
            RowTextWidget(
                title: "Total Experience", desc: "${jobs.totalExperience}"),
            RowTextWidget(
                title: "Education", desc: jobs.qualification.toString()),
            RowTextWidget(
                title: "Job Timing", desc: jobs.workTiming.toString()),
            RowTextWidget(
                title: "English", desc: jobs.englishSpeaking.toString()),
            RowTextWidget(
                title: "Interview Timing",
                desc: jobs.interviewTiming.toString()),
            RowTextWidget(
                title: "Work From Home", desc: jobs.workFromHome.toString()),
            RowTextWidget(title: "Gender", desc: jobs.gender.toString()),
            RowTextWidget(title: "Recruiter", desc: jobs.recruiter.toString()),
            RowTextWidget(title: "Call From", desc: jobs.callsFrom.toString()),
            height(20),
            Text(
              "Job Info:",
              style: TextStyle(
                  fontSize: Dimensions.fontSizeDefault,
                  fontWeight: FontWeight.bold),
            ),
            height(10),
            Divider(
              color: Colors.grey,
            ),
            Text(jobs.description.toString()),
            height(10),
            Card(
              color: Colors.indigo,
              child: ListTile(
                leading: Icon(
                  Icons.message_outlined,
                  color: Colors.white,
                ),
                title: Text(
                  "Dont pay any money to HR if not mentioned in job details.",
                  style: TextStyle(
                      fontSize: Dimensions.fontSizeSmall, color: Colors.white),
                ),
              ),
            ),
            height(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton.icon(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Colors.indigo))),
                    icon: Icon(
                      Icons.warning_amber,
                    ),
                    label: Text("Report Job")),
                width(10),
                OutlinedButton.icon(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: ThemeColors.darkBlueColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: ThemeColors.darkBlueColor)),
                    ),
                    icon: Icon(
                      Icons.play_arrow_outlined,
                    ),
                    label: Text("Interview Tips"))
              ],
            )
          ]),
    );
  }
}

class RowTextWidget extends StatelessWidget {
  const RowTextWidget({
    super.key,
    required this.title,
    required this.desc,
  });
  final String title, desc;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$title: ",
          style: TextStyle(
              fontSize: Dimensions.fontSizeSmall, fontWeight: FontWeight.w500),
        ),
        Text(
          desc,
          style: TextStyle(
              fontSize: Dimensions.fontSizeExtraSmall,
              fontWeight: FontWeight.w500,
              color: Colors.grey),
        )
      ],
    );
  }
}

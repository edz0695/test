
import '../../../../../../src/src.dart';

class JobCard extends StatelessWidget {
  
  final RecruiterJobData job;
  const JobCard({
    super.key,
    required this.job,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  job.jobRole.toString(),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
               Text(
                  job.workFromHome.toString(),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(icon: Icon(Icons.more_vert), onPressed: () {})
              ]),
             Text(
                job.address.toString(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  // height: 80,
                  // width: 100,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        width: 180,
                        height: 70,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: ThemeColors.darkBlueColor,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("0"),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('Responses till now '),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: ThemeColors.darkBlueColor,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 180,
                        height: 70,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: ThemeColors.darkBlueColor,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("0"),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('Leads in Database '),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: ThemeColors.darkBlueColor,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Posted on: ${job.workTiming}"),
            ],
          ),
        ),
      ),
    );
  }
}

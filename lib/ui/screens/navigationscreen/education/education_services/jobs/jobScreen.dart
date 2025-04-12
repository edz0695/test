import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:payapp/ui/screens/navigationscreen/education/education_services/jobs/singleJob.dart';
import 'package:payapp/ui/widgets/app_bar_widget.dart';


import '../../../../../../themes/colors.dart';
import 'jobjs.dart';

class JobScreen extends StatefulWidget {
  const JobScreen({super.key});

  @override
  State<JobScreen> createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {

  final List<String> cityList = [
    'City name 1',
    'City name 2',
    'City name 3',
    'City name 4',
  ];

  var selectedCity;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const AppBarWidget(title: 'Jobs',size: 55),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 35,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: jobType.length,
                itemBuilder: (_, index){
                  return InkWell(
                    onTap: (){
                      setState(() {
                        selectedJobType.clear();
                        selectedJobType.add(jobType[index]);
                      });
                    },
                    child: Container(
                      height: 35,
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 8, top: 8),
                      decoration: BoxDecoration(
                          color: selectedJobType.contains("${jobType[index]}") ? ThemeColors.primaryBlueColor : Colors.white,
                          borderRadius: BorderRadius.circular(2),
                          border: Border.all(width: 1, color: Colors.grey)
                      ),
                      child: Text("${jobType[index]}",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: selectedJobType.contains("${jobType[index]}") ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 30,),
            if (selectedJobType[0] == "Admit Card") Container(
              margin: EdgeInsets.only(top: size.height*.30),
              child: const InkWell(
                child: Column(
                  children: [
                    Icon(Icons.upload_outlined, color: ThemeColors.primaryBlueColor,),
                    SizedBox(height: 10,),
                    Text("Upload Admit Card"),
                  ],
                ),
              ),
            ) else Expanded(
                  child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${selectedJobType[0]} List",
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                              ),
                            ),
                            InkWell(
                              onTap: ()=>showFilter(),
                              child: const Row(
                                children: [
                                  Text("Filter",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: ThemeColors.primaryBlueColor
                                    ),
                                  ),
                                  Icon(Icons.filter_alt_outlined, color: ThemeColors.primaryBlueColor, size: 20,),
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 20,),

                        Expanded(
                            child: ListView.builder(
                              itemCount: JobsList.jobList.length,
                              itemBuilder: (_, index){
                                return InkWell(
                                  onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>SingleJobs(singleJob: JobsList.jobList[index],))),
                                  child: Container(
                                    margin: const EdgeInsets.only(bottom: 20,left: 5, right: 5),
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              spreadRadius: 3,
                                              blurRadius: 5,
                                              color: ThemeColors.primaryBlueColor.withOpacity(0.1)
                                          )
                                        ]
                                    ),
                                    child: Row(
                                      children: [
                                        Image.network("${JobsList.jobList[index]["image"]}",
                                          height: 100,
                                          width: 100,
                                          fit: BoxFit.cover,
                                        ),
                                        const SizedBox(width: 10,),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("${JobsList.jobList[index]["title"]}",
                                                style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              const SizedBox(height: 3,),
                                              Text("${JobsList.jobList[index]["company"]}",
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              const SizedBox(height: 8,),
                                              richText(leftText: "Salary: ", rightText: "${JobsList.jobList[index]["salary"]}"),
                                              const SizedBox(height: 5,),
                                              richText(leftText: "Job Type: ", rightText: "${JobsList.jobList[index]["type"]}"),

                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            )
                        )

                      ],
                    ),
                )

          ],
        ),
      ),
    );
  }

  richText({required String leftText, required String rightText}){
    return RichText(
        text: TextSpan(
            children: [
              TextSpan(
                  text: "$leftText ",
                  style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.black
                  )
              ),
              TextSpan(
                  text: rightText,
                  style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.black
                  )
              ),

            ]
        ));
  }


  List jobType = [
    "Government Job", "Admit Card","Exam updates", "Private Jobs"
  ];
  List selectedJobType = ["Government Job"];
  final _value = 100.00;

  showFilter(){
    showModalBottomSheet(
        context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(40),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
        builder: (context) {
          return Wrap(
            children:  [
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 10),
                child: Text("Job Type",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 0),
                child: SizedBox(
                  height: 35,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: jobType.length,
                    itemBuilder: (_, index){
                      return Container(
                        height: 35,
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 8, top: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(2),
                          border: Border.all(width: 1, color: Colors.grey)
                        ),
                        child: Text("${jobType[index]}",
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 0),
                child: Text("Select City",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade200,
                          blurRadius: 5,
                          spreadRadius: 2,
                          offset: const Offset(0,1)
                      )
                    ]
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint: Text(
                      'Subject city',
                      style: TextStyle(
                        fontSize: 13,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: cityList
                        .map((String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ))
                        .toList(),
                    value: selectedCity,
                    onChanged: (String? value) {
                      setState(() {
                        selectedCity = value;
                      });
                    },
                    dropdownStyleData: DropdownStyleData(
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                    ),
                    buttonStyleData:  ButtonStyleData(
                        height: 40,
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        overlayColor: WidgetStateProperty.all(Colors.white)
                    ),

                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 20),
                  width: 200,
                  height: 50,
                    decoration: BoxDecoration(
                      color: ThemeColors.primaryBlueColor,
                      borderRadius: BorderRadius.circular(100)
                    ),
                  child: const Center(
                    child: Text("Filter",
                      style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40,),
            ],
          );
        });
  }

}
